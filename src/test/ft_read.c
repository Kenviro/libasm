#include <errno.h>
#include <stdio.h>
#include <string.h>

ssize_t ft_read(int fd, void *buf, size_t count);

void test_ft_read()
{
    char buffer[100];

    memset(buffer, 0, sizeof(buffer));
    printf("Tape quelque chose puis Entree :\n");

    ssize_t ret = ft_read(0, buffer, sizeof(buffer) - 1);
    printf("ft_read a lu %zd octet(s) : %s", ret, buffer);

    ret = ft_read(-1, buffer, sizeof(buffer));
    printf("ft_read sur un fd invalide a retourne %zd\n", ret);
    printf("errno = %d (%s)\n", errno, strerror(errno));
}
