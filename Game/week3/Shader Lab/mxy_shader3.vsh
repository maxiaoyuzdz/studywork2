      
vs_1_1						// version instruction

// declare register data, which is fixed, can not change
dcl_position v0             // v0 is position
dcl_normal v4               // v4 is normal
dcl_texcoord0 v8            // v8 is texture coordinates

#define globalWorldMatrix c0
#define originalVecPosition v0
#define originalVecNormal	v4
#define originalTexCoords	v8

#define originalLightPosition c5

#define temVecPos r0
#define temVecNor r1
#define temLightReflectVector r2
#define temDotProductForReflectLight r3
#define valueOfReflectLight_daoshu	r4
#define cosAngleOf1	r5

#define tem2	r6
#define tem3	r7


m4x4 temVecPos, originalVecPosition, globalWorldMatrix							//vertex position transform
m4x4 temVecNor, originalVecNormal, globalWorldMatrix							//vertex normalise tansform

sub temLightReflectVector, originalLightPosition, temVecPos						// reflect light vector = lightPosition - vertexPosition  3D
dp3 temDotProductForReflectLight, temLightReflectVector,temLightReflectVector	//temDotProductForReflectLight = temLightReflectVector * temLightReflectVector
rsq valueOfReflectLight_daoshu, temDotProductForReflectLight							//valueOfReflectLight_daoshu = 1 / square ( temDotProductForReflectLight )

mul cosAngleOf1, temLightReflectVector, valueOfReflectLight_daoshu
dp3	tem2, cosAngleOf1,temVecNor

mul tem3, tem2, originalVecNormal
mov oD0, tem3
mov oT0, v8
mov oPos,temVecPos









