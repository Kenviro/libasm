#include <stdio.h>
#include <string.h>

int ft_strlen(char *s);

void test_ft_strlen() {
  char *s1 = "Hello!";
  char *s2 = "this is a great test for strlen";
  char *s3 = "this is 20 character";

  printf("string: '%s' is:\n\t%ld character long\n\t%d character long\n", s1,
         strlen(s1), ft_strlen(s1));

  printf("string: '%s' is:\n\t%ld character long\n\t%d character long\n", s2,
         strlen(s2), ft_strlen(s2));

  printf("string: '%s' is:\n\t%ld character long\n\t%d character long\n", s3,
         strlen(s3), ft_strlen(s3));
}
