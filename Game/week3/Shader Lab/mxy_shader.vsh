      
vs_1_1						// version instruction

// declare register data, which is fixed, can not change
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates



////Do Vertices Stuff////
m4x4 oPos, v0, c0		// transform local space to world space
m4x4 r0, v4, c0			// transform normal
/////////////////////////


////Do Colour Stuff////
mov r1,c4		//get diffuse color
add r1,r1,c7	//get blend color

//reuse the current pos of vertex
m4x4 r2, v0,c0	//r2 = oPos
dp3 r3, r2, c5




//mov oD0, c7					// send ambient colour to the diffuse colour output reg
mov oD0, r1
mov oT0, v8					// send the default texture coords to the texture output reg
//////////////////////