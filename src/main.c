#include <stdio.h>

void test_ft_strlen();
void test_ft_strcpy();
void test_ft_strcmp();
void test_ft_write();
void test_ft_read();
void test_ft_strdup();

int main()
{
    printf("|| test ft_strlen ||\n");
    test_ft_strlen();

    printf("\n\n|| test ft_strcpy ||\n");
    test_ft_strcpy();

    printf("\n\n|| test ft_strcmp ||\n");
    test_ft_strcmp();

    printf("\n\n|| test ft_write ||\n");
    test_ft_write();

    printf("\n\n|| test ft_read ||\n");
    test_ft_read();

    printf("\n\n|| test ft_strdup ||\n");
    test_ft_strdup();

    return 0;
}
