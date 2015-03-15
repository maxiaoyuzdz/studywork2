// OpenMP Basics.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <math.h>

using namespace std;

//number of loops  = 999
const int loopSize = 999;

void main(int argc, char** argv)
{
	float result;

	for(int index = 0; index < loopSize; index++)
	{
		result = sqrt((float)index);
	}


	cout<<"Finished result = "<<result<<endl;
	
	//==
	int pause;
	cin>> pause;
}




