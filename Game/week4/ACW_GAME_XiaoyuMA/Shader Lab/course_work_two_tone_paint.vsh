vs_1_1						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

def c30, 0.5,1,0,0

////Do Vertices Stuff////
m4x4 r0, v0, c0		// new position -> r0
m3x3 r1,v4, c0		// new normal	-> r1
/////////////////////////

////Do Colour Stuff////
//Diffuse Lighting  = sum [ Cd * Ld * (N.Ldir) * Atten]
sub r2, c5, r0		//get reflict light vector -> r2 contain a vector
dp3 r3.w, r2, r2		// a.a = |a|*|a|
rsq r3.w, r3.w			//  1/|a| = 1 / square( |a|*|a| )
mul r3, r3.w, r2		// get unit vector = Ldir = unite vector from vertex to light

dp3 r4.w, r3, r1		// (N.Ldir)   N -> r1  Ldir -> r3  

mul r5, r4.w, c4

sge r5.z, r0.x, c30.x



mov oD0, r5




////Do Colour Stuff////
//mov oD0, c7					// send ambient colour to the diffuse colour output reg
mov oT0, v8					// send the default texture coords to the texture output reg
mov oPos,r0
//////////////////////