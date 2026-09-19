#include <errno.h>
#include <stdio.h>
#include <string.h>

int ft_write(int fd, char *s, size_t count);

void test_ft_write()
{
    ft_write(0, "this print\n\0", strlen("this print\n\0"));
    ft_write(-1, "this error\n\0", strlen("this error\n\0"));
    printf("errno = %d\n", errno);
}
