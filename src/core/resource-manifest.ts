export type ResourceLiteral = string | number | boolean | ResourceLiteral[] | { [key: string]: ResourceLiteral };
export interface ResourceManifestEntry {
  directive: 'resource' | 'resourcedef' | 'resourceref'; type: string; name: string; line: number;
  parameters: Record<string, ResourceLiteral>; unresolvedFields: string[];
}
export interface ResourceDeclaration { directive: string; type: string; name: string; line: number; fields: Record<string, string | number | boolean>; }
interface Token { value: string; kind: 'word' | 'string' | 'symbol'; line: number; }
/** Static reader for the literal resource DSL. It preserves definitions,
 * references and nested source lists without executing Lua expressions. */
export function readResourceManifest(source: string): ResourceManifestEntry[] {
  const tokens: Token[] = []; let p = 0, line = 1;
  while (p < source.length) {
    const c = source[p];
    if (/\s/.test(c)) { if (c === '\n') line++; p++; continue; }
    if (source.startsWith('--', p)) {
      const long = /^--\[(=*)\[/.exec(source.slice(p));
      const end = long ? source.indexOf(']' + long[1] + ']', p + long[0].length) : source.indexOf('\n', p);
      const next = end < 0 ? source.length : long ? end + long[1].length + 2 : end;
      line += (source.slice(p, next).match(/\n/g) ?? []).length; p = next; continue;
    }
    const longString = /^\[(=*)\[/.exec(source.slice(p));
    if (longString) {
      const start = p + longString[0].length, end = source.indexOf(']' + longString[1] + ']', start);
      if (end < 0) throw new Error(`资源声明长字符串截断，行 ${line}`);
      const next = end + longString[1].length + 2;
      tokens.push({ value: source.slice(start, end).replace(/^\r?\n/, ''), kind: 'string', line });
      line += (source.slice(p, next).match(/\n/g) ?? []).length; p = next; continue;
    }
    if (c === '"' || c === "'") {
      const startLine = line; let value = ''; p++; let closed = false;
      while (p < source.length) {
        const ch = source[p++]; if (ch === c) { closed = true; break; }
        if (ch === '\\') {
          const next = source[p++], escapes: Record<string, string> = { n: '\n', r: '\r', t: '\t', '\\': '\\', '"': '"', "'": "'" };
          if (!(next in escapes)) throw new Error(`未经支持的 Lua 字符串转义，行 ${line}`);
          value += escapes[next];
        } else { if (ch === '\n') line++; value += ch; }
      }
      if (!closed) throw new Error(`资源声明字符串截断，行 ${startLine}`);
      tokens.push({ value, kind: 'string', line: startLine }); continue;
    }
    const number = /^(?:0x[0-9a-f]+|(?:\d+(?:\.\d*)?|\.\d+)(?:e[+-]?\d+)?)/i.exec(source.slice(p));
    if (number) { tokens.push({ value: number[0], kind: 'word', line }); p += number[0].length; continue; }
    const word = /^[\w.]+/.exec(source.slice(p));
    if (word) { tokens.push({ value: word[0], kind: 'word', line }); p += word[0].length; }
    else { tokens.push({ value: c, kind: 'symbol', line }); p++; }
  }
  const symbol = (at: number, value: string) => tokens[at]?.kind === 'symbol' && tokens[at]?.value === value;
  const delimiter = (at: number) => symbol(at, ',') || symbol(at, ';') || symbol(at, '}');
  const numeric = /^(?:0x[0-9a-f]+|(?:\d+(?:\.\d*)?|\.\d+)(?:e[-+]?\d+)?)$/i;
  function arithmetic(at: number, precedence = 0, depth = 0): { value: number; next: number } | null {
    if (depth > 64) throw new Error('资源常量表达式嵌套深度超限');
    let left: { value: number; next: number } | null;
    if (symbol(at, '+') || symbol(at, '-')) {
      left = arithmetic(at + 1, 3, depth + 1);
      if (left && symbol(at, '-')) left.value = -left.value;
    } else if (symbol(at, '(')) {
      left = arithmetic(at + 1, 0, depth + 1);
      if (!left || !symbol(left.next, ')')) return null;
      left.next++;
    } else if (tokens[at]?.kind === 'word' && numeric.test(tokens[at].value)) left = { value: Number(tokens[at].value), next: at + 1 };
    else return null;
    if (!left) return null;
    for (;;) {
      const op: Token | undefined = tokens[left.next];
      const rank: number = op?.kind === 'symbol' ? ({ '+': 1, '-': 1, '*': 2, '/': 2 } as Record<string, number>)[op.value] : 0;
      if (!rank || rank <= precedence) return left;
      const right = arithmetic(left.next + 1, rank, depth + 1);
      if (!right) return null;
      left = { value: op.value === '+' ? left.value + right.value : op.value === '-' ? left.value - right.value : op.value === '*' ? left.value * right.value : left.value / right.value, next: right.next };
    }
  }
  function skipValue(at: number): number {
    let braces = 0, parentheses = 0, brackets = 0;
    for (; at < tokens.length; at++) {
      if (!braces && !parentheses && !brackets && delimiter(at)) return at;
      if (symbol(at, '{')) braces++; else if (symbol(at, '}')) braces--;
      if (symbol(at, '(')) parentheses++; else if (symbol(at, ')')) parentheses--;
      if (symbol(at, '[')) brackets++; else if (symbol(at, ']')) brackets--;
    }
    return at;
  }
  function literal(at: number, depth = 0, soundSugar = false): { value?: ResourceLiteral; next: number; known: boolean } {
    if (depth > 64) throw new Error('资源声明嵌套深度超限');
    const token = tokens[at]; if (!token) return { next: at, known: false };
    if (token.kind === 'string') return { value: token.value, next: at + 1, known: true };
    // Literal atlas UV constants use leading-dot decimals and arithmetic.
    // This bounded numeric grammar never runs Lua or resolves identifiers.
    const constant = arithmetic(at);
    if (constant) return { ...constant, known: Number.isFinite(constant.value) };
    if (token.kind === 'word') {
      if (soundSugar && ['LOOP', 'NOLOOP', 'STREAM', 'NOSTREAM', 'PRELOAD', 'NOPRELOAD'].includes(token.value)) return { value: token.value, next: at + 1, known: true };
      if (token.value === 'true' || token.value === 'false') return { value: token.value === 'true', next: at + 1, known: true };
    }
    if (!symbol(at, '{')) return { next: skipValue(at), known: false };
    const list: ResourceLiteral[] = [], fields: Record<string, ResourceLiteral> = Object.create(null); let keyed = false, positional = false, known = true;
    let next = at + 1;
    while (next < tokens.length && !symbol(next, '}')) {
      if (symbol(next, ',') || symbol(next, ';')) { next++; continue; }
      const key = tokens[next].kind === 'word' && symbol(next + 1, '=') ? tokens[next].value : null;
      if (key !== null) { keyed = true; next += 2; } else positional = true;
      const item = literal(next, depth + 1, soundSugar);
      const complete = item.known && delimiter(item.next); known &&= complete;
      if (complete) { if (key !== null) fields[key] = item.value!; else list.push(item.value!); }
      next = complete ? item.next : skipValue(next);
    }
    if (!symbol(next, '}')) throw new Error(`资源声明表截断，行 ${token.line}`);
    if (keyed && positional && soundSugar) list.forEach((value, i) => { fields[String(i + 1)] = value; });
    return { value: keyed ? fields : list, next: next + 1, known: known && (!(keyed && positional) || soundSugar) };
  }
  const entries: ResourceManifestEntry[] = [];
  for (let i = 0; i < tokens.length; i++) {
    const t = tokens[i];
    if (t.kind === 'word' && t.value === 'soundDefResources' && symbol(i + 1, '{')) {
      const shared = literal(i + 1, 0, true), defs = literal(shared.next, 0, true);
      if (!shared.known || !defs.known || typeof defs.value !== 'object' || Array.isArray(defs.value)) throw new Error(`未解析的 soundDefResources 声明，行 ${t.line}`);
      const sharedFields = soundFlags(shared.value!);
      for (const [name, value] of Object.entries(defs.value)) {
        const fields = soundSource(value);
        const parameters = { ...sharedFields, ...soundFlags(fields) };
        if (Object.keys(parameters).some(key => /^\d+$/.test(key))) throw new Error(`soundDefResources ${name}: unrecognized setting`);
        entries.push({ directive: 'resource', type: 'SoundDef', name, line: t.line, parameters, unresolvedFields: [] });
      }
      i = defs.next - 1; continue;
    }
    if (t.kind !== 'word' || !['resource', 'resourcedef', 'resourceref'].includes(t.value) || tokens[i + 1]?.kind !== 'string' || tokens[i + 2]?.kind !== 'string') continue;
    const entry: ResourceManifestEntry = { directive: t.value as ResourceManifestEntry['directive'], type: tokens[i + 1].value, name: tokens[i + 2].value, line: t.line, parameters: Object.create(null), unresolvedFields: [] };
    if (entry.directive === 'resourceref') { entries.push(entry); i += 2; continue; }
    if (!symbol(i + 3, '{')) continue;
    let j = i + 4;
    while (j < tokens.length && !symbol(j, '}')) {
      if (symbol(j, ',') || symbol(j, ';')) { j++; continue; }
      if (tokens[j].kind !== 'word' || !symbol(j + 1, '=')) { entry.unresolvedFields.push(`line:${tokens[j].line}`); j = skipValue(j); continue; }
      const key = tokens[j].value, start = j + 2, value = literal(start);
      if (value.known && delimiter(value.next)) { entry.parameters[key] = value.value!; j = value.next; }
      else { entry.unresolvedFields.push(key); j = skipValue(start); }
    }
    if (!symbol(j, '}')) throw new Error(`资源声明表截断，行 ${t.line}`);
    entries.push(entry); i = j;
  }
  return entries;
}

function soundTable(value: ResourceLiteral): Record<string, ResourceLiteral> {
  return Array.isArray(value) ? Object.fromEntries(value.map((v, i) => [String(i + 1), v])) : typeof value === 'object' ? value : { '1': value };
}
/** Original soundDefResources helpers: individual settings override shared
 * settings, only individual definitions accept source/count shorthand. */
function soundSource(value: ResourceLiteral): Record<string, ResourceLiteral> {
  const table = soundTable(value), result: Record<string, ResourceLiteral> = Object.fromEntries(Object.entries(table).filter(([key]) => !/^\d+$/.test(key)));
  let index = 1;
  for (const [key, v] of Object.entries(table)) if (/^\d+$/.test(key)) {
    if (typeof v === 'string' && result.source === undefined) result.source = v;
    else if (typeof v === 'number' && result.instanceLimit === undefined) result.instanceLimit = v;
    else result[String(index++)] = v;
  }
  return result;
}
function soundFlags(value: ResourceLiteral): Record<string, ResourceLiteral> {
  const result: Record<string, ResourceLiteral> = {};
  const flags: Record<string, [string, boolean]> = { LOOP: ['looping', true], NOLOOP: ['looping', false], STREAM: ['streaming', true], NOSTREAM: ['streaming', false], PRELOAD: ['preload', true], NOPRELOAD: ['preload', false] };
  for (const [key, v] of Object.entries(soundTable(value))) {
    if (/^\d+$/.test(key) && typeof v === 'string') {
      if (!flags[v]) throw new Error(`Unrecognized flag "${v}"`);
      const [name, enabled] = flags[v]; result[name] = enabled;
    } else result[key] = v;
  }
  return result;
}
/** Existing shader/material readers use the top-level scalar projection.
 * References have no definition parameters and are exposed by the manifest. */
export function readResourceDeclarations(source: string): ResourceDeclaration[] {
  return readResourceManifest(source).filter(e => e.directive !== 'resourceref').map(e => ({
    directive: e.directive, type: e.type, name: e.name, line: e.line,
    fields: Object.fromEntries(Object.entries(e.parameters).filter(([, value]) => typeof value !== 'object')) as ResourceDeclaration['fields'],
  }));
}
