module final1(r1,g1,clk,reset,rst,Cout77,reda88,redb88,y1,fire1,fire2,into,selectATK,amin1,bosscheck,amin2,Playercheck);
input clk,reset,rst,clk,fire1,fire2;
output reg [4:0]y1;
output reg r1,g1;
output  [15:0]reda88;
output  [15:0]redb88;
output  [7:0]Cout77;
reg [3:0]x;
reg [9:0]ATK;
reg [3:0]roundX;
reg [9:0]bossHp,orblood;
reg [4:0]bossATK;
reg [7:0]PcHp,orPc;

wire fireA,fireB,resett;
wire [7:0]ATKw;
reg [7:0]intoseg7;
reg [63:0]pcIn,playerIn;
reg Cgoal,Cenable,Cstart,Cdone,draw;
reg detectST,STcount;
reg lock1,lock2;
wire CdoneW;
reg [7:0]amin2delay,amin1delay;
parameter 
fullblood=	 64'b01111101_01111101_01010101_01000101_01000101_00000001_00000001_00000001,//full blood
bloodboss8=		 64'b00000001_00000001_10001001_11001001_11101001_11111101_11111101_11111101,//full blood
//bloodboss7=		 64'b00000000_00000001_10001001_11001001_11101001_11111101_11111101_11111101,//full blood
bloodboss6=		 64'b00000000_00000000_10001001_11001001_11101001_11111101_11111101_11111101,//full blood
//bloodboss5=		 64'b00000000_00000000_10001000_11001001_11101001_11111101_11111101_11111101,//full blood
bloodboss4=		 64'b00000000_00000000_10001000_11001000_11101001_11111101_11111101_11111101,//full blood
//bloodboss3=		 64'b00000001_00000001_10001001_11001000_11101000_11111101_11111101_11111101,//full blood
bloodboss2=		 64'b00000000_00000000_10001000_11001000_11101000_11111100_11111101_11111101,//full blood
//bloodboss1=		 64'b00000000_00000000_10001000_11001000_11101000_11111100_11111100_11111101,//full blood
bloodboss0=		 64'b01111101_01111101_01010101_01000101_01000101_00000001_00000000_00000000,//3/4 blood
blood34=	 64'b01111101_01111101_01010101_01000101_01000101_00000001_00000000_00000000,//3/4 blood
bloodboss34=		 64'b00000000_00000000_10001001_11001001_11101001_11111101_11111101_11111101,//3/4 blood
blood12=	 64'b01111101_01111101_01010101_01000101_01000100_00000000_00000000_00000000,//1/2 blood
bloodboss12=		 64'b00000000_00000000_10001000_11001000_11101001_11111101_11111101_11111101,//1/2 blood
blood14=	 64'b01111101_01111101_01010100_01000100_01000100_00000000_00000000_00000000,//1/4 blood
bloodboss14=		 64'b00000000_00000000_10001000_11001000_11101000_11111100_11111101_11111101,//1/4 blood
blood0=	 64'b01111100_01111100_01010100_01000100_01000100_00000000_00000000_00000000,//0 blood
attack1A=	 64'b01111100_01111100_01010100_01000100_01000100_00010000_00010000_00010000,//attack1
attack1B=		 64'b00010000_00010000_10011000_11011000_11111000_11111100_11111100_11111100,
attack2A=	 64'b01111100_01111100_01010100_01000100_01000100_00011000_00011000_00011000,//attack2
attack2B=		 64'b00000000_00000000_10001000_11001000_11101000_11111100_11111100_11111100,
attack3A=	 64'b01111100_01111100_01010100_01000100_01000100_00111000_00111000_00111000,//attack3
attack3B=		 64'b00111000_00111000_10111000_11111000_11111000_11111100_11111100_11111100,
attack4A=	 64'b01111100_01111100_01010100_01000100_01000100_00111100_00111100_00111100,//attack4
attack4B=		 64'b00111100_00111100_10111100_11111100_11111100_11111100_11111100_11111100,
attack5A=	 64'b01111100_01111100_01010100_01000100_01000100_01111100_01111100_01111100,//attack5
attack5B=	 64'b01111100_01111100_11111100_11111100_11111100_11111100_11111100_11111100,
attackbossA=	 64'b01111100_01111100_01011100_01001100_01001100_00001000_00001000_00001000,//attack1
attackbossB=		 64'b00001000_00000000_10001000_11001000_11101000_11111100_11111100_11111100;//attack1
output reg into,selectATK,amin1,bosscheck,amin2,Playercheck;

button fire1b(fireA,clk,rst,fire1);
button fire2b(fireB,clk,rst,fire2);
button resetb(resett,clk,rst,reset);

LED_Matrix_Driver screenPC(clk,reset,pcIn,reda88);
LED_Matrix_Driver screenPlayer(clk,reset,playerIn,redb88);
counter countTime(rst,Cgoal,Cenable,Cstart,Cout77,CdoneW,clk);
clickcount(clk,fireB,Cstart,Cenable,ATKw);//Cstart=rst

always@(posedge clk)
begin
if(reset)
	begin
		y1=5'b00000;
		x=1;
		into=1;
		g1=0;
		r1=0;
	end
else if(into)
	case(x)
			1:
			begin
			playerIn=fullblood;
			pcIn=bloodboss8;
			orblood=1;
			bossHp=8*orblood;
			PcHp=4;
			bossATK=25;
			into=0;
			detectST=1;
			y1[0]=1;
			end
			2:
			begin
			playerIn=fullblood;
			pcIn=bloodboss8;
			orblood=1;
			bossHp=8*orblood;
			PcHp=4;
			bossATK=25;
			into=0;
			detectST=1;
			//lock1=1;
			//lock2=0;
			y1[1]=1;
			end
			3:
			begin
			playerIn=fullblood;
			pcIn=bloodboss8;
			orblood=1;
			bossHp=8*orblood;
			PcHp=4;
			bossATK=25;
			into=0;
			detectST=1;
			//lock1=1;
			//lock2=0;
			y1[2]=1;
			end
			4:
			begin
			playerIn=fullblood;
			pcIn=bloodboss8;
			orblood=1;
			bossHp=8*orblood;
			PcHp=4;
			bossATK=25;
			into=0;
			detectST=1;
			//lock1=1;
			//lock2=0;
			y1[3]=1;
			end
			5:
			begin
			playerIn=fullblood;
			pcIn=bloodboss8;
			orblood=1;
			bossHp=8*orblood;
			PcHp=4;
			bossATK=25;
			into=0;
			detectST=1;
			//lock1=1;
			//lock2=0;
			y1[4]=1;
			end
			default:
			begin
			r1=1;
			end
	endcase 
			
else if(detectST)
	begin
		if(fire1)
			begin
				Cstart=1;
				Cenable=1;
				STcount=1;
				//lock1=0;
				//lock2=1;
				detectST=0;
			end
	end
else if(STcount)
		begin
			Cstart=0;
			if(CdoneW)
				begin
				Cenable=0;
				selectATK=1;
				STcount=0;
				//ATKw
				end
		end
else if(selectATK)
		begin
		if(ATKw<=10 && ATKw>0)
		ATK=2;
		else if(ATKw<=20 && ATKw>10)
		ATK=5;
		else if(ATKw<=25 && ATKw>20)
		ATK=10;
		else if(ATKw<=35 && ATKw>25)
		ATK=15;
		else if( ATKw>35)
		ATK=40;
		amin1=1;
		amin1delay=0;
		selectATK=0;
		end
else if(amin1)
		begin
		amin1delay=amin1delay+1;//reg
		case(ATK)
			2:
				begin
				playerIn=attack1A;
				pcIn=attack1B;
				end
			5:
				begin
				playerIn=attack2A;
				pcIn=attack2B;
				end
			10:
				begin
				playerIn=attack3A;
				pcIn=attack3B;
				end
			15:
				begin
				playerIn=attack4A;
				pcIn=attack4B;
				end
			40:
				begin
				playerIn=attack5A;
				pcIn=attack5B;
				end
			default:
				begin
				r1=1;
				end
			endcase
		if(amin1delay>=500)
			begin
				amin1delay=0;
				amin1=0;
				bosscheck=1;
			end
		end
else if(bosscheck)
		begin
		if(ATK>bossHp)
		bossHp=0;
		else
		bossHp=bossHp-ATK;
		
		if(bossHp==0)
			begin
				x=x+1;
				if(x>=6)
					begin
					bosscheck=0;
					g1=1;
					end
				else if(x<6)
					begin
					bosscheck=0;
					into=1;//////
					end 
			end
		else if(bossHp>0)
				begin
					amin2=1;
					amin2delay=0;
					bosscheck=0;
					end
		end
else if(amin2)
		begin
		amin2delay=amin2delay+1;
		playerIn=attackbossA;
		pcIn=attackbossB;
		if(amin2delay>=500)
			begin
				amin2=0;
				amin2delay=0;
				Playercheck=1;
			end
		end
else if(Playercheck)
		begin
		PcHp=PcHp-1;
		if(PcHp>0)
			begin
			//detectST=1;
			draw=1;
			Playercheck=0;
			end
		else if(PcHp==0)
			begin
			r1=1;
			Playercheck=0;
			end
		end
else if(draw)
begin
		if((bossHp<=orblood*8)&&(bossHp>orblood*6))
					begin
					pcIn=bloodboss8;
					end
				
					else if((bossHp<=orblood*6)&&(bossHp>orblood*4))
					begin
					pcIn=bloodboss6;
					end
					
					else if((bossHp<=orblood*4)&&(bossHp>orblood*2))
					begin
					pcIn=bloodboss4;
					end
				
					else if((bossHp<=orblood*2)&&(bossHp>orblood*0))
					begin
					pcIn=bloodboss2;
					end
				
					else if((bossHp==orblood*0))
					begin
					pcIn=bloodboss0;
					end
		if(PcHp==4)
					begin
					playerIn=fullblood;
					end
					else if((PcHp==3))
					begin
					playerIn=blood34;
					end
					else if((PcHp==2))
					begin
					playerIn=blood12;
					end
					else if((PcHp==1))
					begin
					playerIn=blood14;
					end
					else if((PcHp==0))
					begin
					playerIn=blood0;
					end
		draw=0;
		detectST=1;
		//lock1=1;
		//lock2=0;
						
end
end


endmodule			
				
				

