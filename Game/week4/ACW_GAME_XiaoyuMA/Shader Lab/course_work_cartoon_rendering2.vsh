vs_1_1						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates


def c30, 0, 0.5, 0.5, 1.0

////Do Vertices Stuff////
m4x4 r0, v0, c0		// new position -> r0
m3x4 r1, v4, c0		// new normal	-> r1
/////////////////////////

sub r2, c5, r0		//light vextor
dp3 r3, r2, r2
rsq r3.w, r3.w
mul r2, r2, r3.w      //Ldir

dp3 r3, r1, r2
max r4, c30.x, r3
mov oT0.x, r4.x
mov oT0.y, c30.x


////Do Colour Stuff////
mov oD0, c4					// send ambient colour to the diffuse colour output reg
//mov oT0, v8					// send the default texture coords to the texture output reg
mov oPos,r0
//////////////////////