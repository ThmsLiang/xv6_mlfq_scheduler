#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{

    int n = 1000;

    for (int k = 0; k < n; k++)
    {
        sleep(1);
    }

    //Print info
    getpinfo(getpid());
    exit();
}