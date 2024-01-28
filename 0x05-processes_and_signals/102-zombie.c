#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

/**
 * infinite_while_loop - Run infinite while loop.
 * Return: Always 0.
 */
int infinite_while_loop(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Creates the 5 zombie processes.
 * Return: Always 0.
 */
int main(void)
{
	pid_t pid;
	char counter = 0;

	while (counter < 5)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
			sleep(1);
			counter++;
		}
		else
			exit(0);
	}

	infinite_while_loop();

	return (EXIT_SUCCESS);
}
