import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
export const digest = (b: Buffer) => crypto.createHash('sha256').update(b).digest('hex');
export function assetPath(root: string, relative: string) { if (path.isAbsolute(relative)) throw new Error('资源必须使用相对路径'); const realRoot = fs.realpathSync(root), resolved = fs.realpathSync(path.resolve(realRoot, relative)), rel = path.relative(realRoot, resolved); if (rel.startsWith('..' + path.sep) || rel === '..' || path.isAbsolute(rel)) throw new Error('资源路径越界'); return resolved; }
export function saveAtomic(filename: string, sourceHash: string, bytes: Buffer) {
  const old = fs.readFileSync(filename); if (digest(old) !== sourceHash) throw new Error('文件已被其他程序修改。请重新打开地图后再编辑，避免覆盖外部更改。');
  const backupDir = path.join(path.dirname(filename), '.sky-editor-backups'); fs.mkdirSync(backupDir, { recursive: true });
  const suffix = new Date().toISOString().replace(/[:.]/g, '-') + '-' + crypto.randomBytes(4).toString('hex'); const backup = path.join(backupDir, path.basename(filename) + '.' + suffix + '.bak');
  fs.writeFileSync(backup, old, { flag: 'wx' });
  const temporary = filename + '.' + suffix + '.tmp';
  try { const fd = fs.openSync(temporary, 'wx'); try { fs.writeFileSync(fd, bytes); fs.fsyncSync(fd); } finally { fs.closeSync(fd); }
    // Recheck after preparing the replacement, including the original backup.
    if (digest(fs.readFileSync(filename)) !== sourceHash) throw new Error('保存期间原文件发生变化，已取消覆盖。');
    fs.renameSync(temporary, filename);
  } finally { if (fs.existsSync(temporary)) fs.unlinkSync(temporary); }
  return { backup, hash: digest(bytes) };
}
