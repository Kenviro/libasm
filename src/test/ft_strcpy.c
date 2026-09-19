#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *ft_strcpy(char *dest, char *src);

void test_ft_strcpy() {
  char *src = "je suis bien copier";
  char *dest = (char *)malloc(sizeof(char) * (strlen(src) + 1));
  char *ret;

  ret = ft_strcpy(dest, src);
  printf("src = %s\ndest = %s\nret = %s\n", src, dest, ret);
}
