#line 1 "C:/Users/mohamed/Desktop/new/MyProject.c"
#line 8 "C:/Users/mohamed/Desktop/new/MyProject.c"
void pause(unsigned short i){
 unsigned short j;
 for (j = 0; j < i; j++){
 Delay_ms(10);
 }
}
#line 18 "C:/Users/mohamed/Desktop/new/MyProject.c"
unsigned int notes[] = {262, 262, 294, 262, 349, 330, 262, 262, 294, 262, 392,
#line 22 "C:/Users/mohamed/Desktop/new/MyProject.c"
 349, 262, 262, 523, 440, 349, 330, 294, 466, 466, 440,
#line 26 "C:/Users/mohamed/Desktop/new/MyProject.c"
 349, 392, 349
 };

unsigned short interval[] = {4, 4, 8, 8, 8, 10, 4, 4, 8, 8, 8, 10, 4, 4, 8, 8, 8,
 8, 8, 4, 4, 8, 8, 8, 12};



unsigned short k;
void main() {
 TRISB = 0b00001000;
 Sound_Init(&PORTB,0);


do {
 for(k = 0; k<25; k++){
 Sound_Play(notes[k], 100*interval[k]);
 pause(6);
 }
 pause(100);
 }while(1);
}
