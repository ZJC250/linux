
#include <stdio.h>  
#include <stdlib.h>
#include <string.h>
char* addStrings(const char* num1, const char* num2) {
    int len1 = strlen(num1);
    int len2 = strlen(num2);
    int max_len = (len1 > len2) ? len1 : len2;
    int result_len = max_len + 1;
    char* result = (char*)malloc(result_len * sizeof(char));
    if (result == NULL) {
        fprintf(stderr, "内存分配失败！\n");
      exit(EXIT_FAILURE); 
    }
    int carry = 0;
    int i = len1 - 1; 
    int j = len2 - 1;
    int k = result_len - 1;

    result[k] = '\0'; 
    k--; 


    while (i >= 0 || j >= 0 || carry > 0) {
        int digit1 = (i >= 0) ? (num1[i] - '0') : 0;
        int digit2 = (j >= 0) ? (num2[j] - '0') : 0;
        int sum = digit1 + digit2 + carry;
        result[k] = (sum % 10) + '0';
        carry = sum / 10;      
        i--;
        j--;
        k--;
    }
    if (k + 1 > 0) {
 memmove(result, result + k + 1, (result_len - (k + 1)) * sizeof  (char));
   char* temp = (char*)realloc(result, (result_len - (k + 1) + 1) * sizeof(char));
        if (temp != NULL) {
            result = temp;
        }
   }
    return result;
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("用法错误！正确格式：%s <数字1> <数字2>\n", argv[0]);
        printf("示例：./string_add 11 123\n");
        return EXIT_FAILURE;
    }

    const char* num1 = argv[1];
    const char* num2 = argv[2];
    for (int i = 0; num1[i] != '\0'; i++) {
        if (num1[i] < '0' || num1[i] > '9') {
      
 printf("错误：%s 不是合法非负整数（包含非法字符）\n", num1);
            return EXIT_FAILURE;
        }
    }

    for (int i = 0; num2[i] != '\0'; i++) {
        if (num2[i] < '0' || num2[i] > '9') {
            printf("错误：%s 不是合法非负整数（包含非法字符）\n", num2);
            return EXIT_FAILURE;
        }
    }

    char* result = addStrings(num1, num2);
    if (result != NULL) {
        printf("计算结果：%s + %s = %s\n", num1, num2, result);
        free(result);  // 释放内存，避免泄漏
    } else {
        fprintf(stderr, "计算失败！\n");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;  // 程序正常退出
}
