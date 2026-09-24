#include <stdio.h>
#include <stdlib.h>

char *ft_strdup(char *s);

void test_ft_strdup()
{
    char *s1 = "test good copy";
    char *s2;
    char *s3;

    s2 = ft_strdup(s1);
    printf("s1 = %s\ns2 = %s\n", s1, s2);
    s3 = ft_strdup(s2);
    free(s2);
    printf("after s2 is free s3 = %s\n", s3);
    free(s3);
}
