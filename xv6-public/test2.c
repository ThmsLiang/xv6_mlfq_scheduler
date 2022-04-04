#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void){
    int id = fork();
    if (id < 0)
    {
      printf(1, "%d failed in fork!\n", getpid());
    }

    else if (id > 0)
    {

      // fork ten times as instructed
      for(int i = 0; i< 3; i++){
        fork();
      }

			//cpu intensive work 
			int x = 9999999;
      for (double z = 0; z < 20000000; z += 1)
      {
        x = x / 1.2; // useless calculations to consume CPU time
      }
		printf(1, "Parent completed with result: %d\n", x);

		//wait three times 
		for(int i = 0; i< 3; i++){
        wait();
        }
        getpinfo(getpid());
    }

	//child process
	else
	{
		printf(1, "Child %d created\n", getpid());
		int x = 99999999;
		for (double z = 0; z < 20000000; z += 1)
        {
          x = x / 1.2; // useless calculations to consume CPU time
        }

        printf(1, "Child completed with result: %d\n", x);
		getpinfo(getpid());
		}
		exit();
}