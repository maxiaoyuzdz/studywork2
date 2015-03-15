      
vs_1_1						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

////Do Vertices Stuff////
m4x4 oPos, v0, c0			// transform local space to world space
/////////////////////////

////Do Colour Stuff////
mov oD0, c7					// send ambient colour to the diffuse colour output reg
mov oT0, v8					// send the default texture coords to the texture output reg
//////////////////////