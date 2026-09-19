#include <stdio.h>

int ft_strcmp(char *str1, char *str2);

void test_ft_strcmp()
{
    char *s1 = "test";
    char *s2 = "test test";
    char *s3 = "another string";

    printf(
        "comapre of string 1 and 2 = %d\ncompare of string 1 and 1 = "
        "%d\ncompare of string 2 and 3 = %d\ncompare of string 3 and 3 = %d\n",
        ft_strcmp(s1, s2), ft_strcmp(s1, s1), ft_strcmp(s2, s3),
        ft_strcmp(s3, s3));
}
