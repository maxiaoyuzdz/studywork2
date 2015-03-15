      
vs_1_1						// version instruction

// declare register data, which is fixed, can not change
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

m4x4 r0, v0, c0 // new position
m3x3 r1,v4, c0  //new normal


sub r3, c5,r0 //get reflict light vector
dp3 r4,r3,r3  //
rsq r4,r4     //  1/|a|
mul r3,r3,r4 //get unit vector
dp3 r5,r3,r1 //  

mov r10,c4
mul r10,r10,r5  // color * nor
mov oD0, r10
mov oT0, v8
mov oPos,r0





















