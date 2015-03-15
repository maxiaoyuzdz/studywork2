vs_2_0						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

def c12,0.5,2,0.3,0
def c13, 1.5,1.5,1.5,7

////Do Vertices Stuff////
m4x4 r0, v0, c0		// new position -> r0
m3x4 r1,v4, c0		// new normal	-> r1
/////////////////////////
//nrm r2, r1
//sub r3, c9, r0
//nrm r4, r3
//dp3 r2, r2, r4
nrm r4, c11
nrm r2, r1
dp3 r2, r2, r4

///key
slt r2.w, r2.x, c12.x
slt r2.z, -r2.x, -c12.x
slt r2.y, -r2.x, -c12.z


mul r2.x, r2.x, r2.w
mad r2.x, r2.x, c12.y, r2.z
mul r2.x, r2.x, r2.y

//mad r2, r2, c13.w, -c13 


mul oD0, r2.x, c4





////Do Colour Stuff////
//mov oD0, c7					// send ambient colour to the diffuse colour output reg
mov oT0, v8					// send the default texture coords to the texture output reg
mov oPos,r0
//////////////////////