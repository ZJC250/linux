
#include<stdio.h>
#include<stdio.h>
#include<string.h>

char* addStrings(char*num1,char*num2){
	int len1=strlen(num1);
	int len2=strlen(num2);

	int max_len=(len1 > len2 ? len1 : len2)+1;
	char*result=(char*)malloc(max_len + 1);
	if(result == NULL){
		printf("内存分配失败\n");
		exit(1);
	}
	result[max_len] = '\0';

	int i = len1 - 1;
	int j = len2 - 1;
	int k = max_len - 1;
	int carry = 0;

	while (i >= 0 || j >= 0 || carry > 0){
		int sum = carry;

		if(i >= 0){
		sum += num1[i] - '0';
		i--;
	}

	if(j >= 0){
		sum += num2[j] - '0';
		j--;
	}

	carry = sum / 10;
	result[k] = (sum % 10)+ '0';
	}

	if (k >=0) {
		memmove(result, result + k + 1,max_len - k);
	}

	return result;
}

int main(int argc, char* argv[]){

	if(argc != 3){
		printf("用法：%s <num1> <num2>\n",argv[0]);
		printf("示例：%s 11 123\n",argv[0]);
		return 1;
	}

	for(int i = 0; argv[1][i] != '\0'; i++{
	if(argv[1][i] < '0' || argv[1][i] > '9'){
		printf(“错误：输入必须是有效的非负整数\n");
		return 1;
	}
		}

	for (int i = 0; argv[2][i] != '\0'; i++){
		if(argv[2][i] < '0' || argv[2][i] > '9'){
		printf(”错误：输入必须是有效的非负整数\n");
		return 1;
		}
	}

	char* sum = addString(argv[1], argv[2]);
	printf("%s\n", sum);

	free(sum);

	return 0;
}
