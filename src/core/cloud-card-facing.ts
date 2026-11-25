import { MAX_CLOUD_CARDS } from './cloud-card-layout';

const f = Math.fround;
// Original constant at 0x100aa78c4, tested against LENGTH (not length squared).
export const CLOUD_CARD_DIRECTION_EPSILON = f(1e-5);

// Original 0x100220bd0..0x100220c73. The camera point is transformed through
// each sorted card's stored inverse world matrix. All four lanes are retained;
// a negative local Y flips all signs, including W and signed zero.
export function cloudCardFacingPlan(inverseWorlds: number[][], visibleOrder: number[], eye: number[]) {
  if (inverseWorlds.length > MAX_CLOUD_CARDS || eye.length !== 3 || !eye.every(v => Number.isFinite(f(v))) ||
      visibleOrder.length > inverseWorlds.length || new Set(visibleOrder).size !== visibleOrder.length ||
      visibleOrder.some(i => !Number.isInteger(i) || i < 0 || i >= inverseWorlds.length))
    throw new Error('CloudCard 相机朝向输入无效');
  return visibleOrder.map(sourceIndex => {
    const matrix = inverseWorlds[sourceIndex];
    if (matrix.length !== 16 || !matrix.every(v => Number.isFinite(f(v)))) throw new Error('CloudCard 逆矩阵无效');
    const m = matrix.map(f), point = eye.map(f);
    let direction = [0,1,2,3].map(row => f(f(f(f(point[0]*m[row]) + f(point[1]*m[4+row])) + f(point[2]*m[8+row])) + m[12+row]));
    const squares = direction.map(v=>f(v*v));
    const length = f(Math.sqrt(f(squares[2] + f(squares[0] + squares[1]))));
    if (length > CLOUD_CARD_DIRECTION_EPSILON)
      // After vpermilpd and scalar reduction, lane 3 contains local Y squared.
      // Preserve that original fourth-lane denominator instead of forcing W=1.
      direction = direction.map((v,i)=>f(v/(i===3?squares[1]:length)));
    if (direction[1] < 0) direction = direction.map(v=>-v);
    // The original fourth lane can be infinite when local Y is zero. It is
    // scratch direction data, not a homogeneous position forced to W=1.
    if (!direction.slice(0,3).every(Number.isFinite)) throw new Error('CloudCard 局部相机方向不能用于渲染');
    return { sourceIndex, direction };
  });
}
