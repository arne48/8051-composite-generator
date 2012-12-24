#include <stdio.h>

/*

Generates Chess-Field-Patters

*/

int main(){
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");

	for (int j=1;j<=48;j++){
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
	}
	for (int j=1;j<=48;j++){
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
	}
	for (int j=1;j<=48;j++){
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
	}
	for (int j=1;j<=48;j++){
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
	}
	for (int j=1;j<=48;j++){
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
		printf(".db 0xFF\n");
		printf(".db 0xFF\n");
		printf(".db 0x00\n");
		printf(".db 0x00\n");
	}

printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
printf(".db 0x00\n");
return 0;
}
