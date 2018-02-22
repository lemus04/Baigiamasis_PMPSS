
_Nuskaityti_davikliu_reiksmes:

;baigiamasis_v2.c,62 :: 		void Nuskaityti_davikliu_reiksmes(){
;baigiamasis_v2.c,63 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;baigiamasis_v2.c,64 :: 		Temp_1.reiksme=ADC_read(isvadas_Daviklis_Temp_1);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_1+0 
	MOVF        R1, 0 
	MOVWF       _Temp_1+1 
;baigiamasis_v2.c,65 :: 		Temp_2.reiksme=ADC_read(isvadas_Daviklis_Temp_2);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_2+0 
	MOVF        R1, 0 
	MOVWF       _Temp_2+1 
;baigiamasis_v2.c,66 :: 		Temp_3.reiksme=ADC_read(isvadas_Daviklis_Temp_3);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_3+0 
	MOVF        R1, 0 
	MOVWF       _Temp_3+1 
;baigiamasis_v2.c,67 :: 		Temp_4.reiksme=ADC_read(isvadas_Daviklis_Temp_4);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_4+0 
	MOVF        R1, 0 
	MOVWF       _Temp_4+1 
;baigiamasis_v2.c,68 :: 		Dregm_1.reiksme=ADC_read(isvadas_Daviklis_Dregm_1);
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Dregm_1+0 
	MOVF        R1, 0 
	MOVWF       _Dregm_1+1 
;baigiamasis_v2.c,69 :: 		Dregm_2.reiksme=ADC_read(isvadas_Daviklis_Dregm_2);
	MOVLW       5
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Dregm_2+0 
	MOVF        R1, 0 
	MOVWF       _Dregm_2+1 
;baigiamasis_v2.c,71 :: 		}
L_end_Nuskaityti_davikliu_reiksmes:
	RETURN      0
; end of _Nuskaityti_davikliu_reiksmes

_WiFi_inicializacija:

;baigiamasis_v2.c,124 :: 		void WiFi_inicializacija(){
;baigiamasis_v2.c,125 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_WiFi_inicializacija0:
	DECFSZ      R13, 1, 1
	BRA         L_WiFi_inicializacija0
	DECFSZ      R12, 1, 1
	BRA         L_WiFi_inicializacija0
	DECFSZ      R11, 1, 1
	BRA         L_WiFi_inicializacija0
	NOP
;baigiamasis_v2.c,127 :: 		UART1_Init(UART_band_rate);
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       160
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;baigiamasis_v2.c,128 :: 		UART2_Init(UART_band_rate);
	BSF         BAUDCON2+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH2+0 
	MOVLW       160
	MOVWF       SPBRG2+0 
	BSF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;baigiamasis_v2.c,129 :: 		UART1_Write_Text("ATE0\r\n");
	MOVLW       ?lstr2_baigiamasis_v2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_baigiamasis_v2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,130 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_WiFi_inicializacija1:
	DECFSZ      R13, 1, 1
	BRA         L_WiFi_inicializacija1
	DECFSZ      R12, 1, 1
	BRA         L_WiFi_inicializacija1
	DECFSZ      R11, 1, 1
	BRA         L_WiFi_inicializacija1
	NOP
;baigiamasis_v2.c,131 :: 		UART1_Write_Text("AT+CWMODE=3\r\n"); // 3 AP + Station mode- modulio veikimas nustatomas kliento ir hosto rezimu
	MOVLW       ?lstr3_baigiamasis_v2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_baigiamasis_v2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,132 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_WiFi_inicializacija2:
	DECFSZ      R13, 1, 1
	BRA         L_WiFi_inicializacija2
	DECFSZ      R12, 1, 1
	BRA         L_WiFi_inicializacija2
	DECFSZ      R11, 1, 1
	BRA         L_WiFi_inicializacija2
	NOP
;baigiamasis_v2.c,134 :: 		}
L_end_WiFi_inicializacija:
	RETURN      0
; end of _WiFi_inicializacija

_WiFi_tinklo_skanavimas:

;baigiamasis_v2.c,136 :: 		void WiFi_tinklo_skanavimas(){
;baigiamasis_v2.c,137 :: 		UART1_Write_Text("AT+CWLAP\r\n"); // Isvedame pasiekiamu WiFi tasku SSID, MAC adresus bei signalo stipri
	MOVLW       ?lstr4_baigiamasis_v2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_baigiamasis_v2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,138 :: 		while(UART1_Data_Ready() !=1){
L_WiFi_tinklo_skanavimas3:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_WiFi_tinklo_skanavimas4
;baigiamasis_v2.c,140 :: 		delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_WiFi_tinklo_skanavimas5:
	DECFSZ      R13, 1, 1
	BRA         L_WiFi_tinklo_skanavimas5
	DECFSZ      R12, 1, 1
	BRA         L_WiFi_tinklo_skanavimas5
	DECFSZ      R11, 1, 1
	BRA         L_WiFi_tinklo_skanavimas5
	NOP
	NOP
;baigiamasis_v2.c,141 :: 		}
	GOTO        L_WiFi_tinklo_skanavimas3
L_WiFi_tinklo_skanavimas4:
;baigiamasis_v2.c,143 :: 		}
L_end_WiFi_tinklo_skanavimas:
	RETURN      0
; end of _WiFi_tinklo_skanavimas

_WiFi_tinklas_prisijungti:

;baigiamasis_v2.c,144 :: 		void WiFi_tinklas_prisijungti(){
;baigiamasis_v2.c,145 :: 		UART1_Write_Text("AT\r\n");
	MOVLW       ?lstr5_baigiamasis_v2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_baigiamasis_v2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,146 :: 		}
L_end_WiFi_tinklas_prisijungti:
	RETURN      0
; end of _WiFi_tinklas_prisijungti

_Mikrovaldiklio_Konfiguravimas:

;baigiamasis_v2.c,148 :: 		void Mikrovaldiklio_Konfiguravimas(){
;baigiamasis_v2.c,150 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;baigiamasis_v2.c,151 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;baigiamasis_v2.c,152 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;baigiamasis_v2.c,153 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;baigiamasis_v2.c,154 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;baigiamasis_v2.c,157 :: 		TRISB=0x00;
	CLRF        TRISB+0 
;baigiamasis_v2.c,158 :: 		}
L_end_Mikrovaldiklio_Konfiguravimas:
	RETURN      0
; end of _Mikrovaldiklio_Konfiguravimas

_cmd_zodzio_ilgis:

;baigiamasis_v2.c,161 :: 		int cmd_zodzio_ilgis(char *str) {
;baigiamasis_v2.c,162 :: 		unsigned short int c = 1;
	MOVLW       1
	MOVWF       cmd_zodzio_ilgis_c_L0+0 
;baigiamasis_v2.c,163 :: 		while (str[c]) {
L_cmd_zodzio_ilgis6:
	MOVF        cmd_zodzio_ilgis_c_L0+0, 0 
	ADDWF       FARG_cmd_zodzio_ilgis_str+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_cmd_zodzio_ilgis_str+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_cmd_zodzio_ilgis7
;baigiamasis_v2.c,164 :: 		c ++;
	INCF        cmd_zodzio_ilgis_c_L0+0, 1 
;baigiamasis_v2.c,165 :: 		}
	GOTO        L_cmd_zodzio_ilgis6
L_cmd_zodzio_ilgis7:
;baigiamasis_v2.c,166 :: 		return c;
	MOVF        cmd_zodzio_ilgis_c_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;baigiamasis_v2.c,167 :: 		}
L_end_cmd_zodzio_ilgis:
	RETURN      0
; end of _cmd_zodzio_ilgis

_cmd_prideti_teksta:

;baigiamasis_v2.c,170 :: 		char *cmd_prideti_teksta(char *pradinis_tekstas, char *pridetas_tekstas) {
;baigiamasis_v2.c,172 :: 		a = cmd_zodzio_ilgis(pradinis_tekstas);
	MOVF        FARG_cmd_prideti_teksta_pradinis_tekstas+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        FARG_cmd_prideti_teksta_pradinis_tekstas+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_teksta_a_L0+0 
;baigiamasis_v2.c,173 :: 		b = cmd_zodzio_ilgis(pridetas_tekstas);
	MOVF        FARG_cmd_prideti_teksta_pridetas_tekstas+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        FARG_cmd_prideti_teksta_pridetas_tekstas+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_teksta_b_L0+0 
;baigiamasis_v2.c,176 :: 		for(i=0; b != 0; b --,i++) {
	CLRF        cmd_prideti_teksta_i_L0+0 
L_cmd_prideti_teksta8:
	MOVF        cmd_prideti_teksta_b_L0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_cmd_prideti_teksta9
;baigiamasis_v2.c,177 :: 		pradinis_tekstas[a + i] = pridetas_tekstas[i];
	MOVF        cmd_prideti_teksta_i_L0+0, 0 
	ADDWF       cmd_prideti_teksta_a_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0, 0 
	MOVWF       FSR1 
	MOVF        R1, 0 
	ADDWFC      FARG_cmd_prideti_teksta_pradinis_tekstas+1, 0 
	MOVWF       FSR1H 
	MOVF        cmd_prideti_teksta_i_L0+0, 0 
	ADDWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_cmd_prideti_teksta_pridetas_tekstas+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;baigiamasis_v2.c,176 :: 		for(i=0; b != 0; b --,i++) {
	DECF        cmd_prideti_teksta_b_L0+0, 1 
	INCF        cmd_prideti_teksta_i_L0+0, 1 
;baigiamasis_v2.c,178 :: 		}
	GOTO        L_cmd_prideti_teksta8
L_cmd_prideti_teksta9:
;baigiamasis_v2.c,179 :: 		pradinis_tekstas[a+i] = 0;
	MOVF        cmd_prideti_teksta_i_L0+0, 0 
	ADDWF       cmd_prideti_teksta_a_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0, 0 
	MOVWF       FSR1 
	MOVF        R1, 0 
	ADDWFC      FARG_cmd_prideti_teksta_pradinis_tekstas+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;baigiamasis_v2.c,181 :: 		return pradinis_tekstas;
	MOVF        FARG_cmd_prideti_teksta_pradinis_tekstas+0, 0 
	MOVWF       R0 
	MOVF        FARG_cmd_prideti_teksta_pradinis_tekstas+1, 0 
	MOVWF       R1 
;baigiamasis_v2.c,182 :: 		}
L_end_cmd_prideti_teksta:
	RETURN      0
; end of _cmd_prideti_teksta

_cmd_prideti_teksta_derinamas:

;baigiamasis_v2.c,185 :: 		char *cmd_prideti_teksta_derinamas(char *pradinis_tekstas, char *pridetas_tekstas) {
;baigiamasis_v2.c,187 :: 		a = cmd_zodzio_ilgis(pradinis_tekstas);
	MOVF        FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_teksta_derinamas_a_L0+0 
;baigiamasis_v2.c,188 :: 		b = cmd_zodzio_ilgis(pridetas_tekstas);
	MOVF        FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_teksta_derinamas_b_L0+0 
;baigiamasis_v2.c,191 :: 		for(i=0; b != 0; b --,i++) {
	CLRF        cmd_prideti_teksta_derinamas_i_L0+0 
L_cmd_prideti_teksta_derinamas11:
	MOVF        cmd_prideti_teksta_derinamas_b_L0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_cmd_prideti_teksta_derinamas12
;baigiamasis_v2.c,192 :: 		pradinis_tekstas[a + i] = pridetas_tekstas[i];
	MOVF        cmd_prideti_teksta_derinamas_i_L0+0, 0 
	ADDWF       cmd_prideti_teksta_derinamas_a_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+0, 0 
	MOVWF       FSR1 
	MOVF        R1, 0 
	ADDWFC      FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+1, 0 
	MOVWF       FSR1H 
	MOVF        cmd_prideti_teksta_derinamas_i_L0+0, 0 
	ADDWF       FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;baigiamasis_v2.c,191 :: 		for(i=0; b != 0; b --,i++) {
	DECF        cmd_prideti_teksta_derinamas_b_L0+0, 1 
	INCF        cmd_prideti_teksta_derinamas_i_L0+0, 1 
;baigiamasis_v2.c,193 :: 		}
	GOTO        L_cmd_prideti_teksta_derinamas11
L_cmd_prideti_teksta_derinamas12:
;baigiamasis_v2.c,194 :: 		pradinis_tekstas[a+i] = 0;
	MOVF        cmd_prideti_teksta_derinamas_i_L0+0, 0 
	ADDWF       cmd_prideti_teksta_derinamas_a_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+0, 0 
	MOVWF       FSR1 
	MOVF        R1, 0 
	ADDWFC      FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;baigiamasis_v2.c,195 :: 		return pradinis_tekstas;
	MOVF        FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+0, 0 
	MOVWF       R0 
	MOVF        FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+1, 0 
	MOVWF       R1 
;baigiamasis_v2.c,196 :: 		}
L_end_cmd_prideti_teksta_derinamas:
	RETURN      0
; end of _cmd_prideti_teksta_derinamas

_cmd_prideti_newline:

;baigiamasis_v2.c,199 :: 		char *cmd_prideti_newline(char *input) {
;baigiamasis_v2.c,200 :: 		char * pridedamas_rn = "\r\n";
	MOVLW       ?lstr6_baigiamasis_v2+0
	MOVWF       cmd_prideti_newline_pridedamas_rn_L0+0 
	MOVLW       hi_addr(?lstr6_baigiamasis_v2+0)
	MOVWF       cmd_prideti_newline_pridedamas_rn_L0+1 
;baigiamasis_v2.c,202 :: 		UART2_Write_Text(pridedamas_rn);
	MOVF        cmd_prideti_newline_pridedamas_rn_L0+0, 0 
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVF        cmd_prideti_newline_pridedamas_rn_L0+1, 0 
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;baigiamasis_v2.c,204 :: 		output = cmd_prideti_teksta_derinamas(input,pridedamas_rn);
	MOVF        FARG_cmd_prideti_newline_input+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+0 
	MOVF        FARG_cmd_prideti_newline_input+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_derinamas_pradinis_tekstas+1 
	MOVF        cmd_prideti_newline_pridedamas_rn_L0+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+0 
	MOVF        cmd_prideti_newline_pridedamas_rn_L0+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_derinamas_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta_derinamas+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_newline_output_L0+0 
	MOVF        R1, 0 
	MOVWF       cmd_prideti_newline_output_L0+1 
;baigiamasis_v2.c,205 :: 		return output;
	MOVF        cmd_prideti_newline_output_L0+0, 0 
	MOVWF       R0 
	MOVF        cmd_prideti_newline_output_L0+1, 0 
	MOVWF       R1 
;baigiamasis_v2.c,206 :: 		}
L_end_cmd_prideti_newline:
	RETURN      0
; end of _cmd_prideti_newline

_cmd_prideti_kintama:

;baigiamasis_v2.c,211 :: 		char *cmd_prideti_kintama(char *pradinis_tekstas, int pridetas_kintamas, char rn) {
;baigiamasis_v2.c,217 :: 		char * pridedamas_rn = "\r\n";
	MOVLW       ?lstr7_baigiamasis_v2+0
	MOVWF       cmd_prideti_kintama_pridedamas_rn_L0+0 
	MOVLW       hi_addr(?lstr7_baigiamasis_v2+0)
	MOVWF       cmd_prideti_kintama_pridedamas_rn_L0+1 
;baigiamasis_v2.c,219 :: 		IntToStr(pridetas_kintamas,txt_tarpinis); // stringo pavidalu i txt_tarpinis irasomas integer kintamasis
	MOVF        FARG_cmd_prideti_kintama_pridetas_kintamas+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_cmd_prideti_kintama_pridetas_kintamas+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       cmd_prideti_kintama_txt_tarpinis_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(cmd_prideti_kintama_txt_tarpinis_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;baigiamasis_v2.c,220 :: 		kintamasChar = LTrim(txt_tarpinis); // panaikinami tarpai(space) is kaires puses
	MOVLW       cmd_prideti_kintama_txt_tarpinis_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(cmd_prideti_kintama_txt_tarpinis_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_kintama_kintamasChar_L0+0 
	MOVF        R1, 0 
	MOVWF       cmd_prideti_kintama_kintamasChar_L0+1 
;baigiamasis_v2.c,221 :: 		visas_ilgis = cmd_zodzio_ilgis(kintamasChar); // Apskaiciuojamas ilgis pradinio kintamo
	MOVF        cmd_prideti_kintama_kintamasChar_L0+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        cmd_prideti_kintama_kintamasChar_L0+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_kintama_visas_ilgis_L0+0 
;baigiamasis_v2.c,222 :: 		resultas = strncat(pradinis_tekstas, kintamasChar, visas_ilgis); // i pradini teksta irasomas kintamas CHAR pavidalu
	MOVF        FARG_cmd_prideti_kintama_pradinis_tekstas+0, 0 
	MOVWF       FARG_strncat_to+0 
	MOVF        FARG_cmd_prideti_kintama_pradinis_tekstas+1, 0 
	MOVWF       FARG_strncat_to+1 
	MOVF        cmd_prideti_kintama_kintamasChar_L0+0, 0 
	MOVWF       FARG_strncat_from+0 
	MOVF        cmd_prideti_kintama_kintamasChar_L0+1, 0 
	MOVWF       FARG_strncat_from+1 
	MOVF        cmd_prideti_kintama_visas_ilgis_L0+0, 0 
	MOVWF       FARG_strncat_size+0 
	MOVLW       0
	MOVWF       FARG_strncat_size+1 
	CALL        _strncat+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_kintama_resultas_L0+0 
	MOVF        R1, 0 
	MOVWF       cmd_prideti_kintama_resultas_L0+1 
;baigiamasis_v2.c,224 :: 		if(rn == 1){
	MOVF        FARG_cmd_prideti_kintama_rn+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_cmd_prideti_kintama14
;baigiamasis_v2.c,225 :: 		galutinis_rezultatas = cmd_prideti_teksta(resultas,pridedamas_rn);
	MOVF        cmd_prideti_kintama_resultas_L0+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        cmd_prideti_kintama_resultas_L0+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVF        cmd_prideti_kintama_pridedamas_rn_L0+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVF        cmd_prideti_kintama_pridedamas_rn_L0+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       cmd_prideti_kintama_galutinis_rezultatas_L0+0 
	MOVF        R1, 0 
	MOVWF       cmd_prideti_kintama_galutinis_rezultatas_L0+1 
;baigiamasis_v2.c,226 :: 		return galutinis_rezultatas;
	MOVF        cmd_prideti_kintama_galutinis_rezultatas_L0+0, 0 
	MOVWF       R0 
	MOVF        cmd_prideti_kintama_galutinis_rezultatas_L0+1, 0 
	MOVWF       R1 
	GOTO        L_end_cmd_prideti_kintama
;baigiamasis_v2.c,227 :: 		}
L_cmd_prideti_kintama14:
;baigiamasis_v2.c,228 :: 		return resultas;
	MOVF        cmd_prideti_kintama_resultas_L0+0, 0 
	MOVWF       R0 
	MOVF        cmd_prideti_kintama_resultas_L0+1, 0 
	MOVWF       R1 
;baigiamasis_v2.c,229 :: 		}
L_end_cmd_prideti_kintama:
	RETURN      0
; end of _cmd_prideti_kintama

_cmd_3_skaiciuoti_simboliu_skaiciu:

;baigiamasis_v2.c,246 :: 		char *cmd_3_skaiciuoti_simboliu_skaiciu() {
;baigiamasis_v2.c,252 :: 		cmd_3_serial = derinimas_cmd_3_serial;
	MOVLW       1
	MOVWF       _cmd_3_serial+0 
	MOVLW       0
	MOVWF       _cmd_3_serial+1 
;baigiamasis_v2.c,253 :: 		cmd_3_temp = derinimas_cmd_3_temp;
	MOVLW       4
	MOVWF       _cmd_3_temp+0 
	MOVLW       0
	MOVWF       _cmd_3_temp+1 
;baigiamasis_v2.c,254 :: 		cmd_3_co = derinimas_cmd_3_co;
	MOVLW       4
	MOVWF       _cmd_3_co+0 
	MOVLW       0
	MOVWF       _cmd_3_co+1 
;baigiamasis_v2.c,255 :: 		cmd_3_smoke = derinimas_cmd_3_smoke;
	MOVLW       4
	MOVWF       _cmd_3_smoke+0 
	MOVLW       0
	MOVWF       _cmd_3_smoke+1 
;baigiamasis_v2.c,256 :: 		cmd_3_humidity = derinimas_cmd_3_humidity;
	MOVLW       4
	MOVWF       _cmd_3_humidity+0 
	MOVLW       0
	MOVWF       _cmd_3_humidity+1 
;baigiamasis_v2.c,258 :: 		cmd_3_duomenys = "\r\n\r\n";
	MOVLW       ?lstr8_baigiamasis_v2+0
	MOVWF       _cmd_3_duomenys+0 
	MOVLW       hi_addr(?lstr8_baigiamasis_v2+0)
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,259 :: 		cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"serial=");
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVLW       ?lstr9_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVLW       hi_addr(?lstr9_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,260 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu15:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu15
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu15
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu15
	NOP
;baigiamasis_v2.c,261 :: 		cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_serial,0);
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_3_serial+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_3_serial+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,262 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu16:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu16
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu16
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu16
	NOP
;baigiamasis_v2.c,263 :: 		cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&temp=");
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVLW       ?lstr10_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVLW       hi_addr(?lstr10_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,264 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu17:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu17
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu17
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu17
	NOP
;baigiamasis_v2.c,265 :: 		cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_temp,0);
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_3_temp+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_3_temp+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,266 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu18:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu18
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu18
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu18
	NOP
;baigiamasis_v2.c,267 :: 		cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&co=");
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVLW       ?lstr11_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVLW       hi_addr(?lstr11_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,268 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu19:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu19
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu19
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu19
	NOP
;baigiamasis_v2.c,269 :: 		cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_co,0);
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_3_co+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_3_co+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,270 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu20:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu20
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu20
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu20
	NOP
;baigiamasis_v2.c,271 :: 		cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&smoke=");
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVLW       ?lstr12_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVLW       hi_addr(?lstr12_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,272 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu21:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu21
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu21
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu21
	NOP
;baigiamasis_v2.c,273 :: 		cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_smoke,0);
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_3_smoke+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_3_smoke+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,274 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu22:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu22
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu22
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu22
	NOP
;baigiamasis_v2.c,275 :: 		cmd_3_duomenys = cmd_prideti_teksta(cmd_3_duomenys,"&humidity=");
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVLW       ?lstr13_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVLW       hi_addr(?lstr13_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,276 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu23:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu23
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu23
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu23
	NOP
;baigiamasis_v2.c,277 :: 		cmd_3_duomenys = cmd_prideti_kintama(cmd_3_duomenys,cmd_3_humidity,0);
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_3_humidity+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_3_humidity+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3_duomenys+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3_duomenys+1 
;baigiamasis_v2.c,278 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_cmd_3_skaiciuoti_simboliu_skaiciu24:
	DECFSZ      R13, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu24
	DECFSZ      R12, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu24
	DECFSZ      R11, 1, 1
	BRA         L_cmd_3_skaiciuoti_simboliu_skaiciu24
	NOP
;baigiamasis_v2.c,280 :: 		cmd_2 = cmd_zodzio_ilgis(cmd_3_duomenys) - 4;
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVLW       4
	SUBWF       R0, 0 
	MOVWF       _cmd_2+0 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       _cmd_2+1 
;baigiamasis_v2.c,281 :: 		return cmd_2;
	MOVF        _cmd_2+0, 0 
	MOVWF       R0 
	MOVF        _cmd_2+1, 0 
	MOVWF       R1 
;baigiamasis_v2.c,282 :: 		}
L_end_cmd_3_skaiciuoti_simboliu_skaiciu:
	RETURN      0
; end of _cmd_3_skaiciuoti_simboliu_skaiciu

_main:

;baigiamasis_v2.c,286 :: 		void main() {
;baigiamasis_v2.c,290 :: 		Mikrovaldiklio_Konfiguravimas();
	CALL        _Mikrovaldiklio_Konfiguravimas+0, 0
;baigiamasis_v2.c,292 :: 		WiFi_inicializacija();
	CALL        _WiFi_inicializacija+0, 0
;baigiamasis_v2.c,294 :: 		cmd_2 = cmd_3_skaiciuoti_simboliu_skaiciu(); // skaiciuoja teisingai, grazina 39 reiksme
	CALL        _cmd_3_skaiciuoti_simboliu_skaiciu+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_2+0 
	MOVF        R1, 0 
	MOVWF       _cmd_2+1 
;baigiamasis_v2.c,295 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
;baigiamasis_v2.c,297 :: 		cmd_3 = cmd_prideti_kintama(cmd_1,cmd_2,0);
	MOVF        _cmd_1+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVF        _cmd_1+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _cmd_2+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _cmd_2+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3+1 
;baigiamasis_v2.c,299 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
;baigiamasis_v2.c,301 :: 		UART2_Write_Text(cmd_3);
	MOVF        _cmd_3+0, 0 
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVF        _cmd_3+1, 0 
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;baigiamasis_v2.c,304 :: 		cmd_3 = cmd_prideti_teksta(cmd_3, cmd_3_duomenys);
	MOVF        _cmd_3+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+0 
	MOVF        _cmd_3+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pradinis_tekstas+1 
	MOVF        _cmd_3_duomenys+0, 0 
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+0 
	MOVF        _cmd_3_duomenys+1, 0 
	MOVWF       FARG_cmd_prideti_teksta_pridetas_tekstas+1 
	CALL        _cmd_prideti_teksta+0, 0
	MOVF        R0, 0 
	MOVWF       _cmd_3+0 
	MOVF        R1, 0 
	MOVWF       _cmd_3+1 
;baigiamasis_v2.c,306 :: 		return;
	GOTO        L_end_main
;baigiamasis_v2.c,316 :: 		delay_ms(1000);
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
;baigiamasis_v2.c,317 :: 		UART1_Write_Text("AT+CIPSTART=0,\"TCP\",\"myhome.esoftas.com\",80\r\n");
	MOVLW       ?lstr15_baigiamasis_v2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_baigiamasis_v2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,318 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
;baigiamasis_v2.c,321 :: 		cmd = "POST /api/sensor/data/add HTTP/1.1\r\nContent-Type: application/x-www-form-urlencoded\r\nHost: myhome.esoftas.com\r\nUser-Agent:test\r\nAccept: text/html\r\nContent-Length: 40\r\n\r\nserial=1&temp=1&co=1&smoke=1&humidity=69";
	MOVLW       ?lstr16_baigiamasis_v2+0
	MOVWF       _cmd+0 
	MOVLW       hi_addr(?lstr16_baigiamasis_v2+0)
	MOVWF       _cmd+1 
;baigiamasis_v2.c,322 :: 		komandos_ilgis = cmd_zodzio_ilgis(cmd); // 208
	MOVF        _cmd+0, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+0 
	MOVF        _cmd+1, 0 
	MOVWF       FARG_cmd_zodzio_ilgis_str+1 
	CALL        _cmd_zodzio_ilgis+0, 0
	MOVF        R0, 0 
	MOVWF       _komandos_ilgis+0 
	MOVF        R1, 0 
	MOVWF       _komandos_ilgis+1 
;baigiamasis_v2.c,325 :: 		atsakymas = cmd_prideti_kintama("AT+CIPSEND=0,",komandos_ilgis,0);
	MOVLW       ?lstr17_baigiamasis_v2+0
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+0 
	MOVLW       hi_addr(?lstr17_baigiamasis_v2+0)
	MOVWF       FARG_cmd_prideti_kintama_pradinis_tekstas+1 
	MOVF        _komandos_ilgis+0, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+0 
	MOVF        _komandos_ilgis+1, 0 
	MOVWF       FARG_cmd_prideti_kintama_pridetas_kintamas+1 
	CLRF        FARG_cmd_prideti_kintama_rn+0 
	CALL        _cmd_prideti_kintama+0, 0
	MOVF        R0, 0 
	MOVWF       _atsakymas+0 
	MOVF        R1, 0 
	MOVWF       _atsakymas+1 
;baigiamasis_v2.c,326 :: 		atsakymas_2 = cmd_prideti_newline(atsakymas);
	MOVF        _atsakymas+0, 0 
	MOVWF       FARG_cmd_prideti_newline_input+0 
	MOVF        _atsakymas+1, 0 
	MOVWF       FARG_cmd_prideti_newline_input+1 
	CALL        _cmd_prideti_newline+0, 0
	MOVF        R0, 0 
	MOVWF       _atsakymas_2+0 
	MOVF        R1, 0 
	MOVWF       _atsakymas_2+1 
;baigiamasis_v2.c,327 :: 		UART1_Write_Text(atsakymas_2);
	MOVF        _atsakymas_2+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _atsakymas_2+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;baigiamasis_v2.c,328 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
;baigiamasis_v2.c,331 :: 		return;
;baigiamasis_v2.c,366 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
