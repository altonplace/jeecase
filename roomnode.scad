//Created by Michael Anderson 12-9-2013

//Roomnode case for Jeenode v6 and roomboard v2
jeeNodeW = 21.3;
jeeNodeL = 81;
jeeNodeH = 1.6;

//Connectors/Components

CpW = 2.5;
CpL = 15.6;
CpH = 9;

Cp4X = 0;			
Cp4Y = 18.6;
Cp4Z = jeeNodeH;

Cp3X = 0;			
Cp3Y = 46.8;
Cp3Z = jeeNodeH;

Cp2X = jeeNodeW-CpW;		
Cp2Y = 46.8;
Cp2Z = jeeNodeH;

Cp1X = jeeNodeW-CpW;			
Cp1Y = 18.6;
Cp1Z = jeeNodeH;

//
module jeeNode(){

	union(){
	//board
	cube ([jeeNodeW, jeeNodeL, jeeNodeH]);
	//headers
	translate([Cp4X, Cp4Y, Cp4Z]) cube ([CpW, CpL, CpH]);
	translate([Cp3X, Cp3Y, Cp3Z]) cube ([CpW, CpL, CpH]);
	translate([Cp2X, Cp2Y, Cp2Z]) cube ([CpW, CpL, CpH]);
	translate([Cp1X, Cp1Y, Cp1Z]) cube ([CpW, CpL, CpH]);
	};

};


jeeNode();
