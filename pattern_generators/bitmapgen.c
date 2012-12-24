#include <stdio.h>
#include "Retrogfx.bitmap"

/*

Converts 80x80px Bitmap into NTSC-Framebuffer

*/

int main(){
int len=sizeof(Retrogfx_bits);
int linesPerPixel=3;
int arrayPointer=0;
unsigned char Retrogfx_bits_NTSCized[len*linesPerPixel];


for(int i=0;i<=len-10;i=i+10){
	for(int r=0;r<linesPerPixel;r++){
		for(int j=0;j<10;j++){
			Retrogfx_bits_NTSCized[arrayPointer]=Retrogfx_bits[i+j];
			arrayPointer++;
		}
	}
}

for(int i=0;i<10;i++){
	printf(".DB 0\n");
}
for(int i=0;i<len*linesPerPixel;i++){
	printf(".DB %d\n",Retrogfx_bits_NTSCized[i]);
}
for(int i=0;i<10;i++){
	printf(".DB 0\n");
}
return 0;
}
