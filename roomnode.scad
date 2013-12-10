//Created by Michael Anderson 12-9-2013

//Roomnode case for Jeenode v6 and roomboard v2
jeeNodeW = 21.3;
jeeNodeL = 81;
jeeNodeH = 1.6;

	//Connectors/Components
	
		//Headers
		CpW = 2.5;
		CpL = 15.6;
		CpH = 9;
		
		Cp4X = jeeNodeL-jeeNodeL;			
		Cp4Y = jeeNodeL-62.4;
		Cp4Z = jeeNodeH;
		
		Cp3X = jeeNodeL-jeeNodeL;			
		Cp3Y = jeeNodeL-34.2;
		Cp3Z = jeeNodeH;
		
		Cp2X = jeeNodeW-CpW;		
		Cp2Y = jeeNodeL-34.2;
		Cp2Z = jeeNodeH;
		
		Cp1X = jeeNodeW-CpW;			
		Cp1Y = jeeNodeL-62.4;
		Cp1Z = jeeNodeH;
	
		//Atmega
		Cat328W = 10;
		Cat328L = 35.5;
		Cat328H = 8.7;
		Cat328X = (jeeNodeW - Cat328W) /2;
		Cat328Y = jeeNodeL-58;
		Cat328Z = jeeNodeH;
		
		//Power Components
		CpwrW = jeeNodeW;
		CpwrL = 9;
		CpwrH = 7.5;
		CpwrX = jeeNodeL-jeeNodeL;
		CpwrY = jeeNodeL-14.2;
		CpwrZ = jeeNodeH;
		
		//FTDI Connector
		CftdiW = 15;
		CftdiL = 10.3;
		CftdiH = 2.5;
		CftdiX = (jeeNodeW - CftdiW) /2;
		CftdiY = jeeNodeL - 2.3;
		CftdiZ = jeeNodeH;
		
		//Radio
		Crf12W = 16;
		Crf12L = Crf12W;
		Crf12H = 2;
		Crf12X = (jeeNodeW - Crf12W) /2;
		Crf12Y = jeeNodeL-jeeNodeL;
		Crf12Z = jeeNodeH;
// Room board
	rbHeaderW	= CpW;
	rbHeaderL = CpL;
	rbHeaderH = 2;
	
	roomBoardW = 21.8;
	roomBoardL = 21;
	roomBoardH = 5;
	
	//PIR
		pirW = 32.2;
		pirL = 24;
		pirH = 1.3;
		
		pirHeaderW = 7.8;
		pirHeaderL = 2.5;
		pirHeaderH = 2.7;
		
		 



//roomBoard Orientation
//C PIR2 towards antenna
roomBoardOrientationX = Cp2X;
roomBoardOrientationY = Cp2Y;



// jeenode board
module jeeNode(){

	union(){
	//board
	makeCube (0,0,0,jeeNodeW, jeeNodeL, jeeNodeH,"green");
	//headers
	makeCube (Cp4X, Cp4Y, Cp4Z, CpW, CpL, CpH, "black");
	makeCube (Cp3X, Cp3Y, Cp3Z, CpW, CpL, CpH, "black");
	makeCube (Cp2X, Cp2Y, Cp2Z, CpW, CpL, CpH, "black");
	makeCube (Cp1X, Cp1Y, Cp1Z, CpW, CpL, CpH, "black");
	//Atmega	
	makeCube (Cat328X, Cat328Y, Cat328Z, Cat328W, Cat328L, Cat328H, "gray");
 	//Power Components
	makeCube (CpwrX, CpwrY, CpwrZ, CpwrW, CpwrL, CpwrH, "orange");
	//FTDI Pins
	makeCube (CftdiX, CftdiY, CftdiZ, CftdiW, CftdiL, CftdiH);
	//rf12
	makeCube (Crf12X, Crf12Y, Crf12Z, Crf12W, Crf12L, Crf12H, "lightgreen");
	};
	
};

module roomBoard(){
	union(){
		makeCube(roomBoardOrientationX, roomBoardOrientationY, jeeNodeH + CpH, rbHeaderW, rbHeaderL, rbHeaderH, "orange");
		makeCube(roomBoardOrientationX+(jeeNodeW-CpW), roomBoardOrientationY, jeeNodeH + CpH, rbHeaderW, rbHeaderL, rbHeaderH, "orange");
		makeCube(roomBoardOrientationX-.8, roomBoardOrientationY - 2.5, jeeNodeH + CpH+rbHeaderH, roomBoardW, roomBoardL, roomBoardH, "orange");
		makeCube((roomBoardW-pirHeaderW)/2,roomBoardL-pirHeaderL, roomBoardH+jeeNodeH+CpH+rbHeaderH, pirHeaderW, pirHeaderL, pirHeaderH, "pink");
	
	};
};


module makeCube(x,y,z,w,l,h,c){
translate([x, y, z]) color(c) cube ([w, l, h]);

};



jeeNode();
roomBoard();
