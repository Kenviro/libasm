NAME		= libasm.a
TEST_NAME	= test_asm

ASM_DIR		= src/asm
TEST_DIR	= src/test

SRC_ASM		= $(wildcard $(ASM_DIR)/*.s)
OBJ_ASM		= $(SRC_ASM:.s=.o)

SRC_C		= src/main.c $(wildcard $(TEST_DIR)/*.c)
OBJ_C		= $(SRC_C:.c=.o)

NASM		= nasm
NASMFLAGS	= -f elf64

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

AR			= ar
ARFLAGS		= rcs

all: $(NAME)

$(NAME): $(OBJ_ASM)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJ_ASM)
	@echo 'libasm.a is ready'

%.o: %.s
	@$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME) $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -L. -lasm -o $(TEST_NAME)
	@echo 'run "./test_asm" to test the lib'

clean:
	@rm -f $(OBJ_ASM) $(OBJ_C)

fclean: clean
	@rm -f $(NAME) $(TEST_NAME)

re: fclean all

.PHONY: all test clean fclean re
