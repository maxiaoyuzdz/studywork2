vs_2_0						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

def c12, 20, 85, 4,0.66   //reflection plan

////Do Vertices Stuff////
m4x4 r0, v0, c0		// new position -> r0
m4x4 r1,v4, c0		// new normal	-> r1
/////////////////////////

rcp r2.x, c12.z  // 1/4
mul r3.x, r0.x, r2.x // r0.x/4 
add r3.x, r3.x, c12.x


mov r2, r0
rcp r2.w,r2.w
mul r3, r2.xyz, r2.w //r3=pos

nrm r4, r1 //
nrm r5, r4 // nrm( nrm( r1))  4x4

mov r6, r0
mov r6.y, c20.y






////Do Colour Stuff////
//mov oD0, c7					// send ambient colour to the diffuse colour output reg
mov oT0, v8					// send the default texture coords to the texture output reg
mov oPos,r0
//////////////////////