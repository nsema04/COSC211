#include <stdio.h>  /* pre-processor directive */
#include <stdlib.h> /* pre-processor directive */

//Maximum and minimum elements of an array, Noah Semashkewich, 53882783

int main(int argc, char **argv)
{
    unsigned int numbers[10];
    unsigned int max = 0;
    unsigned int min = -1; 

    for (int i = 0; i < 10; i++) {
        printf("Enter a number: ");
        scanf("%u", &numbers[i]);
        
        if (numbers[i] > max) {
            max = numbers[i];
        }
        if (numbers[i] < min) {
            min = numbers[i];
        }
    }
    
    for (int i = 0; i < 10; i++) {
        printf("Guess #%d is %u\n", i + 1, numbers[i]);
    }

    printf("\nThe maximum was %u, and the minimum was %u.\n", max, min);

    }