//+------------------------------------------------------------------+
//|                                           EA Multi Indicator.mq4 |
//|                                     Copyright 2016, Younes Sami. |
//|                    https://www.freelancer.com/u/younes4sami.html |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, Younes Sami."
#property link      "https://www.freelancer.com/u/younes4sami.html"
#property version   "1.00"
#property strict


enum MODE_1 
     {
     MODE_1_1          = 0         , // Mode Forex
     MODE_1_2          = 1         , // Mode Binary Option
     };
enum MODE_2 
     {
     MODE_2_1          = 0         , // Stealth Mode
     MODE_2_2          = 1         , // Stop Loss Mode
     };
enum EXPIRY
     {
     EXP0              = 0         , // Current Period
     EXP1              = 60        , // 60Sec 
     EXP2              = 120       , // 120Sec 
     EXP3              = 300       , // 5Min  
     EXP4              = 600       , // 10Min  
     EXP5              = 900       , // 15Min 
     EXP6              = 1800      , // 30Min
     EXP7              = 3600      , // 1H 
     EXP8              = 7200      , // 2H 
     EXP9              = 14400     , // 4H     
     };
enum TYPE_ORDERS
     {
     BUYSELL             = 0 , // Buy and Sell
     BUY                 = 1 , // Buy 
     SELL                = 2 , // Sell
     };
enum TYPE_ORDERST
     {
     BUYT                = 1 , // Buy 
     SELLT               = 2 , // Sell
     };
//--- input parameters
input int                 MAGICMA         = 2210                               ; // Magic Number
input bool                TRADING_FRIDAY  = true                               ; // Trading In Friday
input bool                Time_Filter     = true                               ; // Use Time Filter
input string              Open_Hour       = "08:30"                            ; // Start Trading
input string              Close_Hour      = "18:30"                            ; // Stop Trading
input bool                CLOSE_AND_TIME  = false                              ; // Close Order After End Time Trading 
input MODE_1              TRADING_TYPE    = 1                                  ; // Trading Type
input bool                Use_Open_Time   = false                              ; // Open Order At Time
input TYPE_ORDERST        TP_ORDERST      = 1                                  ; // Type Order At Time
input string              Open_ORDERT     = "00:00"                            ; // Time Open Orders
input string              Close_ORDERTF   = "23:59"                            ; // Time Close Forex Orders 
input TYPE_ORDERS         TP_ORDERS       = 0                                  ; // Type Orders
input string              BO____          = ">>> Binary Option Setting <<< "   ; // ================================
input double              MONEY           = 1                                  ; // Money Invested
input EXPIRY              EXP_TIME        = 0                                  ; // Expiry Time 
input int                 MAX_LOSS        = 2                                  ; // Max Loos PerDay
input bool                Use_ToPrift     = false                              ; // Continue Martin Till Profit
input string              BO___TS         = "> Binary Option Setting Tester < "; // ================================
input int                 BALANCE         = 1000                               ; // Balance
input double              RETURN          = 75                                 ; // Return Percent After Win
input string              FX____          = ">>>>>>> Forex Setting <<<<<<< "   ; // ================================
input double              LOTS            = 0.2                                ; // Start Lot Size
input bool                Use_Martingale  = true                               ; // Use Martingale
input double              Martingale_value= 2.0                                ; // Martingale Value
input int                 MAX_LEVEL       = 4                                  ; // Max Level Martingale
input int                 TAKE_PROFIT     = 200                                ; // Take Profit
input int                 STOP_LOSS       = 200                                ; // Stop Loss
input bool                Use_Trailing    = false                              ; // Using Trailing Stop
input int                 Trailing_Stop   = 5                                  ; // Trailing Stop
input MODE_2              MODE_SECURE     = 0                                  ; // Mode Secure
input bool                Use_Secure_Mode = false                              ; // Use Secure Mode
input int                 Dis_From_Price  = 10                                 ; // Distance From Price
input int                 SECURE_POINT_1  = 50                                 ; // Secure Point 1
input int                 SECURE_POINT_2  = 20                                 ; // Secure Point 2
input bool                Use_Close       = false                              ; // Use Close Opposite Signal
input bool                SHOW            = true                               ; // Show Text
input bool                USE_INDI1       = false                              ; // Use TripleProfitWinner Xmaster Formula
input bool                USE_INDI2       = false                              ; // Use Xmaster Formula
input bool                USE_INDI3       = false                              ; // Use Mega_Fx
input bool                USE_INDI4       = false                              ; // Use PZ_DayTrading
input bool                USE_INDI5       = false                              ; // Use BinaryComodo
input bool                USE_INDI6       = false                              ; // Use gfk forex2
input bool                USE_INDI7       = false                              ; // Use UltimateProScalper
input bool                USE_INDI8       = false                              ; // Use 100pipstodayscalper
input bool                USE_INDI9       = false                              ; // Use StepMA NMC v3.01
input bool                USE_INDI10      = false                              ; // Use instantprofitscalper05
input bool                USE_INDI11      = false                              ; // Use Keltner Channel Pro
input bool                USE_INDI12      = false                              ; // Use HalfTrend-1.02
input bool                USE_INDI13      = false                              ; // Use Forex Indicator Pro(binary)
input bool                USE_INDI14      = false                              ; // Use Binary Winner
input bool                USE_INDI15      = false                              ; // Use MARVIN NON-REPAINT
input bool                USE_INDI16      = false                              ; // Use DXTrade C4 Nitro
input bool                USE_INDI17      = false                              ; // Use SixtySecondTrades
input bool                USE_INDI18      = false                              ; // Use Binary-Reaper-V3
input bool                USE_INDI19      = false                              ; // Use Super-Point-Signal
input bool                USE_INDI20      = false                              ; // Use DeltaForce Indicator
input bool                USE_INDI21      = false                              ; // Use Binary Options Buddy 2.0
input bool                USE_INDI22      = false                              ; // Use FX Scalper_build600
input bool                USE_INDI23      = false                              ; // Use StochasticZones
input bool                USE_INDI24      = false                              ; // Use MACD
input string              INDI1           = "TripleProfitWinner Settings"      ; //=========================
input int                 INDI1_v1        = 20                                 ; // Signal Period 1
input int                 INDI1_v2        = 30                                 ; // Signal Period 2
input int                 INDI1_v3        = 35                                 ; // Signal Period 3
input string              INDI4           = "PZ_DayTrading Settings"           ; //=========================
input int                 INDI4_v1        = 5                                  ; // Min Range
input int                 INDI4_v2        = 30                                 ; // Max Range
input int                 INDI4_v3        = 10                                 ; // High low Filter
input int                 INDI4_v4        = 5000                               ; // Max History Bars
input string              INDI5           = "BinaryComodo Settings"            ; //=========================
input int                 INDI5_v1        = 5                                  ; // Faster EMA
input int                 INDI5_v2        = 200                                ; // Slower EMA
input int                 INDI5_v3        = 12                                 ; // RSI Period
input string              INDI7           = "UltimateProScalper Settings"      ; //=========================
input int                 INDI7_v1        = 13                                 ; // Period Value
input string              INDI8           = "100pipstodayscalper Settings"     ; //=========================
input int                 INDI8_v1        = 34                                 ; // B Period 
input int                 INDI8_v2        = 3                                  ; // A Period 
input string              INDI9           = "StepMA NMC v3.01 Settings"        ; //=========================
input string              INDI9_v1        = "Current time frame"               ; // Time Frame
input int                 INDI9_v2        = 10                                 ; // PdfMaLength
input double              INDI9_v3        = 5.0                                ; // Sensitivity 
input double              INDI9_v4        = 2.0                                ; // Step Size 
input double              INDI9_v5        = 1.0                                ; // Variance 
input double              INDI9_v6        = 0.0                                ; // Mean 
input int                 INDI9_v7        = 0                                  ; // Shift
input bool                INDI9_v8        = false                              ; // HighLow 
input string              INDI10          = "instantprofitscalper05 Settings"  ; //=========================
input int                 INDI10_v1       = 8                                  ; // Spik 
input string              INDI11          = "Keltner Channel Pro Settings"     ; //=========================
input string              INDI11_v1       = "Current time frame"               ; // Time Frame
input int                 INDI11_v2       = 10                                 ; // MA Period
input int                 INDI11_v3       = 3                                  ; // MA Mode
input int                 INDI11_v4       = 0                                  ; // Price Mode
input int                 INDI11_v5       = 21                                 ; // ATR Period
input double              INDI11_v6       = 0.628                              ; // K
input bool                INDI11_v7       = false                              ; // ATR Mode
input int                 INDI11_v8       = 5                                  ; // Length
input int                 INDI11_v9       = 0                                  ; // Price
input double              INDI11_v10      = 100.0                              ; // Phase
input bool                INDI11_v11      = true                               ; // Interpolate
input bool                INDI11_v12      = true                               ; // MultiColor
input bool                INDI11_v13      = true                               ; // Show Arrows 
input bool                INDI11_v14      = true                               ; // Arrows On Jurik
input string              INDI12          = "HalfTrend-1.02 Settings"          ; //=========================
input int                 INDI12_v1       = 2                                  ; // Amplitude
input string              INDI13          = "Forex Indicator Pro Settings"     ; //=========================
input int                 INDI13_v1       = 3                                  ; // Width
input int                 INDI13_v2       = 12                                 ; // Signal Period
input int                 INDI13_v3       = 2                                  ; // Arrow Period
input string              INDI14          = "Binary Winner Settings"           ; //=========================
input int                 INDI14_v1       = 500                                ; // NumBars
input string              INDI16          = "DXTrade C4 Nitro Settings"        ; //=========================
input int                 INDI16_v1       = 2                                  ; // Trix_Period
input int                 INDI16_v2       = 10                                 ; // Period_MA
input int                 INDI16_v3       = 4                                  ; // MOM_Period
input string              INDI17          = "SixtySecondTrades Settings"       ; //=========================
input int                 INDI17_v1       = 14                                 ; // ADXBars
input int                 INDI17_v2       = 350                                ; // CountBars
input string              INDI18          = "Binary-Reaper-V3 Settings"        ; //=========================
input int                 INDI18_v1       = 70                                 ; // AroonPeriod
input int                 INDI18_v2       = 50                                 ; // Filter
input string              INDI19          = "Super-Point-Signal Settings"      ; //=========================
input int                 INDI19_v1       = 10000                              ; // Bars To Processe
input string              INDI20          = "DeltaForce Indicator Settings"    ; //=========================
input int                 INDI20_v1       = 80                                 ; // Gi_100
input int                 INDI20_v2       = 20                                 ; // Gi_104
input bool                INDI20_v3       = true                               ; // Gi_Unused_108
input string              INDI22          = "FX Scalper_build600 Settings"     ; //=========================
input int                 INDI22_v1       = 25                                 ; // Period
input int                 INDI22_v2       = 0                                  ; // Shift
input string              INDI23          = "StochasticZones Settings"         ; //=========================
input int                 INDI23_v1       = 0                                  ; // Time Frame
input int                 INDI23_v2       = 14                                 ; // KPeriod
input int                 INDI23_v3       = 3                                  ; // DPeriod
input int                 INDI23_v4       = 3                                  ; // Slowing
input int                 INDI23_v5       = 0                                  ; // MA Method
input int                 INDI23_v6       = 0                                  ; // Price Field
input double              INDI23_v7       = 80                                 ; // Over Bought
input double              INDI23_v8       = 20                                 ; // Over Sold
input string              INDI24          = "MACD Settings"         ; //=========================
input int                 INDI24_v1       = 0                                  ; // Time Frame
input int                 INDI24_v2       = 12                                 ; // Fast EMA
input int                 INDI24_v3       = 26                                  ; // Slow EMA
input int                 INDI24_v4       = 9                                  ; // Signal Line
input ENUM_APPLIED_PRICE  INDI24_v5       = 0                                  ; // Applied Price
input bool                CloseByMacdOnly = 0                                  ; // CloseOnly ByMacd
input bool                INDI24_v10 = 1                                        ; // Open Only By Macd
input bool                INDI24_v7 = 0                                        ; // Absolute buy/sell
input int                INDI24_v8 = 1                                        ; // MACD Shift for entrance
input int                INDI24_v9 = 1                                        ; // MACD Shift for order close

string ORDERS = "";
 

bool SP1 = false ;
bool SP2 = false ;

double PO1 = 0 ;
double PO2 = 0 ;

datetime B  = 0 ; 
datetime S  = 0 ; 
datetime BE = 0 ; 
datetime SE = 0 ; 
double   BP = 0 ; 
double   SP = 0 ; 

int WIN = 0 ;
int LOS = 0 ;
int TIE = 0 ;

int EX = 0 ;

int LEVEL = 0 ;
int LT = 0 ;

double BAL = BALANCE;
double mon = MONEY ;
int LOSS = 0 ;
int TODAY = 0 ;

//double TesterLots=0;
//double
datetime LastBuyTime=0,LastSellTime=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetMillisecondTimer(1000);
      ObjectsDeleteAll();
      
      EX = EXP_TIME ;
      if (EXP_TIME==0)EX = Period()*60;
   TODAY = TimeDay(TimeCurrent());
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
   ObjectDelete (0,"LEB0");
   ObjectDelete (0,"LEB1");
   ObjectDelete (0,"LEB2");
   ObjectDelete (0,"LEB3");
   ObjectDelete (0,"LEB4");
   ObjectDelete (0,"LEB5");
   ObjectDelete (0,"LEB6");
   ObjectDelete (0,"LEB7");
   ObjectDelete (0,"LEB8");
   ObjectDelete (0,"LEB9");
   ObjectDelete (0,"LEB10");
   ObjectDelete (0,"LEB11");
   ObjectDelete (0,"LEB12");
   ObjectDelete (0,"LEB13");
   ObjectDelete (0,"LEB14");
   ObjectDelete (0,"LEB15");
   ObjectDelete (0,"LEB16");
   ObjectDelete (0,"LEB17");
   ObjectDelete (0,"LEB18");
   ObjectDelete (0,"LEB19");
   ObjectDelete (0,"LEB20");
   ObjectDelete (0,"LEB21");
   ObjectDelete (0,"LEB22");
   ObjectDelete (0,"LEB23");
   ObjectDelete (0,"LEB24");
   ObjectDelete (0,"LEB25");
   ObjectDelete (0,"LEB26");
   ObjectDelete (0,"LEB27");
   ObjectDelete (0,"LEB28");
   ObjectDelete (0,"LEB29");
   ObjectDelete (0,"LEB30");
   ObjectDelete (0,"LEB31");
   
   
      
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
 bool TRADING =true;
  if( TODAY != TimeDay(TimeCurrent()))
    {
    if (Use_ToPrift==false && TRADING_TYPE==1 ){LEVEL =0;LT=0;}
    LOSS = 0 ;
    TODAY = TimeDay(TimeCurrent());
    }
   
   datetime  O   = StringToTime(Open_Hour);
   datetime  C   = StringToTime(Close_Hour);
   
 if(Time_Filter ==true && O<C )
   {
   if (TimeCurrent()<O ||TimeCurrent()>=C)
       {
       Comment("\nTime stop trading .");
       TRADING =false;
       }
   }
 if(Time_Filter ==true && O>C )
   {
   if (TimeCurrent()<O ||TimeCurrent()>=C+(24*60*60))
       {
       Comment("\nTime stop trading .");
       TRADING =false;
       }
   }
 if(TRADING_FRIDAY ==false && DayOfWeek()==5 )
   {
   
       Comment("\nTrading Stopped In Friday.");
       TRADING =false;
      
   }
  if (CLOSE_AND_TIME==true && TimeCurrent()>=C)
     {
     CLOSEB();
     CLOSES();
     }
   double  xecn =1;//if(_Digits==5||_Digits==3){xecn=10;}
     
   double TPB =  NormalizeDouble(Ask+(TAKE_PROFIT*xecn*_Point),_Digits);
   double SLB =  NormalizeDouble(Ask-(STOP_LOSS*xecn*_Point),_Digits)  ;
   double TPS =  NormalizeDouble(Bid-(TAKE_PROFIT*xecn*_Point),_Digits);
   double SLS =  NormalizeDouble(Bid+(STOP_LOSS*xecn*_Point),_Digits)  ;
   bool CLO   = false ;
   if (Use_Close==true)CLO = true ;
   if (TAKE_PROFIT==0){ TPB = 0 ; TPS = 0 ; }
   if (STOP_LOSS  ==0){ SLB = 0 ; SLS = 0 ; CLO = true ; }
   
   if (TOTALORDERS()==0){SP1 = false ; SP2 = false ;}
   
   if(USE_INDI1 ==false  && USE_INDI2 ==false && USE_INDI3 ==false && USE_INDI4 ==false && USE_INDI5 ==false && 
      USE_INDI6 ==false  && USE_INDI7 ==false && USE_INDI8 ==false && USE_INDI9 ==false && USE_INDI10==false &&
      USE_INDI11==false  && USE_INDI12==false && USE_INDI13==false && USE_INDI14==false && USE_INDI15==false &&
      USE_INDI16==false  && USE_INDI17==false && USE_INDI18==false && USE_INDI19==false && USE_INDI20==false &&
      USE_INDI21==false  && USE_INDI22==false && USE_INDI23==false && USE_INDI24==false && Use_Open_Time==false)
      {
      ObjectsDeleteAll();
      if (SHOW==true)PRINTDATA ();
      return ;
      }
    if (USE_INDI15==true && TOTALORDERS()==0 && TRADING_TYPE==1 && TRADING ==true && Use_Open_Time==false && LOSS<MAX_LOSS)
       {
       if (IND15B()==true && (TP_ORDERS==0||TP_ORDERS==1))
          {
          if (IsTesting()==false)int OB = OrderSend(Symbol(),OP_BUY,LOTOPTI(),Ask,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrBlue);
              B = Time[0]+EX;
              BP = Bid ;
              Print ("Open Price = ",BP," || Open Time =",Time[0]," || Expiry At = ",B);
          }
       if (IND15S()==true && (TP_ORDERS==0||TP_ORDERS==2))
          {
          if (IsTesting()==false) int OS = OrderSend(Symbol(),OP_SELL,LOTOPTI(),Bid,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrRed);
              S = Time[0]+EX;
              SP = Bid ;
              Print ("Open Price = ",SP," || Open Time =",Time[0]," || Expiry At = ",S);
          }
       }
   //CloseByMacdOnly
   if(IND24BClose()==true && CloseByMacdOnly)CLOSEB();// && CLO==true && USE_INDI24
   if(IND24SClose()==true && CloseByMacdOnly)CLOSES();// && CLO==true && USE_INDI24
   bool Ind24B=IND24B()==true && Time[0]>LastBuyTime;
   bool Ind24S=IND24S()==true && Time[0]>LastSellTime;
   
   if (((IND1B() ==true && IND2B()==true && IND3B()==true && IND4B() ==true && IND5B() ==true && IND6B() ==true &&
       IND7B() ==true && IND8B()==true && IND9B()==true && IND10B()==true && IND11B()==true && IND12B()==true && 
       IND13B()==true && IND14B()==true&& IND15B()==true&& IND16B()==true && IND17B()==true && IND18B()==true &&
       IND19B()==true && IND20B()==true&& IND21B()==true&& IND22B()==true && IND23B()==true && Ind24B)||(INDI24_v10&&Ind24B))
       && (ORDERS==""||ORDERS=="SELL"||(Ind24B && USE_INDI24)) && Use_Open_Time==false )
      {
      if (CLO==true)CLOSES();
      if (TOTALORDERS()==0 )
         {
         if( TRADING ==true && (TP_ORDERS==0||TP_ORDERS==1))
          {
          LastBuyTime=TimeCurrent();
          if (TRADING_TYPE==0)int OB = OrderSend(Symbol(),OP_BUY,LOTOPTI(),Ask,3,SLB,TPB,"BUY",MAGICMA,0,clrBlue);
          if (TRADING_TYPE==1 && ORDERS=="SELL"  && LOSS<MAX_LOSS)
              {
              if (IsTesting()==false) int OB = OrderSend(Symbol(),OP_BUY,LOTOPTI(),Ask,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrBlue);
              B = Time[0]+EX;
              BP = Bid ;
              Print ("Open Price = ",BP," || Open Time =",Time[0]," || Expiry At = ",B);
              }
           }
          ORDERS = "BUY";
          }
      }
   if (((IND1S() ==true && IND2S()==true && IND3S()==true && IND4S() ==true && IND5S() ==true && IND6S() ==true && 
       IND7S() ==true && IND8S()==true && IND9S()==true && IND10S()==true && IND11S()==true && IND12S()==true && 
       IND13S()==true && IND14S()==true && IND15S()==true && IND16S()==true && IND17S()==true && IND18S()==true &&
       IND19S()==true && IND20S()==true && IND21S()==true && IND22S()==true && IND23S()==true && Ind24S)||(INDI24_v10&&Ind24S))
       
       
        && (ORDERS==""||ORDERS=="BUY"||(Ind24S && USE_INDI24)) && Use_Open_Time==false )
      {
      if (CLO==true)CLOSEB();
      if (TOTALORDERS()==0 )
         {
       if(TRADING ==true && (TP_ORDERS==0||TP_ORDERS==2))
         {
         LastSellTime=TimeCurrent();
         if (TRADING_TYPE==0)int OS = OrderSend(Symbol(),OP_SELL,LOTOPTI(),Bid,3,SLS,TPS,"SELL",MAGICMA,0,clrRed);
         if (TRADING_TYPE==1 && ORDERS=="BUY" && LOSS<MAX_LOSS)
            {
            if (IsTesting()==false) int OS = OrderSend(Symbol(),OP_SELL,LOTOPTI(),Bid,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrRed);
            S = Time[0]+EX;
            SP = Bid ;
            Print ("Open Price = ",SP," || Open Time =",Time[0]," || Expiry At = ",S);
            }
          }
         ORDERS = "SELL";
         }
      }
      
      if(Use_Open_Time==true )
   {
   string TCD=TimeToStr(TimeCurrent(),TIME_MINUTES);
   
        if (TCD==Open_ORDERT && TOTALORDERS()==0 )
          {
          if(TP_ORDERST==1)
            {
             if (TRADING_TYPE==0)int OB = OrderSend(Symbol(),OP_BUY,LOTOPTI(),Ask,3,SLB,TPB,"BUY",MAGICMA,0,clrBlue);
             if (TRADING_TYPE==1  && LOSS<MAX_LOSS)
                {
                if (IsTesting()==false)int OB = OrderSend(Symbol(),OP_BUY,LOTOPTI(),Ask,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrBlue);
                   B = TimeCurrent()+EX;
                   BP = Bid ;
                   Print ("Open Price = ",BP," || Open Time =",TimeCurrent()," || Expiry At = ",B);
                }
             }
       if(TP_ORDERST==2)
         {
         if (TRADING_TYPE==0)int OS = OrderSend(Symbol(),OP_SELL,LOTOPTI(),Bid,3,SLS,TPS,"SELL",MAGICMA,0,clrRed);
         if (TRADING_TYPE==1  && LOSS<MAX_LOSS)
            {
            if (IsTesting()==false) int OS = OrderSend(Symbol(),OP_SELL,LOTOPTI(),Bid,3,0,0,"BO exp:"+IntegerToString(Period()*60),MAGICMA,0,clrRed);
               S = TimeCurrent()+EX;
               SP = Bid ;
               Print ("Open Price = ",SP," || Open Time =",TimeCurrent()," || Expiry At = ",S);
            }
          }
       }
    
    if (TCD==Close_ORDERTF && TRADING_TYPE==0 && TOTALORDERS()>0){CLOSEB();CLOSES();}
   }
   
   if (TimeCurrent()>=B && B!=0 && BP >  Bid){WIN+=1;B=0;BP=0;if(IsTesting()==true){BAL = BAL+(mon*(RETURN/100));PP();mon=MONEY;}}
   if (TimeCurrent()>=B && B!=0 && BP <  Bid){LOS+=1;B=0;BP=0;if(IsTesting()==true){BAL = BAL-mon;PP();if(Use_Martingale==false){mon=MONEY;}if(Use_Martingale==true){mon=mon*Martingale_value;LT+=1;LOSS+=1;}if(LT>MAX_LEVEL){mon=MONEY;}if(TODAY!=TimeDay(TimeCurrent())){if(Use_ToPrift==false)mon=MONEY;}}}
   if (TimeCurrent()>=B && B!=0 && BP == Bid){TIE+=1;B=0;BP=0;PP();}
   if (TimeCurrent()>=S && S!=0 && SP <  Bid){LOS+=1;S=0;SP=0;if(IsTesting()==true){BAL = BAL-mon;PP();if(Use_Martingale==false){mon=MONEY;}if(Use_Martingale==true){mon=mon*Martingale_value;LT+=1;LOSS+=1;}if(LT>MAX_LEVEL){mon=MONEY;}if(TODAY!=TimeDay(TimeCurrent())){if(Use_ToPrift==false)mon=MONEY;}}}
   if (TimeCurrent()>=S && S!=0 && SP >  Bid){WIN+=1;S=0;SP=0;if(IsTesting()==true){BAL = BAL+(mon*(RETURN/100));PP();mon=MONEY;}}
   if (TimeCurrent()>=S && S!=0 && SP == Bid){TIE+=1;S=0;SP=0;PP();}
   
   if (SHOW==true)PRINTDATA ();
   if (Use_Trailing==true)TrilingStop();
   if(Use_Secure_Mode==true && MODE_SECURE==0)Secure1();
   if(Use_Secure_Mode==true && MODE_SECURE==1)Secure2();
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
  
  if (SHOW==true)PRINTDATA ();
  
  //Print("TEST => ",IND1);
  
  
  }  
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
//---
   double ret=0.0;
//---

//---
   return(ret);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
  }
//+------------------------------------------------------------------+
//=========================== Lot Optimize ===============================
double LOTOPTI()
 {
 double re = 0 ; 
 if (TRADING_TYPE==0) re = LOTS ;
 if (TRADING_TYPE==1) re = MONEY ;
 if (Use_Martingale==true)
    {
    for (int i=OrdersHistoryTotal() ; i>=0 ; i--)
      {
      if (OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==true)
         {
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA)
           {
           if (OrderType()==OP_BUY)
              {
              if (OrderOpenPrice()<OrderClosePrice())break;
              if (OrderOpenPrice()>OrderClosePrice()){re=OrderLots()*Martingale_value;LEVEL+=1;LOSS +=1;break;}
              }
           if (OrderType()==OP_SELL)
              {
              if (OrderOpenPrice()>OrderClosePrice())break;
              if (OrderOpenPrice()<OrderClosePrice()){re=OrderLots()*Martingale_value;LEVEL+=1;LOSS +=1;break;}
              }
           }
         }
      }
    }
 if (LEVEL>MAX_LEVEL && TRADING_TYPE==0) {re = LOTS ;LEVEL=0;}
 if (LEVEL>MAX_LEVEL && TRADING_TYPE==1) {re = MONEY ;LEVEL=0;}
 if (re>MarketInfo(Symbol(),MODE_MAXLOT))re = MarketInfo(Symbol(),MODE_MAXLOT);
 if (re<MarketInfo(Symbol(),MODE_MINLOT))re = MarketInfo(Symbol(),MODE_MINLOT);
 return re ;
 }
//========================================================================
//=========================== Profit Binary Option =======================
double PBO()
 {
 double re = 0 ;
  for (int i=OrdersHistoryTotal() ; i>=0 ; i--)
      {
      if (OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==true)
         {
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA)
           {
           re =OrderLots();
           break;
           }
         }
      }
 return re ;
 }
//========================================================================
//=========================== Total Orders ===============================
int TOTALORDERS()
 {
 int re = 0 ;
  for (int i=0 ; i<OrdersTotal() ; i++)
      {
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
         {
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA)
           {
           re +=1;
           }
         }
      }
 return re ;
 }
//========================================================================
//========================= Close Order In Opposit Signal ================
void CLOSEB()
 {
 for (int i=0 ; i<OrdersTotal() ; i++)
      {
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
         {
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA && OrderType()==OP_BUY)
           {
           int CB = OrderClose(OrderTicket(),OrderLots(),Bid,3,clrBlue);
           }
         }
      }
 }
void CLOSES()
 {
 for (int i=0 ; i<OrdersTotal() ; i++)
      {
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
         {
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA && OrderType()==OP_SELL)
           {
           int CS = OrderClose(OrderTicket(),OrderLots(),Ask,3,clrBlue);
           }
         }
      }
 }
//========================================================================
//====================== Trailing Stop ===================================

void TrilingStop()
{          
     double  xecn =1;//if(Digits==5||Digits==3){xecn=10;}
     double TRSB = NormalizeDouble(Ask-(Trailing_Stop*xecn*_Point),_Digits);
     double TRSS = NormalizeDouble(Bid+(Trailing_Stop*xecn*_Point),_Digits);
                                                                                                   
 for (int i=0;i<OrdersTotal();i++)                                                                                               
   {                                                                                                          
                                                                                                              
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)                                                     
                                                                                                              
         {                                                                                                    
                                                                                                            
           if (OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA && Use_Trailing ==true)
             {
             
             
             if (Ask > NormalizeDouble(OrderOpenPrice()+(Trailing_Stop*xecn*_Point),_Digits) )
              {
               if (Ask > NormalizeDouble(OrderStopLoss()+(Trailing_Stop*xecn*_Point),_Digits))
                {
                   double MOD = OrderModify(OrderTicket(),OrderOpenPrice(),TRSB,OrderTakeProfit(),0);
                }
              }
             }
          
             
           if (OrderType()==OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA && Use_Trailing==true)
             {
             
             
             if (Bid < NormalizeDouble(OrderOpenPrice()-(Trailing_Stop*xecn*_Point),_Digits) )
              {
               if (Bid < NormalizeDouble(OrderStopLoss()-(Trailing_Stop*xecn*_Point),_Digits))
                {
                   double MOD = OrderModify(OrderTicket(),OrderOpenPrice(),TRSS,OrderTakeProfit(),0);
                }
              }
             }
         }
      
 
 }
}
//========================================================================
//============================ Print Data In Chart========================
void PRINTDATA ()
 {
    SecureP();
     ObjectDelete        (0,"LEB24");
     ObjectDelete        (0,"LEB25");
     ObjectDelete        (0,"LEB26");
     ObjectDelete        (0,"LEB27");
     ObjectDelete        (0,"LEB28");
     ObjectDelete        (0,"LEB29");
     ObjectDelete        (0,"LEB30");
     
  if (TRADING_TYPE==0)
     {   
      ObjectDelete        (0,"LEB24");
      ObjectCreate        (0,"LEB24", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB24","Account Equity : "+DoubleToStr(AccountEquity(),2), 14, "Calibri Bold", clrWhiteSmoke);
      ObjectSetInteger    (0,"LEB24", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB24", OBJPROP_YDISTANCE,50);
      ObjectSetInteger    (0,"LEB24", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      }
   if (Use_Secure_Mode==true && TRADING_TYPE==0)
      {
      ObjectDelete        (0,"LEB25");
      ObjectCreate        (0,"LEB25", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB25","Secure Mode 1 Active At : "+DoubleToStr(PO1,_Digits), 12, "Calibri Bold", clrWhiteSmoke);
      ObjectSetInteger    (0,"LEB25", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB25", OBJPROP_YDISTANCE,70);
      ObjectSetInteger    (0,"LEB25", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      
      ObjectDelete        (0,"LEB26");
      ObjectCreate        (0,"LEB26", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB26","Secure Mode 2 Active At : "+DoubleToStr(PO2,_Digits), 12, "Calibri Bold", clrWhiteSmoke);
      ObjectSetInteger    (0,"LEB26", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB26", OBJPROP_YDISTANCE,90);
      ObjectSetInteger    (0,"LEB26", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      }
   if (TRADING_TYPE==1)
      {
      int Y = 50 ;
      if (IsTesting()==true)
         {
         ObjectDelete        (0,"LEB27");
         ObjectCreate        (0,"LEB27", OBJ_LABEL, 0, 0, 0);
         ObjectSetText       ("LEB27","Balance : "+DoubleToStr(BAL,2), 14, "Calibri Bold", clrWhiteSmoke);
         ObjectSetInteger    (0,"LEB27", OBJPROP_XDISTANCE,10);
         ObjectSetInteger    (0,"LEB27", OBJPROP_YDISTANCE,50);
         ObjectSetInteger    (0,"LEB27", OBJPROP_CORNER,CORNER_LEFT_UPPER);
         Y+=20;
         }
      ObjectDelete        (0,"LEB28");
      ObjectCreate        (0,"LEB28", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB28","Win : "+IntegerToString(WIN), 12, "Calibri Bold", clrLime);
      ObjectSetInteger    (0,"LEB28", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB28", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB28", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      Y+=20;
      ObjectDelete        (0,"LEB29");
      ObjectCreate        (0,"LEB29", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB29","Loss : "+IntegerToString(LOS), 12, "Calibri Bold", clrRed);
      ObjectSetInteger    (0,"LEB29", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB29", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB29", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      Y+=20;
      ObjectDelete        (0,"LEB30");
      ObjectCreate        (0,"LEB30", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB30","Tie : "+IntegerToString(TIE), 12, "Calibri Bold", clrWhiteSmoke);
      ObjectSetInteger    (0,"LEB30", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB30", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB30", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      
      Y+=20;
      ObjectDelete        (0,"LEB31");
      ObjectCreate        (0,"LEB31", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB31","Next Investing : "+DoubleToString(mon,2), 12, "Calibri Bold", clrWhiteSmoke);
      ObjectSetInteger    (0,"LEB31", OBJPROP_XDISTANCE,10);
      ObjectSetInteger    (0,"LEB31", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB31", OBJPROP_CORNER,CORNER_LEFT_UPPER);
      
      }
    
  if(USE_INDI1 ==false  && USE_INDI2 ==false && USE_INDI3 ==false && USE_INDI4 ==false && USE_INDI5 ==false && 
      USE_INDI6 ==false  && USE_INDI7 ==false && USE_INDI8 ==false && USE_INDI9 ==false && USE_INDI10==false &&
      USE_INDI11==false  && USE_INDI12==false && USE_INDI13==false && USE_INDI14==false && USE_INDI15==false &&
      USE_INDI16==false  && USE_INDI17==false && USE_INDI18==false && USE_INDI19==false && USE_INDI20==false &&
      USE_INDI21==false  && USE_INDI22==false && USE_INDI23==false && USE_INDI24==false )
      {
      ObjectDelete        (0,"LEB0");
      ObjectCreate        (0,"LEB0", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB0","No Indicator Used", 18, "Calibri Bold", clrRed);
      ObjectSetInteger    (0,"LEB0", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB0", OBJPROP_YDISTANCE,50);
      ObjectSetInteger    (0,"LEB0", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      return ;
      }
      
      
  int Y = 50 ; 
  color  ind1C = clrWhiteSmoke ;
  color  ind2C = clrWhiteSmoke ;
  color  ind3C = clrWhiteSmoke ;
  color  ind4C = clrWhiteSmoke ;
  color  ind5C = clrWhiteSmoke ;
  color  ind6C = clrWhiteSmoke ;
  color  ind7C = clrWhiteSmoke ;
  color  ind8C = clrWhiteSmoke ;
  color  ind9C = clrWhiteSmoke ;
  color  ind10C = clrWhiteSmoke ;
  color  ind11C = clrWhiteSmoke ;
  color  ind12C = clrWhiteSmoke ;
  color  ind13C = clrWhiteSmoke ;
  color  ind14C = clrWhiteSmoke ;
  color  ind15C = clrWhiteSmoke ;
  color  ind16C = clrWhiteSmoke ;
  color  ind17C = clrWhiteSmoke ;
  color  ind18C = clrWhiteSmoke ;
  color  ind19C = clrWhiteSmoke ;
  color  ind20C = clrWhiteSmoke ;
  color  ind21C = clrWhiteSmoke ;
  color  ind22C = clrWhiteSmoke ;
  color  ind23C = clrWhiteSmoke ;
  color  ind24C = clrWhiteSmoke ;
  
  string ind1T = "NULL"        ;
  string ind2T = "NULL"        ;
  string ind3T = "NULL"        ;
  string ind4T = "NULL"        ;
  string ind5T = "NULL"        ;
  string ind6T = "NULL"        ;
  string ind7T = "NULL"        ;
  string ind8T = "NULL"        ;
  string ind9T = "NULL"        ;
  string ind10T = "NULL"        ;
  string ind11T = "NULL"        ;
  string ind12T = "NULL"        ;
  string ind13T = "NULL"        ;
  string ind14T = "NULL"        ;
  string ind15T = "NULL"        ;
  string ind16T = "NULL"        ;
  string ind17T = "NULL"        ;
  string ind18T = "NULL"        ;
  string ind19T = "NULL"        ;
  string ind20T = "NULL"        ;
  string ind21T = "NULL"        ;
  string ind22T = "NULL"        ;
  string ind23T = "NULL"        ;
  string ind24T = "NULL"        ;
  
  
  
  
  if (USE_INDI1==true)
      {
      if (IND1B()==true){ind1C = clrLime ;ind1T = "BUY" ;}
      if (IND1S()==true){ind1C = clrRed  ;ind1T = "SELL";}
      ObjectDelete        (0,"LEB1");
      ObjectCreate        (0,"LEB1", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB1","TripleProfitWinner  : "+ind1T, 12, "Calibri Bold", ind1C);
      ObjectSetInteger    (0,"LEB1", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB1", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB1", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
  if (USE_INDI2==true)
      {
      if (IND2B()==true){ind2C = clrLime ;ind2T = "BUY" ;}
      if (IND2S()==true){ind2C = clrRed  ;ind2T = "SELL";}
      ObjectDelete        (0,"LEB2");
      ObjectCreate        (0,"LEB2", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB2","Xmaster Formula  : "+ind2T, 12, "Calibri Bold", ind2C);
      ObjectSetInteger    (0,"LEB2", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB2", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB2", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
  if (USE_INDI3==true)
      {
      if (IND3B()==true){ind3C = clrLime ;ind3T = "BUY" ;}
      if (IND3S()==true){ind3C = clrRed  ;ind3T = "SELL";}
      ObjectDelete        (0,"LEB3");
      ObjectCreate        (0,"LEB3", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB3","Mega_Fx  : "+ind3T, 12, "Calibri Bold", ind3C);
      ObjectSetInteger    (0,"LEB3", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB3", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB3", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
  if (USE_INDI4==true)
      {
      if (IND4B()==true){ind4C = clrLime ;ind4T = "BUY" ;}
      if (IND4S()==true){ind4C = clrRed  ;ind4T = "SELL";}
      ObjectDelete        (0,"LEB4");
      ObjectCreate        (0,"LEB4", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB4","PZ_DayTrading  : "+ind4T, 12, "Calibri Bold", ind4C);
      ObjectSetInteger    (0,"LEB4", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB4", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB4", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI5==true)
      {
      if (IND5B()==true){ind5C = clrLime ;ind5T = "BUY" ;}
      if (IND5S()==true){ind5C = clrRed  ;ind5T = "SELL";}
      ObjectDelete        (0,"LEB5");
      ObjectCreate        (0,"LEB5", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB5","BinaryComodo  : "+ind5T, 12, "Calibri Bold", ind5C);
      ObjectSetInteger    (0,"LEB5", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB5", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB5", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI6==true)
      {
      if (IND6B()==true){ind6C = clrLime ;ind6T = "BUY" ;}
      if (IND6S()==true){ind6C = clrRed  ;ind6T = "SELL";}
      ObjectDelete        (0,"LEB6");
      ObjectCreate        (0,"LEB6", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB6","gfk forex2  : "+ind6T, 12, "Calibri Bold", ind6C);
      ObjectSetInteger    (0,"LEB6", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB6", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB6", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI7==true)
      {
      if (IND7B()==true){ind7C = clrLime ;ind7T = "BUY" ;}
      if (IND7S()==true){ind7C = clrRed  ;ind7T = "SELL";}
      ObjectDelete        (0,"LEB7");
      ObjectCreate        (0,"LEB7", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB7","UltimateProScalper  : "+ind7T, 12, "Calibri Bold", ind7C);
      ObjectSetInteger    (0,"LEB7", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB7", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB7", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   
   if (USE_INDI8==true)
      {
      if (IND8B()==true){ind8C = clrLime ;ind8T = "BUY" ;}
      if (IND8S()==true){ind8C = clrRed  ;ind8T = "SELL";}
      ObjectDelete        (0,"LEB8");
      ObjectCreate        (0,"LEB8", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB8","100pipstodayscalper  : "+ind8T, 12, "Calibri Bold", ind8C);
      ObjectSetInteger    (0,"LEB8", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB8", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB8", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI9==true)
      {
      if (IND9B()==true){ind9C = clrLime ;ind9T = "BUY" ;}
      if (IND9S()==true){ind9C = clrRed  ;ind9T = "SELL";}
      ObjectDelete        (0,"LEB9");
      ObjectCreate        (0,"LEB9", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB9","StepMA NMC v3.01  : "+ind9T, 12, "Calibri Bold", ind9C);
      ObjectSetInteger    (0,"LEB9", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB9", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB9", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
    if (USE_INDI10==true)
      {
      if (IND10B()==true){ind10C = clrLime ;ind10T = "BUY" ;}
      if (IND10S()==true){ind10C = clrRed  ;ind10T = "SELL";}
      ObjectDelete        (0,"LEB10");
      ObjectCreate        (0,"LEB10", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB10","instantprofitscalper05  : "+ind10T, 12, "Calibri Bold", ind10C);
      ObjectSetInteger    (0,"LEB10", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB10", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB10", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
    if (USE_INDI11==true)
      {
      if (IND11B()==true){ind11C = clrLime ;ind11T = "BUY" ;}
      if (IND11S()==true){ind11C = clrRed  ;ind11T = "SELL";}
      ObjectDelete        (0,"LEB11");
      ObjectCreate        (0,"LEB11", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB11","Keltner Channel Pro  : "+ind11T, 12, "Calibri Bold", ind11C);
      ObjectSetInteger    (0,"LEB11", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB11", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB11", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI12==true)
      {
      if (IND12B()==true){ind12C = clrLime ;ind12T = "BUY" ;}
      if (IND12S()==true){ind12C = clrRed  ;ind12T = "SELL";}
      ObjectDelete        (0,"LEB12");
      ObjectCreate        (0,"LEB12", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB12","HalfTrend-1.02  : "+ind12T, 12, "Calibri Bold", ind12C);
      ObjectSetInteger    (0,"LEB12", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB12", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB12", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI13==true)
      {
      if (IND13B()==true){ind13C = clrLime ;ind13T = "BUY" ;}
      if (IND13S()==true){ind13C = clrRed  ;ind13T = "SELL";}
      ObjectDelete        (0,"LEB13");
      ObjectCreate        (0,"LEB13", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB13","Forex Indicator Pro  : "+ind13T, 12, "Calibri Bold", ind13C);
      ObjectSetInteger    (0,"LEB13", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB13", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB13", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }
   if (USE_INDI14==true)
      {
      if (IND14B()==true){ind14C = clrLime ;ind14T = "BUY" ;}
      if (IND14S()==true){ind14C = clrRed  ;ind14T = "SELL";}
      ObjectDelete        (0,"LEB14");
      ObjectCreate        (0,"LEB14", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB14","Binary Winner  : "+ind14T, 12, "Calibri Bold", ind14C);
      ObjectSetInteger    (0,"LEB14", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB14", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB14", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }

  if (USE_INDI15==true)
      {
      if (IND15B()==true){ind15C = clrLime ;ind15T = "BUY" ;}
      if (IND15S()==true){ind15C = clrRed  ;ind15T = "SELL";}
      ObjectDelete        (0,"LEB15");
      ObjectCreate        (0,"LEB15", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB15","MARVIN NON-REPAINT  : "+ind15T, 12, "Calibri Bold", ind15C);
      ObjectSetInteger    (0,"LEB15", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB15", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB15", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   

   if (USE_INDI16==true)
      {
      if (IND16B()==true){ind16C = clrLime ;ind16T = "BUY" ;}
      if (IND16S()==true){ind16C = clrRed  ;ind16T = "SELL";}
      ObjectDelete        (0,"LEB16");
      ObjectCreate        (0,"LEB16", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB16","DXTrade C4 Nitro  : "+ind16T, 12, "Calibri Bold", ind16C);
      ObjectSetInteger    (0,"LEB16", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB16", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB16", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI17==true)
      {
      if (IND17B()==true){ind17C = clrLime ;ind17T = "BUY" ;}
      if (IND17S()==true){ind17C = clrRed  ;ind17T = "SELL";}
      ObjectDelete        (0,"LEB17");
      ObjectCreate        (0,"LEB17", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB17","SixtySecondTrades  : "+ind17T, 12, "Calibri Bold", ind17C);
      ObjectSetInteger    (0,"LEB17", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB17", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB17", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI18==true)
      {
      if (IND18B()==true){ind18C = clrLime ;ind18T = "BUY" ;}
      if (IND18S()==true){ind18C = clrRed  ;ind18T = "SELL";}
      ObjectDelete        (0,"LEB18");
      ObjectCreate        (0,"LEB18", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB18","Binary-Reaper-V3  : "+ind18T, 12, "Calibri Bold", ind18C);
      ObjectSetInteger    (0,"LEB18", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB18", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB18", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI19==true)
      {
      if (IND19B()==true){ind19C = clrLime ;ind19T = "BUY" ;}
      if (IND19S()==true){ind19C = clrRed  ;ind19T = "SELL";}
      ObjectDelete        (0,"LEB19");
      ObjectCreate        (0,"LEB19", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB19","Super-Point-Signal  : "+ind19T, 12, "Calibri Bold", ind19C);
      ObjectSetInteger    (0,"LEB19", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB19", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB19", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI20==true)
      {
      if (IND20B()==true){ind20C = clrLime ;ind20T = "BUY" ;}
      if (IND20S()==true){ind20C = clrRed  ;ind20T = "SELL";}
      ObjectDelete        (0,"LEB20");
      ObjectCreate        (0,"LEB20", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB20","DeltaForce Indicator  : "+ind20T, 12, "Calibri Bold", ind20C);
      ObjectSetInteger    (0,"LEB20", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB20", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB20", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }  
   if (USE_INDI21==true)
      {
      if (IND21B()==true){ind21C = clrLime ;ind21T = "BUY" ;}
      if (IND21S()==true){ind21C = clrRed  ;ind21T = "SELL";}
      ObjectDelete        (0,"LEB21");
      ObjectCreate        (0,"LEB21", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB21","Binary Options Buddy 2.0  : "+ind21T, 12, "Calibri Bold", ind21C);
      ObjectSetInteger    (0,"LEB21", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB21", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB21", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI22==true)
      {
      if (IND22B()==true){ind22C = clrLime ;ind22T = "BUY" ;}
      if (IND22S()==true){ind22C = clrRed  ;ind22T = "SELL";}
      ObjectDelete        (0,"LEB22");
      ObjectCreate        (0,"LEB22", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB22","FX Scalper_build600  : "+ind22T, 12, "Calibri Bold", ind22C);
      ObjectSetInteger    (0,"LEB22", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB22", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB22", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI23==true)
      {
      if (IND23B()==true){ind23C = clrLime ;ind23T = "BUY" ;}
      if (IND23S()==true){ind23C = clrRed  ;ind23T = "SELL";}
      ObjectDelete        (0,"LEB23");
      ObjectCreate        (0,"LEB23", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB23","StochasticZones : "+ind23T, 12, "Calibri Bold", ind23C);
      ObjectSetInteger    (0,"LEB23", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB23", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB23", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
   if (USE_INDI24==true)
      {
      if (IND24B()==true){ind24C = clrLime ;ind24T = "BUY" ;}
      if (IND24S()==true){ind24C = clrRed  ;ind24T = "SELL";}
      ObjectDelete        (0,"LEB24");
      ObjectCreate        (0,"LEB24", OBJ_LABEL, 0, 0, 0);
      ObjectSetText       ("LEB24","MACD : "+ind24T, 12, "Calibri Bold", ind24C);
      ObjectSetInteger    (0,"LEB24", OBJPROP_XDISTANCE,200);
      ObjectSetInteger    (0,"LEB24", OBJPROP_YDISTANCE,Y);
      ObjectSetInteger    (0,"LEB24", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      Y +=20 ;
      }   
      
   
 
 }
//========================================================================
//============================= TripleProfitWinner =======================

bool IND1B()
{
 bool re = false ;
 if (USE_INDI1==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,0,1);
 double IND2 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,1,1);
 double IND3 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,2,1);
 double IND4 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,3,1);
 double IND5 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,4,1);
 double IND6 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,5,1);
 double IND7 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,6,1);
 double IND8 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,7,1);
 
 if (IND1!=EMPTY_VALUE&&IND2!=EMPTY_VALUE&&IND3==EMPTY_VALUE&&IND4!=EMPTY_VALUE&&IND5!=EMPTY_VALUE&&IND6==EMPTY_VALUE&&IND7==EMPTY_VALUE&&IND8!=EMPTY_VALUE)
    {
    re = true ;
    }
 
 
 return re ;
} 
bool IND1S()
{
 bool re = false ;
 if (USE_INDI1==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,0,1);
 double IND2 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,1,1);
 double IND3 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,2,1);
 double IND4 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,3,1);
 double IND5 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,4,1);
 double IND6 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,5,1);
 double IND7 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,6,1);
 double IND8 = iCustom(Symbol(),Period(),"TripleProfitWinner",INDI1_v1,INDI1_v2,INDI1_v2,150,150,false,false,clrBlue,clrRed,clrGreen,clrOrange,clrViolet,clrYellow,0,7,1);
 
 if (IND1==EMPTY_VALUE&&IND2!=EMPTY_VALUE&&IND3!=EMPTY_VALUE&&IND4!=EMPTY_VALUE&&IND5==EMPTY_VALUE&&IND6==EMPTY_VALUE&&IND7!=EMPTY_VALUE&&IND8!=EMPTY_VALUE)
    {
    re = true ;
    }
 
 return re ;
} 
//========================================================================
//======================== Xmaster Formula ===============================

bool IND2B()
{
 bool re = false ;
 if (USE_INDI2==false){re = true ;return re ;}
  double IND1 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,0,1);
  double IND2 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,1,1);
  double IND3 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,2,1);
  double IND4 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,3,1);
  double IND5 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,4,1);
  if(EMPTY&&IND1!=EMPTY_VALUE && IND2==EMPTY_VALUE)
    {
    re = true ;
    }
 
 return re ;
} 
bool IND2S()
{
 bool re = false ;
 if (USE_INDI2==false){re = true ;return re ;}
  double IND1 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,0,1);
  double IND2 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,1,1);
  double IND3 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,2,1);
  double IND4 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,3,1);
  double IND5 = iCustom(Symbol(),Period(),"Xmaster Formula",false,false,4,1);
  if(IND2!=EMPTY_VALUE && EMPTY&&IND1==EMPTY_VALUE)
    {
    re = true ;
    }
    
 return re ;
} 
//========================================================================
//======================= Mega_Fx ========================================
bool IND3B()
{
 bool re = false ;
 if (USE_INDI3==false){re = true ;return re ;}
  double IND1 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,0,1);
  double IND2 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,1,1);
  double IND3 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,2,1);
  double IND4 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,3,1);
  double IND5 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,4,1);
  double IND6 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,5,1);
  if (IND2>0 && IND3==0)
     {
     re = true ;
     }

 return re ;
} 
bool IND3S()
{
 bool re = false ;
 if (USE_INDI3==false){re = true ;return re ;}
  double IND1 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,0,1);
  double IND2 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,1,1);
  double IND3 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,2,1);
  double IND4 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,3,1);
  double IND5 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,4,1);
  double IND6 = iCustom(Symbol(),Period(),"Mega_Fx",false,false,"alert.wave",false,5,1);
  if (IND2==0 && IND3<0)
     {
     re = true ;
     }
 return re ;
} 
//========================================================================
//========================= PZ_DayTrading ================================

bool IND4B()
{
 bool re = false ;
 if (USE_INDI4==false){re = true ;return re ;}
 for (int i = 0 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",0,i+1);
      double IND2 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",1,i+1);
      double IND3 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",2,i+1);
 
      if (IND2!=EMPTY_VALUE)break ;
      if (IND1!=EMPTY_VALUE){re=true ; break ;}
     }
 
 return re ;
} 
bool IND4S()
{
 bool re = false ;
 if (USE_INDI4==false){re = true ;return re ;}
 for (int i = 0 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",0,i+1);
      double IND2 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",1,i+1);
      double IND3 = iCustom(Symbol(),Period(),"PZ_DayTrading","",false,INDI4_v1,INDI4_v2,INDI4_v3,INDI4_v4,"","",false,false,clrPurple,clrBlue,"",clrSkyBlue,clrTomato,"","",false,false,false,"alert.wav",2,i+1);
 
      if (IND1!=EMPTY_VALUE)break ;
      if (IND2!=EMPTY_VALUE){re=true ; break ;}
     }
 
 return re ;
} 
//========================================================================
//=================== BinaryComodo =======================================
 
bool IND5B()
{
 bool re = false ;
 if (USE_INDI5==false){re = true ;return re ;}
 for (int i = 1 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"BinaryComodo",INDI5_v1,INDI5_v2,INDI4_v3,false,0,i);
      double IND2 = iCustom(Symbol(),Period(),"BinaryComodo",INDI5_v1,INDI5_v2,INDI4_v3,false,1,i);
 
      if (IND2!=EMPTY_VALUE){re=false;break  ;}
      if (IND1!=EMPTY_VALUE){re=true ; break ;}
     }
 
 return re ;
} 
bool IND5S()
{
 bool re = false ;
 if (USE_INDI5==false){re = true ;return re ;}
 for (int i = 1 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"BinaryComodo",INDI5_v1,INDI5_v2,INDI4_v3,false,0,i);
      double IND2 = iCustom(Symbol(),Period(),"BinaryComodo",INDI5_v1,INDI5_v2,INDI4_v3,false,1,i);
      
 
      if (IND1!=EMPTY_VALUE){re=false;break  ;}
      if (IND2!=EMPTY_VALUE){re=true ; break ;}
     }
 
 return re ;
} 
//========================================================================
//===================== gfk forex2 =======================================

bool IND6B()
{
 bool re = false ;
 if (USE_INDI6==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"gfk forex2",false,false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"gfk forex2",false,false,1,1);
      double IND3 = iCustom(Symbol(),Period(),"gfk forex2",false,false,2,1);
      double IND4 = iCustom(Symbol(),Period(),"gfk forex2",false,false,3,1);
      double IND5 = iCustom(Symbol(),Period(),"gfk forex2",false,false,4,1);
      if (IND2==EMPTY_VALUE )
         {
         re = true ;
         }
 return re ;
} 
bool IND6S()
{
 bool re = false ;
 if (USE_INDI6==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"gfk forex2",false,false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"gfk forex2",false,false,1,1);
      double IND3 = iCustom(Symbol(),Period(),"gfk forex2",false,false,2,1);
      double IND4 = iCustom(Symbol(),Period(),"gfk forex2",false,false,3,1);
      double IND5 = iCustom(Symbol(),Period(),"gfk forex2",false,false,4,1);
      if (IND2!=EMPTY_VALUE )
         {
         re = true ;
         }
 return re ;
} 
//========================================================================
//======================== UltimateProScalper ============================
bool IND7B()
{
 bool re = false ;
 if (USE_INDI7==false){re = true ;return re ;}
 for (int i = 0 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,0,i+1);
      double IND2 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,1,i+1);
      double IND3 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,2,i+1);
      double IND4 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,3,i+1);
      double IND5 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,4,i+1);
      double IND6 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,5,i+1);
      double IND7 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,6,i+1);
      double IND8 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,7,i+1);
      if (IND4!=EMPTY_VALUE)break;
      if (IND3!=EMPTY_VALUE){re=true;break;}
    }
      
 return re ;
} 
bool IND7S()
{
 bool re = false ;
 if (USE_INDI7==false){re = true ;return re ;}
 for (int i=0 ; i<Bars ; i++)
     {
      double IND1 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,0,i+1);
      double IND2 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,1,i+1);
      double IND3 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,2,i+1);
      double IND4 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,3,i+1);
      double IND5 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,4,i+1);
      double IND6 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,5,i+1);
      double IND7 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,6,i+1);
      double IND8 = iCustom(Symbol(),Period(),"UltimateProScalper",INDI7_v1,148,188,false,false,0,7,i+1);
      if (IND3!=EMPTY_VALUE)break;
      if (IND4!=EMPTY_VALUE){re=true;break;}
    }
      
 return re ;
} 
//========================================================================
//==================== 100pipstodayscalper ===============================
bool IND8B()
{
 bool re = false ;
 if (USE_INDI8==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,0,1);
 double IND2 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,1,1);
 double IND3 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,2,1);
 double IND4 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,3,1);
 if (IND1!=EMPTY_VALUE && IND2==EMPTY_VALUE )
    {
    re=true ;
    }
 return re ;
} 
bool IND8S()
{
 bool re = false ;
 if (USE_INDI8==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,0,1);
 double IND2 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,1,1);
 double IND3 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,2,1);
 double IND4 = iCustom(Symbol(),Period(),"100pipstodayscalper",INDI8_v1,INDI8_v2,88,48,false,false,9,clrYellow,clrRed,3,1);
 if (IND1==EMPTY_VALUE && IND2!=EMPTY_VALUE )
    {
    re=true ;
    }
 return re ;
} 
//========================================================================
//==================== StepMA NMC v3.01 ==================================
bool IND9B()
{
 bool re = false ;
 if (USE_INDI9==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,0,2);
 double IND2 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,1,2);
 double IND3 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,2,2);
 double IND4 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,3,2);
 double IND5 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,4,2);
 if (IND1!=EMPTY_VALUE&&IND2==EMPTY_VALUE)
    {
    re=true ;
    }
 return re ;
} 
bool IND9S()
{
 bool re = false ;
 if (USE_INDI9==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,0,2);
 double IND2 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,1,2);
 double IND3 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,2,2);
 double IND4 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,3,2);
 double IND5 = iCustom(Symbol(),Period(),"StepMA NMC v3.01",INDI9_v1,INDI9_v2,INDI9_v3,INDI9_v4,INDI9_v5,INDI9_v6,INDI9_v7,INDI9_v8,false,false,false,false,false,false,false,false,2,233,234,false,4,2);
 if (IND1!=EMPTY_VALUE&&IND2!=EMPTY_VALUE)
    {
    re=true ;
    }
 return re ;
} 
//========================================================================
//================== instantprofitscalper05 ==============================
bool IND10B()
{
 bool re = false ;
 if (USE_INDI10==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"instantprofitscalper05",3,1,9,false,false,INDI10_v1,0,1);
 double IND2 = iCustom(Symbol(),Period(),"instantprofitscalper05",3,1,9,false,false,INDI10_v1,1,1);
 if (IND1!=EMPTY_VALUE && IND1!=-1)
    {
    re = true ;
    }
 return re ;
} 
bool IND10S()
{
 bool re = false ;
 if (USE_INDI10==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"instantprofitscalper05",3,1,9,false,false,INDI10_v1,0,1);
 double IND2 = iCustom(Symbol(),Period(),"instantprofitscalper05",3,1,9,false,false,INDI10_v1,1,1);
 if (IND2!=EMPTY_VALUE && IND2!=-1)
    {
    re = true ;
    }
 return re ;
} 
//========================================================================
//==================== Keltner Channel Pro ===============================
bool IND11B()
{
 bool re = false ;
 if (USE_INDI11==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,0,1);
 double IND2 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,1,1);
 double IND3 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,2,1);
 double IND4 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,3,1);
 double IND5 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,4,1);
 double IND6 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,5,1);
 double IND7 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,6,1);
 double IND8 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,7,1);
 
 if (IND1!=EMPTY_VALUE&&IND2!=EMPTY_VALUE&&IND3==EMPTY_VALUE&&IND5!=EMPTY_VALUE&&IND6!=EMPTY_VALUE&&IND7==EMPTY_VALUE)
    {
    re = true ;
    }
 return re ;
} 
bool IND11S()
{
 bool re = false ;
 if (USE_INDI11==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,0,1);
 double IND2 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,1,1);
 double IND3 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,2,1);
 double IND4 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,3,1);
 double IND5 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,4,1);
 double IND6 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,5,1);
 double IND7 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,6,1);
 double IND8 = iCustom(Symbol(),Period(),"Keltner Channel Pro",INDI11_v1,INDI11_v2,INDI11_v3,INDI11_v4,INDI11_v5,INDI11_v6,INDI11_v7,INDI11_v8,INDI11_v9,INDI11_v10,INDI11_v11,INDI11_v12,INDI11_v13,INDI11_v14,"Keltner Channel",clrDodgerBlue,clrBlack,clrRed,clrBlack,false,false,false,false,false,7,1);
 
 if (IND1!=EMPTY_VALUE&&IND2!=EMPTY_VALUE&&IND3!=EMPTY_VALUE&&IND5!=EMPTY_VALUE&&IND6!=EMPTY_VALUE&&IND7!=EMPTY_VALUE)
    {
    re = true ;
    }
 return re ;
} 
//========================================================================
//=================== HalfTrend-1.02 =====================================
bool IND12B()
{
 bool re = false ;
 if (USE_INDI12==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,0,2);
 double IND2 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,1,2);
 double IND3 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,2,2);
 double IND4 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,3,2);
 double IND5 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,4,2);
 double IND6 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,5,2);
 if(IND1!=0&&IND2==0)
   {
   re = true ;
   }
 return re ;
} 
bool IND12S()
{
 bool re = false ;
 if (USE_INDI12==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,0,2);
 double IND2 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,1,2);
 double IND3 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,2,2);
 double IND4 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,3,2);
 double IND5 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,4,2);
 double IND6 = iCustom(Symbol(),Period(),"HalfTrend-1.02",INDI12_v1,false,false,false,false,false,false,false,5,2);
 if(IND2!=0&&IND1==0)
   {
   re = true ;
   }
 return re ;
} 
//========================================================================
//================== Forex Indicator Pro(binary) =========================
bool IND13B()
{
 bool re = false ;
 if (USE_INDI13==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,0,1);
 double IND2 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,1,1);
 double IND3 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,2,1);
 double IND4 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,3,1);
 if (IND1>0)
    {
    re = true ;
    }
 return re ;
} 
bool IND13S()
{
 bool re = false ;
 if (USE_INDI13==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,0,1);
 double IND2 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,1,1);
 double IND3 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,2,1);
 double IND4 = iCustom(Symbol(),Period(),"Forex Indicator Pro(binary)",clrBlack,INDI13_v1,INDI13_v2,INDI13_v3,100,false,false,3,1);
 if (IND2>0)
    {
    re = true ;
    }
 return re ;
} 
//========================================================================
//======================= Binary Winner ==================================
bool IND14B()
{
 bool re = false ;
 if (USE_INDI14==false){re = true ;return re ;}
 
      double IND1 = iCustom(Symbol(),Period(),"Binary Winner",INDI14_v1,0,1);
      double IND2 = iCustom(Symbol(),Period(),"Binary Winner",INDI14_v1,1,1);
   
      if (IND1!=EMPTY_VALUE)re=true;
 return re ;
} 
bool IND14S()
{
 bool re = false ;
 if (USE_INDI14==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"Binary Winner",INDI14_v1,0,1);
      double IND2 = iCustom(Symbol(),Period(),"Binary Winner",INDI14_v1,1,1);
   
      if (IND2!=EMPTY_VALUE)re=true;
 
 return re ;
} 
//========================================================================
//======================== MARVIN NON-REPAINT ============================
bool IND15B()
{
 bool re = false ;
 if (USE_INDI15==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"MARVIN NON-REPAINT",false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"MARVIN NON-REPAINT",false,1,1);
   
      if (IND1!=0)re=true;   
 return re ;
} 
bool IND15S()
{
 bool re = false ;
 if (USE_INDI15==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"MARVIN NON-REPAINT",false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"MARVIN NON-REPAINT",false,1,1);
   
      if (IND2!=0)re=true; 
 return re ;
} 
//========================================================================
//======================== DXTrade C4 Nitro ==============================
bool IND16B()
{
 bool re = false ;
 if (USE_INDI16==false){re = true ;return re ;}
 for (int i=1; i<Bars ; i++ ) 
     {
      double IND1 = iCustom(Symbol(),Period(),"DXTrade C4 Nitro",INDI16_v1,INDI16_v2,INDI16_v3,true,true,true,"Default Font Colors",clrDodgerBlue,clrLime,clrRed,clrBlack,"Distance of Indicator",5,20,"What corner?","Upper left=0; Upper right=1","Lower left=2; Lower right=3",1,0,i);
      double IND2 = iCustom(Symbol(),Period(),"DXTrade C4 Nitro",INDI16_v1,INDI16_v2,INDI16_v3,true,true,true,"Default Font Colors",clrDodgerBlue,clrLime,clrRed,clrBlack,"Distance of Indicator",5,20,"What corner?","Upper left=0; Upper right=1","Lower left=2; Lower right=3",1,1,i);
      if (IND2!=EMPTY_VALUE){break;} 
      if (IND1!=EMPTY_VALUE){re=true;break;}  
      }
 return re ;
} 
bool IND16S()
{
 bool re = false ;
 if (USE_INDI16==false){re = true ;return re ;}
 for (int i=1; i<Bars ; i++ ) 
     {
      double IND1 = iCustom(Symbol(),Period(),"DXTrade C4 Nitro",INDI16_v1,INDI16_v2,INDI16_v3,true,true,true,"Default Font Colors",clrDodgerBlue,clrLime,clrRed,clrBlack,"Distance of Indicator",5,20,"What corner?","Upper left=0; Upper right=1","Lower left=2; Lower right=3",1,0,i);
      double IND2 = iCustom(Symbol(),Period(),"DXTrade C4 Nitro",INDI16_v1,INDI16_v2,INDI16_v3,true,true,true,"Default Font Colors",clrDodgerBlue,clrLime,clrRed,clrBlack,"Distance of Indicator",5,20,"What corner?","Upper left=0; Upper right=1","Lower left=2; Lower right=3",1,1,i);
      if (IND1!=EMPTY_VALUE){break;} 
      if (IND2!=EMPTY_VALUE){re=true;break;}  
      }
 return re ;
} 
//========================================================================
//====================== SixtySecondTrades ===============================
bool IND17B()
{
 bool re = false ;
 if (USE_INDI17==false){re = true ;return re ;}
 for (int i=1; i<Bars ; i++ ) 
     {
      double IND1 = iCustom(Symbol(),Period(),"SixtySecondTrades",INDI17_v1,INDI17_v2,0,i);
      double IND2 = iCustom(Symbol(),Period(),"SixtySecondTrades",INDI17_v1,INDI17_v2,1,i);
      if (IND2!=0){break;} 
      if (IND1!=0){re=true;break;}  
      }
 return re ;
} 
bool IND17S()
{
 bool re = false ;
 if (USE_INDI17==false){re = true ;return re ;}
 for (int i=1; i<Bars ; i++ ) 
     {
      double IND1 = iCustom(Symbol(),Period(),"SixtySecondTrades",INDI17_v1,INDI17_v2,0,i);
      double IND2 = iCustom(Symbol(),Period(),"SixtySecondTrades",INDI17_v1,INDI17_v2,1,i);
      if (IND1!=0){break;} 
      if (IND2!=0){re=true;break;}  
      }
 
 return re ;
} 
//========================================================================
//========================== Binary-Reaper-V3 ============================
bool IND18B()
{
 bool re = false ;
 if (USE_INDI18==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"Binary-Reaper-V3",INDI18_v1,INDI18_v2,"Settings for alerts",true,true,true,false,false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"Binary-Reaper-V3",INDI18_v1,INDI18_v2,"Settings for alerts",true,true,true,false,false,1,1);
      if (IND1!=EMPTY_VALUE)re=true; 
 
 return re ;
} 
bool IND18S()
{
 bool re = false ;
 if (USE_INDI18==false){re = true ;return re ;}
    double IND1 = iCustom(Symbol(),Period(),"Binary-Reaper-V3",INDI18_v1,INDI18_v2,"Settings for alerts",true,true,true,false,false,0,1);
    double IND2 = iCustom(Symbol(),Period(),"Binary-Reaper-V3",INDI18_v1,INDI18_v2,"Settings for alerts",true,true,true,false,false,1,1);
      if (IND2!=EMPTY_VALUE)re=true;
 return re ;
} 
//========================================================================
//========================= Super-Point-Signal ===========================
bool IND19B()
{
 bool re = false ;
 if (USE_INDI19==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"Super-Point-Signal",INDI19_v1,true,true,"alert2.wav","email.wav",false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"Super-Point-Signal",INDI19_v1,true,true,"alert2.wav","email.wav",false,1,1);
      if (IND1!=0)re=true;
 return re ;
} 
bool IND19S()
{
 bool re = false ;
 if (USE_INDI19==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"Super-Point-Signal",INDI19_v1,true,true,"alert2.wav","email.wav",false,0,1);
      double IND2 = iCustom(Symbol(),Period(),"Super-Point-Signal",INDI19_v1,true,true,"alert2.wav","email.wav",false,1,1);
      if (IND2!=0)re=true;
 
 return re ;
} 
//========================================================================
//========================== DeltaForce Indicator ========================
bool IND20B()
{
 bool re = false ;
 if (USE_INDI20==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"DeltaForce Indicator","<< Settings >>",true,false,INDI20_v1,INDI20_v2,INDI20_v3,0,1);
      double IND2 = iCustom(Symbol(),Period(),"DeltaForce Indicator","<< Settings >>",true,false,INDI20_v1,INDI20_v2,INDI20_v3,1,1);
      if (IND1!=0)re=true;
 
 return re ;
} 
bool IND20S()
{
 bool re = false ;
 if (USE_INDI20==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"DeltaForce Indicator","<< Settings >>",true,false,INDI20_v1,INDI20_v2,INDI20_v3,0,1);
      double IND2 = iCustom(Symbol(),Period(),"DeltaForce Indicator","<< Settings >>",true,false,INDI20_v1,INDI20_v2,INDI20_v3,1,1);
      if (IND2!=0)re=true;
 return re ;
} 
//========================================================================
//========================== Binary Options Buddy 2.0 ====================
bool IND21B()
{
 bool re = false ;
 if (USE_INDI21==false){re = true ;return re ;}
      
 
 return re ;
} 
bool IND21S()
{
 bool re = false ;
 if (USE_INDI21==false){re = true ;return re ;}
 
 return re ;
} 
//========================================================================
//========================= FX Scalper_build600===========================
bool IND22B()
{
 bool re = false ;
 if (USE_INDI22==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"FX Scalper_build600",INDI22_v1,168,323,true,0,INDI22_v2,true,0,1);
      double IND2 = iCustom(Symbol(),Period(),"FX Scalper_build600",INDI22_v1,168,323,true,0,INDI22_v2,true,1,1);
      if (IND1!=0)re=true;
 return re ;
} 
bool IND22S()
{
 bool re = false ;
 if (USE_INDI22==false){re = true ;return re ;}
      double IND1 = iCustom(Symbol(),Period(),"FX Scalper_build600",INDI22_v1,168,323,true,0,INDI22_v2,true,0,1);
      double IND2 = iCustom(Symbol(),Period(),"FX Scalper_build600",INDI22_v1,168,323,true,0,INDI22_v2,true,1,1);
      if (IND2!=0)re=true;
 
 return re ;
} 
//========================================================================
//============================ StochasticZones ===========================
bool IND23B()
{
 bool re = false ;
 if (USE_INDI23==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"StochasticZones","","","","","",INDI23_v1,"",INDI23_v2,INDI23_v3,INDI23_v4,"",INDI23_v5,"",INDI23_v6,"",INDI23_v7,"",INDI23_v8,false,false,false,false,false,false,1,1);
 //double IND1 = iStochastic(Symbol(),INDI23_v1,INDI23_v2,INDI23_v3,INDI23_v4,INDI23_v5,INDI23_v6,MODE_SIGNAL,1);
 if(IND1<=INDI23_v8)re=true;
 return re ;
} 
bool IND23S()
{
 bool re = false ;
 if (USE_INDI23==false){re = true ;return re ;}
 double IND1 = iCustom(Symbol(),Period(),"StochasticZones","","","","","",INDI23_v1,"",INDI23_v2,INDI23_v3,INDI23_v4,"",INDI23_v5,"",INDI23_v6,"",INDI23_v7,"",INDI23_v8,false,false,false,false,false,false,1,1);
 //double IND1 = iStochastic(Symbol(),INDI23_v1,INDI23_v2,INDI23_v3,INDI23_v4,INDI23_v5,INDI23_v6,MODE_SIGNAL,1);
 if(IND1>=INDI23_v7)re=true;
 return re ;
} 
//========================================================================
//============================ MACD ===========================
bool IND24B()
{
 int MACDCrossUp=0;
 for(int i=INDI24_v8;i<(INDI24_v2+INDI24_v3+INDI24_v4)*10 && MACDCrossUp==0;i++)
      {
      double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,i);
      double IND1_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,1+i);
      if(IND1>0 && IND1_1<0)MACDCrossUp=i;
      }
 bool NoBuyTradesThisWave=Time[MACDCrossUp]>LastBuyTime;
 bool re = false ;
 if (USE_INDI24==false){re = true ;return re ;}
 double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,INDI24_v8);
 double IND2 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,INDI24_v8);
 double IND1_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,1+INDI24_v8);
 double IND2_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,1+INDI24_v8);
 if(((IND1>0 && NoBuyTradesThisWave && INDI24_v7) || (IND1>IND2 && !INDI24_v7))&&!IND24BClose())re=true;//IND1>0 && 
 //Print(IND1," ",IND2," ",IND24BClose()," ",INDI24_v7," ",re);
 return re ;
 
} 
bool IND24S()
{
 int MACDCrossDown=0;
 for(int i=INDI24_v8;i<(INDI24_v2+INDI24_v3+INDI24_v4)*10 && MACDCrossDown==0;i++)
      {
      double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,i);
      double IND1_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,1+i);
      if(IND1<0 && IND1_1>0)MACDCrossDown=i;
      }
 bool NoSellTradesThisWave=Time[MACDCrossDown]>LastSellTime;
 bool re = false ;
 if (USE_INDI24==false){re = true ;return re ;}
 double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,INDI24_v8);
 double IND2 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,INDI24_v8);
 double IND1_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,1+INDI24_v8);
 double IND2_1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,1+INDI24_v8);
 if(((IND1<0 && NoSellTradesThisWave && INDI24_v7) || (IND1<IND2 && !INDI24_v7))&&!IND24SClose())re=true;//IND1<0 && 
 return re ;
} 

bool IND24SClose()
{
 bool re = false ;
 if (USE_INDI24==false){re = false ;return re ;}
 double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,INDI24_v9);
 double IND2 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,INDI24_v9);
 if(IND1>IND2)re=true;//IND1>0 && 
 return re ;
} 
bool IND24BClose()
{
 bool re = false ;
 if (USE_INDI24==false){re = false ;return re ;}
 double IND1 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_MAIN,INDI24_v9);
 double IND2 = iMACD(Symbol(),INDI24_v1,INDI24_v2,INDI24_v3,INDI24_v4,INDI24_v5,MODE_SIGNAL,INDI24_v9);
 if(IND1<IND2)re=true;//IND1<0 && 
 return re ;
} 









//========================================================================

//========================= Secure Mode 1 ================================
void Secure1()
 {
   double PRICE = 0 ;
   string T = "";
 for (int i=0;i<OrdersTotal();i++)                                                                                               
   {                                                                                                          
                                                                                                              
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)                                                     
         {                                                                                                    
          if (OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             PRICE = OrderOpenPrice() ;
              T = "BUY";
             }
          if (OrderType()==OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             PRICE = OrderOpenPrice() ;
              T = "SELL";
             }
         }
     }
    if (T=="BUY")
       {
       if (Bid>=NormalizeDouble(PRICE+(SECURE_POINT_1*_Point),_Digits))SP1=true;
       if (Bid>=NormalizeDouble(PRICE+((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits))SP2=true;
       }
   if (T=="SELL")
       {
       if (Ask<=NormalizeDouble(PRICE-(SECURE_POINT_1*_Point),_Digits))SP1=true;
       if (Ask<=NormalizeDouble(PRICE-((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits))SP2=true;
       }
   if (SP1==true&&T=="BUY")
      {
      if (Bid<=NormalizeDouble(PRICE+((SECURE_POINT_1-Dis_From_Price)*_Point),_Digits))CLOSEB();
      }
   if (SP2==true&&T=="BUY")
      {
      if (Bid<=NormalizeDouble(PRICE+(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits))CLOSEB();
      }
   if (SP1==true&&T=="SELL")
      {
      if (Ask>=NormalizeDouble(PRICE-((SECURE_POINT_1-Dis_From_Price)*_Point),_Digits))CLOSES();
      }
  if (SP2==true&&T=="SELL")
      {
      if (Ask>=NormalizeDouble(PRICE-(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits))CLOSES();
      }
 
 
 }
//========================================================================

//========================= Secure Mode 2 ================================
void Secure2()
 {
   
 for (int i=0;i<OrdersTotal();i++)                                                                                               
   {                                                                                                          
                                                                                                              
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)                                                     
         {                                                                                                    
          if (OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             if(Bid>=NormalizeDouble(OrderOpenPrice()+(SECURE_POINT_1*_Point),_Digits)&& OrderStopLoss()!=NormalizeDouble(OrderOpenPrice()+((SECURE_POINT_1-Dis_From_Price)*_Point),_Digits))
               {
               int MODB = OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+((SECURE_POINT_1+Dis_From_Price)*_Point),_Digits),OrderTakeProfit(),0,clrNONE);
               }
             if(Bid>=NormalizeDouble(OrderOpenPrice()+((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits)&& OrderStopLoss()!=NormalizeDouble(OrderOpenPrice()+(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits))
               {
               int MODB = OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits),OrderTakeProfit(),0,clrNONE);
               }
             }
          if (OrderType()==OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             if(Ask<=NormalizeDouble(OrderOpenPrice()-(SECURE_POINT_1*_Point),_Digits)&& OrderStopLoss()!=NormalizeDouble(OrderOpenPrice()-((SECURE_POINT_1-Dis_From_Price)*_Point),_Digits))
               {
               int MODS = OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-((SECURE_POINT_1+Dis_From_Price)*_Point),_Digits),OrderTakeProfit(),0,clrNONE);
               }
             if(Ask<=NormalizeDouble(OrderOpenPrice()-((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits)&& OrderStopLoss()!=NormalizeDouble(OrderOpenPrice()-(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits))
               {
               int MODS = OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-(((SECURE_POINT_1+SECURE_POINT_2)-Dis_From_Price)*_Point),_Digits),OrderTakeProfit(),0,clrNONE);
               }
             }
         }
     }
 
 }
//========================================================================

//========================= Secure Mode P ================================
void SecureP()
 {
   double PRICE = 0 ;
   string T = "";
 for (int i=0;i<OrdersTotal();i++)                                                                                               
   {                                                                                                          
                                                                                                              
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)                                                     
         {                                                                                                    
          if (OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             PRICE = OrderOpenPrice() ;
              T = "BUY";
             }
          if (OrderType()==OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MAGICMA )
             {
             PRICE = OrderOpenPrice() ;
              T = "SELL";
             }
         }
     }
    if (T=="BUY")
       {
       PO1 = NormalizeDouble(PRICE+(SECURE_POINT_1*_Point),_Digits);
       PO2 = NormalizeDouble(PRICE+((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits);
       }
   if (T=="SELL")
       {
       PO1 = NormalizeDouble(PRICE-(SECURE_POINT_1*_Point),_Digits);
       PO2 = NormalizeDouble(PRICE-((SECURE_POINT_1+SECURE_POINT_2)*_Point),_Digits);
       }
   
 }
//========================================================================

void PP ()
 {
 if (IsTesting()==true)
      {
      Print ("Balance : ",BAL," || Win : ",WIN," || Loss : ",LOS," || Tie : ",TIE);
      }
 }

