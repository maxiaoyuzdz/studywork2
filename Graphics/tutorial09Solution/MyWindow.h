#pragma once

#include "GXBase.h"
#include "Vector4f.h"
#include "Color.h"
#include "Materials.h"
#include "Lights.h"
#include "Sphere.h"
#include "MySphere.h"
#include "MyCylinder.h"

using namespace gxbase;


class MyWindow :public GLWindow {
private:
	// OpenGL objects
	Lights _light1, _light2, _light3;
	Materials _material1, _material2, _material3;
	Sphere _sphere1; //, _sphere2;
	MySphere _sphere;
	MyCylinder _cylinder;

	// Simulation data
	const float _angleInc;
	float _angle;
	float _cameraAngle, _cameraPosition, _cameraRotation;
	bool _leftDown, _rightDown, _fullscreen;
	Image _images[7];
	GLuint _textures[7];

public:
	MyWindow();
	void OnCreate();
	void floor() const;
	void texcube() const;
	void OnDisplay();
	void OnIdle();
	void OnResize(int w, int h);
	void OnKeyboard(int key, bool down);
	void OnMouseButton(MouseButton button, bool down);
	void OnMouseMove(int x, int y);
};

