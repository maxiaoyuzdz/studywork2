vs_1_1						// version instruction

// declare register data
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

////Do Vertices Stuff////
m4x4 r0, v0, c0		// new position -> r0
m3x3 r1,v4, c0		// new normal	-> r1
/////////////////////////

////Do Colour Stuff////
//Diffuse Lighting  = sum [ Cd * Ld * (N.Ldir) * Atten]
sub r2, c5, r0		//get reflict light vector -> r2 contain a vector
dp3 r3, r2, r2		// a.a = |a|*|a|
rsq r3, r3			//  1/|a| = 1 / square( |a|*|a| )
mul r3, r3, r2		// get unit vector = Ldir = unite vector from vertex to light
dp3 r4, r3, r1		// (N.Ldir)   N -> r1  Ldir -> r3  
mul r4, r4, c4		// (N.Ldir) * c4
add oD0, r4, c7		//
//mul oD0, c4, r4		// Cd= C4 * NoLd * r5 = (N.Ldir) * NoAtten => oD0

// r0 -> vPos  r1-> vNormal  r2 -> Vector  r3 -> Ldir r4 -> (N.Ldir)
// Atteni = 1 / ( att0i + att1i *di + att2i * di2)
////////////////////////
// specular lighting = Cs * sum[ Ls * (N.H)P * Atten]
// output to oD1
// H = norm(norm(Cp - Vp) + Ldir)
sub r5, c9, r0	//r5 = ( Cp - Vp )
dp3 r6, r5, r5  // (r5,r5)
rsq r6, r6
mul r6, r5, r6	//
add r5, r6, r3	// (norm(Cp-Vp) + Ldir)
dp3 r6, r5, r5
rsq r6,r6
mul r6, r5, r6  //norm(norm(Cp-Vp) + Ldir) = H

// (N.H)
dp3 r6, r6, r1  // r6 -> (N.H)
//(N.H)P strat
//mul r6, r6, r6
//(N.H)P end

//mul r6, r6, c6	// Ls * (N.H)P
mul oD1, r6, c6
//mul oD1, r6, c7

mov oT0, v8
mov oPos,r0