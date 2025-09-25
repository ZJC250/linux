#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* addStrings(const char* num1,const char* num2){
	int len1 = strlen(num1);
	int len2 = strlen(num2);

	int max_len = (len1 > len2)? len1 : len2;

	int result_len = max_len + 1;

	char* result = (char*)malloc(result_len * sizeof(char));
	if (result == NULL) {
		printf("内存分配失败，程序推出\n");
		exit(1);
	}

	int carry = 0;
	int i = len1 - 1;
	int j = len2 - 1;
	int k = result_len - 1;

	result[k] = '\0';
	k--;

	while(i >= 0 || j >=0 || carry > 0){
		int digit1 = (i >= 0) ? (num1[i] - '0') : 0;
		int digit2 = (j >= 0) ? (num2[j] - '0') : 0;

		int sum = digit1 + digit2 + carry;
		result[k] = (sum % 10) + '0';
		carry = sum / 10;
		
		i--;
		j--;
		k--;
}

	if (k + 1 >0)
memmove(result, result+k+1,(result_len - (k + 1)) *  sizeof(char));
char* temp = (char*)realloc(result,(result_len - (k+1)+1)* sizeof\
(char));
	if(temp != NULL){
		result = temp;
		}
	}

	return result;
}

int main(int argc, char* argv[]){
	if(argc != 3){
		printf("格式错误\n", argv[0]);
		return 1;
}

	const char* num1 = argv[1];
	const char* num2 = argv[2];

	for (int i = 0; num1[i] != '\0'; i++) {
		if (num1[i] < '0' || num1[i] > '9'){
			printf("false\n", num1);
			return 1;
		}
	}

	for (int i = 0; num2[i] != '\0'; i++) {
		if (num2[i] < '0' || num2]i] > '9') {
		printf("false\n", num2);
		return 1;
		}
	}

	char* result = addStrings(num1, num2);
	if(result != NULL) {
	printf("计算结果:%s + %s = %s\n", num1,num2,result);
	free(result);
}else{
	printf("X\n");
	return 1;
}

	return 0;
}
