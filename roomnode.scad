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
	rbHeader1X = Cp4X;
	rbHeader1Y = Cp4Y;
	rbHeader1Z = jeeNodeH + CpH;
	rbHeader2X = Cp4X+(jeeNodeW-CpW);
	rbHeader2Y = Cp4Y;
	rbHeader2Z = jeeNodeH + CpH;

	
	roomBoardW = 21.8;
	roomBoardL = 21;
	roomBoardH = 1.6;
	roomBoardX = Cp4X - .8;
	roomBoardY = Cp4Y - 2.5;
	roomBoardZ = jeeNodeH + CpH + rbHeaderH;
	
//PIR
	
	pirHeaderW = 7.8;
	pirHeaderL = 2.5;
	pirHeaderH = 2.7;
	pirHeaderX = Cp4X + (roomBoardW - pirHeaderW) / 2;
	pirHeaderY = Cp4Y-pirHeaderL;
	pirHeaderZ = roomBoardH+jeeNodeH+CpH+rbHeaderH;

	pirW = 32.2;
	pirL = 24;
	pirH = 1.3;
	pirX = Cp4X+(roomBoardW-pirW)/2;
	pirY = Cp4Y-pirL;
	pirZ = roomBoardH+jeeNodeH+CpH+rbHeaderH+pirHeaderH;

//jeeCase Bottom
	
	jeeNodeGap = 3; //offset from jeeNode
	wallThick = 4; //Wall thickness of case
	bottomGap = 1.5; //space under board for solder points
	caseHeight = pirZ+pirH+wallThick+bottomGap; //height of case


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
		//room board 
		//header 1
		makeCube(rbHeader1X, rbHeader1Y, rbHeader1Z, rbHeaderW, rbHeaderL, rbHeaderH, "orange");
		//header 2
		makeCube(rbHeader2X,rbHeader2Y,rbHeader2Z , rbHeaderW, rbHeaderL, rbHeaderH, "orange");
		//roomboard
		makeCube(roomBoardX, roomBoardY, roomBoardZ, roomBoardW, roomBoardL, roomBoardH, "orange");

	};
};

module pir(){
		//pir Header
		makeCube(pirHeaderX, pirHeaderY, pirHeaderZ, pirHeaderW, pirHeaderL, pirHeaderH, "pink");
		//pir Board
		makeCube(pirX, pirY, pirZ, pirW, pirL, pirH, "pink");

};

module makeCube(x,y,z,w,l,h,c){

translate([x, y, z]) color(c) cube ([w, l, h]);

};

module jeeCaseBottom(){

	caseBottomX = -jeeNodeGap - wallThick;
	caseBottomY = -jeeNodeGap - wallThick;
	caseBottomZ = -bottomGap - wallThick;  //1.5 is board offset for solder points
	caseBottomW = jeeNodeW + jeeNodeGap*2 + wallThick*2;
	caseBottomL = jeeNodeL + jeeNodeGap*2 + wallThick*2;
	caseBottomH = caseHeight;
	caseBottomNegX = -jeeNodeGap;
	caseBottomNegY = -jeeNodeGap;
	caseBottomNegZ = -bottomGap;
	caseBottomNegW = jeeNodeW + jeeNodeGap*2;
	caseBottomNegL = jeeNodeL + jeeNodeGap*2;
	caseBottomNegH = caseHeight;
	ftdiOffset = 3; //amount of space around ftdi
	pirOffset = 1.5;
	difference(){
		//full size cube
		makeCube(caseBottomX, caseBottomY, caseBottomZ, caseBottomW, caseBottomL, caseBottomH, "red");
		//inside cutout
		makeCube(caseBottomNegX, caseBottomNegY, caseBottomNegZ, caseBottomNegW, caseBottomNegL, caseBottomNegH, "red");
		//FTDI cutout
		makeCube (CftdiX-ftdiOffset/2, CftdiY, CftdiZ-ftdiOffset/2, CftdiW+ftdiOffset, CftdiL, CftdiH+ftdiOffset);
		//PIR cutout
		makeCube(pirX-pirOffset/2, pirY-pirOffset/2, pirZ-5, pirW+pirOffset, pirL+pirOffset, pirH+caseHeight, "pink");
	};

};

modulejeeCaseTop(){
	caseTopX = ;
	caseTopY = ;
	caseTopZ = ;
	caseTopW = ;
	caseTopL = ;
	caseTopH = ;
};


jeeNode();

roomBoard();

pir();

jeeCaseBottom();