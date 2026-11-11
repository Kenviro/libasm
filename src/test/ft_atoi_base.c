#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

static int check_base(char *base)
{
	int i;
	int j;

	i = 0;
	while (base[i])
	{
		if (base[i] == '+' || base[i] == '-' ||
			(base[i] >= 9 && base[i] <= 13) || base[i] == ' ')
			return (0);
		j = i + 1;
		while (base[j])
		{
			if (base[i] == base[j])
				return (0);
			j++;
		}
		i++;
	}
	if (i < 2)
		return (0);
	return (i);
}

static int get_index(char c, char *base)
{
	int i;

	i = 0;
	while (base[i])
	{
		if (base[i] == c)
			return (i);
		i++;
	}
	return (-1);
}

static int atoi_base(char *str, char *base)
{
	int len;
	int sign;
	int result;
	int idx;

	len = check_base(base);
	if (len == 0)
		return (0);
	while ((*str >= 9 && *str <= 13) || *str == ' ')
		str++;
	sign = 1;
	while (*str == '+' || *str == '-')
	{
		if (*str == '-')
			sign = -sign;
		str++;
	}
	result = 0;
	idx = get_index(*str, base);
	while (idx != -1)
	{
		result = result * len + idx;
		str++;
		idx = get_index(*str, base);
	}
	return (result * sign);
}

int ft_atoi_base(char *str, char *base);

void test_ft_atoi_base()
{
	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n", atoi(""),
		   atoi_base("", "0123456789"), ft_atoi_base("", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n", atoi("50"),
		   atoi_base("50", "0123456789"), ft_atoi_base("50", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n", atoi("267"),
		   atoi_base("267", "0123456789"), ft_atoi_base("267", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n", atoi("-67"),
		   atoi_base("-67", "0123456789"), ft_atoi_base("-67", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n", atoi("--67"),
		   atoi_base("--67", "0123456789"), ft_atoi_base("--67", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n",
		   atoi("2147483647"), atoi_base("2147483647", "0123456789"),
		   ft_atoi_base("2147483647", "0123456789"));

	printf("atoi = %d\natoi_base = %d\nft_atoi_base = %d\n\n",
		   atoi("2147483667"), atoi_base("2147483667", "0123456789"),
		   ft_atoi_base("2147483667", "0123456789"));

	printf("atoi_base = %d\nft_atoi_base = %d\n\n", atoi_base("1000011", "01"),
		   ft_atoi_base("1000011", "01"));

	printf("atoi_base = %d\nft_atoi_base = %d\n\n", atoi_base("35", "01234567"),
		   ft_atoi_base("35", "01234567"));

	printf("atoi_base = %d\nft_atoi_base = %d\n\n",
		   atoi_base("B00", "0123456789ABCDEF"),
		   ft_atoi_base("B00", "0123456789ABCDEF"));

	printf("ft_atoi_base only 1c in base = %d\n\n", ft_atoi_base("42", "5"));

	printf("ft_atoi_base whitespace in base = %d\n\n",
		   ft_atoi_base("42", "5\a"));

	printf("ft_atoi_base double char in base = %d\n\n",
		   ft_atoi_base("42", "55"));

	printf("ft_atoi_base minus in base = %d\n\n", ft_atoi_base("42", "5-"));
}
