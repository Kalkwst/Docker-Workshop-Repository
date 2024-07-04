#include <stdio.h>

int main() {
    int height = 12;
    int i, j, spaces;

    for (i = 1; i <= height; i++) {
        for (spaces = height - i; spaces > 0; spaces--) {
            printf(" "); 
        }
        for (j = 1; j <= 2 * i - 1; j++) {
            printf("*");
        }
        printf("\n"); 
    }

    return 0;
}
