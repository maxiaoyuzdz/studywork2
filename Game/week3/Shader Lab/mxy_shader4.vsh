      
vs_1_1						// version instruction

// declare register data, which is fixed, can not change
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates



m4x4 r0, v0, c0 //position
m4x4 r1, v4, c0

sub r2, c5, r0 // vlight
dp3 r3,r2,r2
rsq r3,r3 // 1/|a|

dp3 r4,r1,r1
rsq r4,r4  //1/|b|

mul r4, r4, r3



















