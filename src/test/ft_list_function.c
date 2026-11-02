#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;			 // 64bits
	struct s_list *next; // 64bits
} t_list;

void ft_list_push_front(t_list **list, void *data);

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
}

void test_list_functions()
{
	t_list *list = NULL;

	ft_list_push_front(&list, (void *)"bonjour");
	ft_list_push_front(&list, (void *)"bonjour deux fois");
	ft_list_push_front(&list, (void *)"au revoir");

	printf("%p\n", list);
	print_list(&list);
}
