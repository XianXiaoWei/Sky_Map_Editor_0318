import {createHash} from 'node:crypto';
// Audited original vertex stages: xyz is transformed only by u_model and
// u_viewProj; neither stage animates/deforms positions or writes them later.
// File names alone are insufficient when custom shader assets are loaded.
const staticVertexHashes=new Set([
 'd6d57072f065cdcb7691109774f6b977d9118b7b8217bd61ba63d7b449e971b8', // Mesh0
 '0b4695043cc2bd5b929e929c5ae848c477ece031dfa6b98eadb46ecef9f4bc53', // Mesh27454 / MeshSh
]);
export function staticModelVertexVerified(source:string){return staticVertexHashes.has(createHash('sha256').update(source).digest('hex'));}
