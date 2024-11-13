#include <stdio.h>  /* pre-processor directive */
#include <stdlib.h> /* pre-processor directive */

//Number comparing program, Noah Semashkewich, 53882783

int main(int argc, char **argv)
{
    int n1;
    int n2;
    
    printf("Enter a number: ");
    scanf("%d", &n1);
    
    printf("Enter another number: ");
    scanf("%d", &n2);
    
    if (n1 > n2) {
        printf("The number %d is larger than %d.", n1, n2);
    }else {
        printf("The number %d is less than or equal to %d.", n1, n2);
    }

    return 0;

    }