#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;			 // 64bits
	struct s_list *next; // 64bits
} t_list;

void ft_list_push_front(t_list **list, void *data);
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
	ft_list_push_front(&list, (void *)"bonjour");
	printf("list->data = %s\n", (char *)list->data);
	print_size(list);
	ft_list_push_front(&list, (void *)"bonjour deux fois");
	ft_list_push_front(&list, (void *)"au revoir");

	print_list(&list);
}
