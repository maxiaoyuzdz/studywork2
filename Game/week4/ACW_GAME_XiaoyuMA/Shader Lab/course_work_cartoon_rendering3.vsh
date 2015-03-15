vs_1_1						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates


def c30, 0, 0.5, 0.5, 1.0

////Do Vertices Stuff////
m4x4 oPos, v0, c0		// new position -> r0
m3x4 r7, v4, c0			// new normal	-> r7
/////////////////////////

mov oD0, c4
sub r0, c5, v0

//r1=normalize r0
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r1, r1.w, r0.xyz

//tex0.x = r1 dot n
dp3 oT0.x, r1, v4 
dp3 oT1.x, r1, v4

