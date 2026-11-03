#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;			 // 64bits
	struct s_list *next; // 64bits
} t_list;

int ft_strcmp(char *str1, char *str2);
char *ft_strdup(char *str);

void ft_list_push_front(t_list **list, void *data);
void ft_list_sort(t_list **begin_list, int (*cmp)());
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
					   void (*free_fct)(void *));
unsigned int ft_list_size(t_list *begin_list);

void print_size(t_list *list)
{
	printf("size of the list = %d\n\n", ft_list_size(list));
}

static void print_list(t_list **list)
{
	if (!*(list))
	{
		printf("list empty\n");
		return;
	}

	t_list *tmp = *list;
	while (tmp)
	{
		printf("data = %s\n", (char *)tmp->data);
		tmp = tmp->next;
	}
	printf("\n");

	print_size(*list);
}

void test_list_functions()
{
	t_list *list = NULL;

	print_size(list);
	ft_list_push_front(&list, (void *)ft_strdup("bonjour"));
	printf("list->data = %s\n", (char *)list->data);
	print_size(list);
	ft_list_push_front(&list, (void *)ft_strdup("bonjour deux fois"));
	ft_list_push_front(&list, (void *)ft_strdup("au revoir"));

	print_list(&list);

	printf("sorting list...\n");
	ft_list_sort(&list, ft_strcmp);
	print_list(&list);

	ft_list_remove_if(&list, (void *)"bonjour", ft_strcmp, free);
	print_list(&list);
}
