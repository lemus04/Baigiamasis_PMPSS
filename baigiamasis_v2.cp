#line 1 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
#line 26 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
struct daviklis{
unsigned reiksme;
}daviklis;

struct daviklis Temp_1,Temp_2,Temp_3,Temp_4,Dregm_1,Dregm_2;


typedef enum{
NE_inicializuotas , inicializuotas, TX_siuncia, RX_gauna, TX_pasiruoses, RX_pasiruoses, neaiski
} busena;
#line 62 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
void Nuskaityti_davikliu_reiksmes(){
ADC_Init();
Temp_1.reiksme=ADC_read( 0 );
Temp_2.reiksme=ADC_read( 1 );
Temp_3.reiksme=ADC_read( 2 );
Temp_4.reiksme=ADC_read( 3 );
Dregm_1.reiksme=ADC_read( 4 );
Dregm_2.reiksme=ADC_read( 5 );

}
#line 91 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
char UART1_gautas_buferis[ 128 ];

char Simbolis_paskutinis;
char Simbolis_buves;




char * cmd;

char * cmd_1 = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: ";



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



void WiFi_inicializacija(){
delay_ms(50);

UART1_Init( 9600 );
UART2_Init( 9600 );
UART1_Write_Text("ATE0\r\n");
delay_ms(1000);
UART1_Write_Text("AT+CWMODE=3\r\n");
delay_ms(1000);

}

void WiFi_tinklo_skanavimas(){
UART1_Write_Text("AT+CWLAP\r\n");
 while(UART1_Data_Ready() !=1){

 delay_ms(500);
 }

}
void WiFi_tinklas_prisijungti(){
UART1_Write_Text("AT\r\n");
}

void Mikrovaldiklio_Konfiguravimas(){

 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;
 SLRCON = 0;


TRISB=0x00;
}


int cmd_zodzio_ilgis(char *str) {
 unsigned short int c = 1;
 while (str[c]) {
 c ++;
 }
 return c;
}


char *cmd_prideti_teksta(char *pradinis_tekstas, char *pridetas_tekstas) {
 unsigned short int a,b,i;
 a = cmd_zodzio_ilgis(pradinis_tekstas);
 b = cmd_zodzio_ilgis(pridetas_tekstas);


 for(i=0; b != 0; b --,i++) {
 pradinis_tekstas[a + i] = pridetas_tekstas[i];
 }
 pradinis_tekstas[a+i] = 0;

 return pradinis_tekstas;
}


char *cmd_prideti_teksta_derinamas(char *pradinis_tekstas, char *pridetas_tekstas) {
 unsigned short int a,b,i;
 a = cmd_zodzio_ilgis(pradinis_tekstas);
 b = cmd_zodzio_ilgis(pridetas_tekstas);


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




char *cmd_prideti_kintama(char *pradinis_tekstas, int pridetas_kintamas, char rn) {
 unsigned short int visas_ilgis;
 char * kintamasChar;
 char * resultas;
 char * galutinis_rezultatas;
 char txt_tarpinis[7];
 char * pridedamas_rn = "\r\n";

 IntToStr(pridetas_kintamas,txt_tarpinis);
 kintamasChar = LTrim(txt_tarpinis);
 visas_ilgis = cmd_zodzio_ilgis(kintamasChar);
 resultas = strncat(pradinis_tekstas, kintamasChar, visas_ilgis);

 if(rn == 1){
 galutinis_rezultatas = cmd_prideti_teksta(resultas,pridedamas_rn);
 return galutinis_rezultatas;
 }
 return resultas;
}
#line 246 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
char *cmd_3_skaiciuoti_simboliu_skaiciu() {





cmd_3_serial =  1 ;
cmd_3_temp =  4 ;
cmd_3_co =  4 ;
cmd_3_smoke =  4 ;
cmd_3_humidity =  4 ;

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



Mikrovaldiklio_Konfiguravimas();

WiFi_inicializacija();

cmd_2 = cmd_3_skaiciuoti_simboliu_skaiciu();
delay_ms(50);

cmd_3 = cmd_prideti_kintama(cmd_1,cmd_2,0);

delay_ms(50);

UART2_Write_Text(cmd_3);


cmd_3 = cmd_prideti_teksta(cmd_3, cmd_3_duomenys);

return;




while (1) {



 UART1_Write_Text("AT+CIPMUX=1\r\n");
 delay_ms(1000);
 UART1_Write_Text("AT+CIPSTART=0,\"TCP\",\"myhome.esoftas.com\",80\r\n");
 delay_ms(1000);


 cmd = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: 40\r\n\r\nserial=1&temp=1&co=1&smoke=1&humidity=69";
 komandos_ilgis = cmd_zodzio_ilgis(cmd);


 atsakymas = cmd_prideti_kintama("AT+CIPSEND=0,",komandos_ilgis,0);
 atsakymas_2 = cmd_prideti_newline(atsakymas);
 UART1_Write_Text(atsakymas_2);
 delay_ms(1000);


 return;
#line 365 "C:/Users/Jaroslav/Dropbox/BAIGIAMASIS DARBAS/pic 18F46k22 programa/BD Naujausias kodas/baigiamasis_v2.c"
}
}
