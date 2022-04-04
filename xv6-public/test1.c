//#include <stdio.h>
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{

    int id;

    printf(1, "~~~~~~~~~~~~~~~~~~ Test 1 ~~~~~~~~~~~~~~~~~~\n");

    //printf(1, "%d", getpinfo(getpid()));
    id = fork();

    if (id < 0)
    {
        printf(1, "%d failed in fork!\n", getpid());
    }

    else if (id > 0)
    { //parent

        //IO intensive
        char *filename = "testIO.txt";
        int fd;
        int j;

        fd = open(filename, O_CREATE | O_WRONLY);
        if (fd == -1)
        {
            printf(1, "Could not open file\n");
            return -1;
        }

        for (int i = 0; i < 10; i++)
        {
            j = write(fd, "A", 1);
        }
        if (j != 1)
            printf(1, "cannot write to file\n");
        printf(1, "Parent completed\n");

        close(fd);
        wait();

        getpinfo(getpid());
    }

    else
    { // child

        printf(1, "Child %d created\n", getpid());
        //int x;

        int x = 999999999;
        for (double z = 0; z < 20000000; z += 1)
        {
            x = x / 1.2; // useless calculations to consume CPU time
        }
        printf(1, "Child completed with result: %d\n", x);
        getpinfo(getpid());
    }

    exit();
}