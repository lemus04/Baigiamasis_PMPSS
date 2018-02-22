#define UART1_bufferio_dydis 128

#define UART_band_rate 9600
#define isvadas_Daviklis_Temp_1 0
#define isvadas_Daviklis_Temp_2 1
#define isvadas_Daviklis_Temp_3 2
#define isvadas_Daviklis_Temp_4 3
#define isvadas_Daviklis_Dregm_1 4
#define isvadas_Daviklis_Dregm_2 5

#define derinimas_cmd_3_serial 1
#define derinimas_cmd_3_temp 4
#define derinimas_cmd_3_co 4
#define derinimas_cmd_3_smoke 4
#define derinimas_cmd_3_humidity 4


#define LCD_OFF
#define Testavimas_ON
#define Testavimas_duomenu_gavimas_OFF
#define Duomenu_siuntimas_i_svetaine_OFF // veikianti funkcija
#define Duomenu_siuntimas_i_svetaine_bandomas_ON // NEveikianti funkcija



struct daviklis{
unsigned reiksme;
}daviklis;

struct daviklis Temp_1,Temp_2,Temp_3,Temp_4,Dregm_1,Dregm_2;


typedef enum{
NE_inicializuotas , inicializuotas, TX_siuncia, RX_gauna, TX_pasiruoses, RX_pasiruoses, neaiski
} busena;

#ifdef LCD_ON
// START LCD

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char display[20]="";

void Move_Delay() { // Function used for text moving
Delay_ms(500); // You can change the moving speed here
}
// END LCD
#endif

void Nuskaityti_davikliu_reiksmes(){
ADC_Init();
Temp_1.reiksme=ADC_read(isvadas_Daviklis_Temp_1);
Temp_2.reiksme=ADC_read(isvadas_Daviklis_Temp_2);
Temp_3.reiksme=ADC_read(isvadas_Daviklis_Temp_3);
Temp_4.reiksme=ADC_read(isvadas_Daviklis_Temp_4);
Dregm_1.reiksme=ADC_read(isvadas_Daviklis_Dregm_1);
Dregm_2.reiksme=ADC_read(isvadas_Daviklis_Dregm_2);

}

//void pradzia_konfiguravimas(){
// ADCON1 = 0xFF;     //Disable all analog inputs
//
//TRISB=0x00;
//TRISA.F0=0;
//
//
//
//  Lcd_Init();                        // Initialize LCD
//  Lcd_Cmd(_LCD_CLEAR);               // Clear display
//  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
//  Lcd_Out(2,5,"Testas");
//  char kintamas = 0x6801;
//  delay_ms(2500);
//  PORTA.F0=1;
//}

//  ************************************************START KINTAMIEJI************************************************************************************
char UART1_gautas_buferis[UART1_bufferio_dydis];

char Simbolis_paskutinis;
char Simbolis_buves;




char * cmd;
// cmd_1 iki "Count: "
char * cmd_1 = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: ";
// cmd_2 paskaiciuojama isvedamu simboliu sk cmd_3 komandos ((serial=1&temp=1&co=1&smoke=1&humidity=6))

//40\r\n\r\nserial=1&temp=1&co=1&smoke=1&humidity=69
char * cmd_3;
char * cmd_3_duomenys;

char * cmd_2_c;
int cmd_2 = 0;

int cmd_3_serial;
int cmd_3_temp;
int cmd_3_co;
int cmd_3_smoke;
int cmd_3_humidity;

char * atsakymas;
char * atsakymas_2;

int komandos_ilgis;

//  ****************************************************END KINTAMIEJI********************************************************************************

void WiFi_inicializacija(){
delay_ms(500);

UART1_Init(UART_band_rate);
UART2_Init(UART_band_rate);
UART1_Write_Text("ATE0\r\n");
delay_ms(1000);
UART1_Write_Text("AT+CWMODE=3\r\n"); // 3 AP + Station mode- modulio veikimas nustatomas kliento ir hosto rezimu
delay_ms(1000);

}

void WiFi_tinklo_skanavimas(){
UART1_Write_Text("AT+CWLAP\r\n"); // Isvedame pasiekiamu WiFi tasku SSID, MAC adresus bei signalo stipri
  while(UART1_Data_Ready() !=1){
//  receive = UART1_read();
  delay_ms(500);
  }

}
void WiFi_tinklas_prisijungti(){
UART1_Write_Text("AT\r\n");
}

void Mikrovaldiklio_Konfiguravimas(){
// ANSELA = 0;             // Set all ports as digital
  ANSELB = 0;
  ANSELC = 0;
  ANSELD = 0;
  ANSELE = 0;
  SLRCON = 0;

//TRISC.F7=1;
TRISB=0x00;
}

// veikianti
int cmd_zodzio_ilgis(char *str) {
  unsigned short int c = 1;
  while (str[c]) {
    c ++;
  }
  return c;
}

// veikianti
char *cmd_prideti_teksta(char *pradinis_tekstas, char *pridetas_tekstas) {
  unsigned short int a,b,i;
  a = cmd_zodzio_ilgis(pradinis_tekstas);
  b = cmd_zodzio_ilgis(pridetas_tekstas);
  
//  for(i=0; pridetas_tekstas[i] != 0; i ++) {
    for(i=0; b != 0; b --,i++) {
    pradinis_tekstas[a + i] = pridetas_tekstas[i];
  }
  pradinis_tekstas[a+i] = 0;

  return pradinis_tekstas;
}
// modifikuota

char *cmd_prideti_teksta_derinamas(char *pradinis_tekstas, char *pridetas_tekstas) {
  unsigned short int a,b,i;
  a = cmd_zodzio_ilgis(pradinis_tekstas);
  b = cmd_zodzio_ilgis(pridetas_tekstas);

//  for(i=0; pridetas_tekstas[i] != 0; i ++) {
    for(i=0; b != 0; b --,i++) {
    pradinis_tekstas[a + i] = pridetas_tekstas[i];
  }
  pradinis_tekstas[a+i] = 0;
  return pradinis_tekstas;
}


char *cmd_prideti_newline(char *input) {
char * pridedamas_rn = "\r\n";
char * output;
UART2_Write_Text(pridedamas_rn);

output = cmd_prideti_teksta_derinamas(input,pridedamas_rn);
return output;
}


   // nauja, veikianti :)
   // cmd_prideti_kintama(pradinis_tekstas,teksta kuri norima prideti, 1- nauja eilute);
char *cmd_prideti_kintama(char *pradinis_tekstas, int pridetas_kintamas, char rn) {
  unsigned short int visas_ilgis;
  char * kintamasChar;
  char * resultas;
  char * galutinis_rezultatas;
  char txt_tarpinis[7];
  char * pridedamas_rn = "\r\n";

  IntToStr(pridetas_kintamas,txt_tarpinis); // stringo pavidalu i txt_tarpinis irasomas integer kintamasis
  kintamasChar = LTrim(txt_tarpinis); // panaikinami tarpai(space) is kaires puses
  visas_ilgis = cmd_zodzio_ilgis(kintamasChar); // Apskaiciuojamas ilgis pradinio kintamo
  resultas = strncat(pradinis_tekstas, kintamasChar, visas_ilgis); // i pradini teksta irasomas kintamas CHAR pavidalu
  
    if(rn == 1){
    galutinis_rezultatas = cmd_prideti_teksta(resultas,pridedamas_rn);
    return galutinis_rezultatas;
    }
  return resultas;
}

/*
//VEIKIANTI
char *cmd_prideti_kintama(char *pradinis_tekstas, int pridetas_kintamas) {
  unsigned short int visas_ilgis;
  char * kintamasChar;
  char * resultas;
  char txt_tarpinis[7];

  IntToStr(pridetas_kintamas,txt_tarpinis); // stringo pavidalu i txt_tarpinis irasomas integer kintamasis
  kintamasChar = LTrim(txt_tarpinis); // panaikinami tarpai(space) is kaires puses
  visas_ilgis = cmd_zodzio_ilgis(kintamasChar); // Apskaiciuojamas ilgis pradinio kintamo
  resultas = strncat(pradinis_tekstas, kintamasChar, visas_ilgis); // i pradini teksta irasomas kintamas CHAR pavidalu
  return resultas;
}    */

char *cmd_3_skaiciuoti_simboliu_skaiciu() {

//cmd_zodzio_ilgis(char *str)

//40serial=1&temp=1&co=1&smoke=1&humidity=64

cmd_3_serial = derinimas_cmd_3_serial;
cmd_3_temp = derinimas_cmd_3_temp;
cmd_3_co = derinimas_cmd_3_co;
cmd_3_smoke = derinimas_cmd_3_smoke;
cmd_3_humidity = derinimas_cmd_3_humidity;

cmd_3_duomenys = "\r\n\r\n";
cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"serial=");
delay_ms(50);
cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_serial,0);
delay_ms(50);
cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&temp=");
delay_ms(50);
cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_temp,0);
delay_ms(50);
cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&co=");
delay_ms(50);
cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_co,0);
delay_ms(50);
cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&smoke=");
delay_ms(50);
cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_smoke,0);
delay_ms(50);
cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&humidity=");
delay_ms(50);
cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_humidity,0);
delay_ms(50);

cmd_2 = cmd_zodzio_ilgis(cmd_3_duomenys) - 4;
return cmd_2;
}



void main() {

//busena Mikrovaldiklis = NE_inicializuotas;
//busena WiFi_modulis = NE_inicializuotas;
Mikrovaldiklio_Konfiguravimas();
//Mikrovaldiklis = inicializuotas;
WiFi_inicializacija();

cmd_2 = cmd_3_skaiciuoti_simboliu_skaiciu(); // skaiciuoja teisingai, grazina 39 reiksme
delay_ms(50);

cmd_3 = cmd_prideti_kintama(cmd_1,cmd_2,0);

delay_ms(50);

UART2_Write_Text(cmd_3);


cmd_3 = cmd_prideti_teksta(cmd_3, cmd_3_duomenys);

return;

//WiFi_modulis = inicializuotas;
// WiFi_tinklo_skanavimas();
//pradzia_konfiguravimas();
while (1) {

#ifdef Duomenu_siuntimas_i_svetaine_bandomas_ON   // VEIKIANTIIIIIIIIIII
       // *******************************************************************************************************************************************************************************
      UART1_Write_Text("AT+CIPMUX=1\r\n");
      delay_ms(1000);
      UART1_Write_Text("AT+CIPSTART=0,\"TCP\",\"myhome.esoftas.com\",80\r\n");
      delay_ms(1000);

//      cmd = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: 39\r\n\r\nserial=1&temp=1&co=1&smoke=1&humidity=7";
        cmd = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: 40\r\n\r\nserial=1&temp=1&co=1&smoke=1&humidity=69";
      komandos_ilgis = cmd_zodzio_ilgis(cmd); // 208
      //komandos_ilgis = strlen(cmd); // 208

      atsakymas = cmd_prideti_kintama("AT+CIPSEND=0,",komandos_ilgis,0);
      atsakymas_2 = cmd_prideti_newline(atsakymas);
      UART1_Write_Text(atsakymas_2);
      delay_ms(1000);
      //UART1_Write_Text(cmd);

      return;
       #endif

       #ifdef Duomenu_siuntimas_i_svetaine_ON

      // veikia
      UART1_Write_Text("AT+CIPMUX=1\r\n"); // gera komanda
      delay_ms(1000);
      UART1_Write_Text("AT+CIPSTART=0,\"TCP\",\"myhome.esoftas.com\",80\r\n"); // gera komanda
      delay_ms(1000);
      UART1_Write_Text("AT+CIPSEND=0,208\r\n"); // gera komanda
      delay_ms(1000);
      UART1_Write_Text("POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: 39\r\n\r\nserial=1&temp=9&co=9&smoke=9&humidity=9"); // gera komanda
      delay_ms(10000);
      return;
      #endif
      //delay_ms(1000);
      //UART1_Write_Text("AT+CIPCLOSE=4\r\n"); // gera komanda
        #ifdef Testavimas_duomenu_gavimas_ON
              UART1_Write_Text("AT+CIPSTAMAC?\r\n"); // gera komanda
              for(i=0; i<UART1_bufferio_dydis; i++){
              Simbolis_paskutinis = UART1_Read();
              if (Simbolis_buves != Simbolis_paskutinis){
                UART1_gautas_buferis[i] = Simbolis_paskutinis;
              }
              Simbolis_paskutinis = Simbolis_buves;
              delay_ms(1);
              }
              for(i=0; i<UART1_bufferio_dydis; i++){
              UART2_Write(UART1_gautas_buferis[i]);
              UART1_gautas_buferis[i]=0;
              }
        #endif
//delay_ms(2000);
}
}