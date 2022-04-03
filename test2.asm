
_test2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
    int id = fork();
  11:	e8 84 03 00 00       	call   39a <fork>
    if (id < 0)
  16:	85 c0                	test   %eax,%eax
  18:	0f 88 94 00 00 00    	js     b2 <main+0xb2>
    {
      printf(1, "%d failed in fork!\n", getpid());
    }

    else if (id > 0)
  1e:	0f 84 a6 00 00 00    	je     ca <main+0xca>
    {

      // fork ten times as instructed
      for(int i = 0; i< 3; i++){
        fork();
  24:	e8 71 03 00 00       	call   39a <fork>
  29:	e8 6c 03 00 00       	call   39a <fork>
  2e:	e8 67 03 00 00       	call   39a <fork>
  33:	d9 7d f6             	fnstcw -0xa(%ebp)
  36:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
      }

			//cpu intensive work 
			int x = 9999999;
      for (double z = 0; z < 20000000; z += 1)
  3a:	d9 ee                	fldz   
			int x = 9999999;
  3c:	c7 45 ec 7f 96 98 00 	movl   $0x98967f,-0x14(%ebp)
      {
        x = x / 1.2; // useless calculations to consume CPU time
  43:	dd 05 b8 08 00 00    	fldl   0x8b8
  49:	80 cc 0c             	or     $0xc,%ah
  4c:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  50:	eb 08                	jmp    5a <main+0x5a>
  52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  58:	d9 c9                	fxch   %st(1)
  5a:	db 45 ec             	fildl  -0x14(%ebp)
  5d:	d8 f1                	fdiv   %st(1),%st
  5f:	d9 6d f4             	fldcw  -0xc(%ebp)
  62:	db 5d ec             	fistpl -0x14(%ebp)
  65:	d9 6d f6             	fldcw  -0xa(%ebp)
  68:	d9 c9                	fxch   %st(1)
      for (double z = 0; z < 20000000; z += 1)
  6a:	d8 05 c0 08 00 00    	fadds  0x8c0
  70:	d9 05 c4 08 00 00    	flds   0x8c4
  76:	df e9                	fucomip %st(1),%st
  78:	77 de                	ja     58 <main+0x58>
  7a:	dd d8                	fstp   %st(0)
  7c:	dd d8                	fstp   %st(0)
      }
		printf(1, "Parent completed with result: %d\n", x);
  7e:	51                   	push   %ecx
  7f:	ff 75 ec             	pushl  -0x14(%ebp)
  82:	68 70 08 00 00       	push   $0x870
  87:	6a 01                	push   $0x1
  89:	e8 62 04 00 00       	call   4f0 <printf>

		//wait three times 
		for(int i = 0; i< 3; i++){
        wait();
  8e:	e8 17 03 00 00       	call   3aa <wait>
  93:	e8 12 03 00 00       	call   3aa <wait>
  98:	e8 0d 03 00 00       	call   3aa <wait>
        }
        getpinfo(getpid());
  9d:	e8 80 03 00 00       	call   422 <getpid>
  a2:	89 04 24             	mov    %eax,(%esp)
  a5:	e8 98 03 00 00       	call   442 <getpinfo>
  aa:	83 c4 10             	add    $0x10,%esp
        }

        printf(1, "Child completed with result: %d\n", x);
		getpinfo(getpid());
		}
		exit();
  ad:	e8 f0 02 00 00       	call   3a2 <exit>
      printf(1, "%d failed in fork!\n", getpid());
  b2:	e8 6b 03 00 00       	call   422 <getpid>
  b7:	52                   	push   %edx
  b8:	50                   	push   %eax
  b9:	68 48 08 00 00       	push   $0x848
  be:	6a 01                	push   $0x1
  c0:	e8 2b 04 00 00       	call   4f0 <printf>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	eb e3                	jmp    ad <main+0xad>
		printf(1, "Child %d created\n", getpid());
  ca:	e8 53 03 00 00       	call   422 <getpid>
  cf:	52                   	push   %edx
  d0:	50                   	push   %eax
  d1:	68 5c 08 00 00       	push   $0x85c
  d6:	6a 01                	push   $0x1
  d8:	e8 13 04 00 00       	call   4f0 <printf>
  dd:	d9 7d f6             	fnstcw -0xa(%ebp)
  e0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
		for (double z = 0; z < 20000000; z += 1)
  e4:	d9 ee                	fldz   
		printf(1, "Child %d created\n", getpid());
  e6:	83 c4 10             	add    $0x10,%esp
		int x = 99999999;
  e9:	c7 45 ec ff e0 f5 05 	movl   $0x5f5e0ff,-0x14(%ebp)
          x = x / 1.2; // useless calculations to consume CPU time
  f0:	dd 05 b8 08 00 00    	fldl   0x8b8
  f6:	80 cc 0c             	or     $0xc,%ah
  f9:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  fd:	eb 03                	jmp    102 <main+0x102>
  ff:	90                   	nop
 100:	d9 c9                	fxch   %st(1)
 102:	db 45 ec             	fildl  -0x14(%ebp)
 105:	d8 f1                	fdiv   %st(1),%st
 107:	d9 6d f4             	fldcw  -0xc(%ebp)
 10a:	db 5d ec             	fistpl -0x14(%ebp)
 10d:	d9 6d f6             	fldcw  -0xa(%ebp)
 110:	d9 c9                	fxch   %st(1)
		for (double z = 0; z < 20000000; z += 1)
 112:	d8 05 c0 08 00 00    	fadds  0x8c0
 118:	d9 05 c4 08 00 00    	flds   0x8c4
 11e:	df e9                	fucomip %st(1),%st
 120:	77 de                	ja     100 <main+0x100>
 122:	dd d8                	fstp   %st(0)
 124:	dd d8                	fstp   %st(0)
        printf(1, "Child completed with result: %d\n", x);
 126:	50                   	push   %eax
 127:	ff 75 ec             	pushl  -0x14(%ebp)
 12a:	68 94 08 00 00       	push   $0x894
 12f:	6a 01                	push   $0x1
 131:	e8 ba 03 00 00       	call   4f0 <printf>
		getpinfo(getpid());
 136:	e8 e7 02 00 00       	call   422 <getpid>
 13b:	89 04 24             	mov    %eax,(%esp)
 13e:	e8 ff 02 00 00       	call   442 <getpinfo>
 143:	83 c4 10             	add    $0x10,%esp
 146:	e9 62 ff ff ff       	jmp    ad <main+0xad>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	84 c0                	test   %al,%al
 192:	75 1c                	jne    1b0 <strcmp+0x30>
 194:	eb 2a                	jmp    1c0 <strcmp+0x40>
 196:	8d 76 00             	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1a6:	83 c1 01             	add    $0x1,%ecx
 1a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1ac:	84 c0                	test   %al,%al
 1ae:	74 10                	je     1c0 <strcmp+0x40>
 1b0:	38 d8                	cmp    %bl,%al
 1b2:	74 ec                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b4:	29 d8                	sub    %ebx,%eax
}
 1b6:	5b                   	pop    %ebx
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
    if(*s == c)
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
  for(; *s; s++)
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
 24e:	31 c0                	xor    %eax,%eax
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 266:	31 f6                	xor    %esi,%esi
 268:	89 f3                	mov    %esi,%ebx
{
 26a:	83 ec 1c             	sub    $0x1c,%esp
 26d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 270:	eb 2f                	jmp    2a1 <gets+0x41>
 272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 278:	8d 45 e7             	lea    -0x19(%ebp),%eax
 27b:	83 ec 04             	sub    $0x4,%esp
 27e:	6a 01                	push   $0x1
 280:	50                   	push   %eax
 281:	6a 00                	push   $0x0
 283:	e8 32 01 00 00       	call   3ba <read>
    if(cc < 1)
 288:	83 c4 10             	add    $0x10,%esp
 28b:	85 c0                	test   %eax,%eax
 28d:	7e 1c                	jle    2ab <gets+0x4b>
      break;
    buf[i++] = c;
 28f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 293:	83 c7 01             	add    $0x1,%edi
 296:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 23                	je     2c0 <gets+0x60>
 29d:	3c 0d                	cmp    $0xd,%al
 29f:	74 1f                	je     2c0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2a1:	83 c3 01             	add    $0x1,%ebx
 2a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a7:	89 fe                	mov    %edi,%esi
 2a9:	7c cd                	jl     278 <gets+0x18>
 2ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	90                   	nop
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	8b 75 08             	mov    0x8(%ebp),%esi
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	01 de                	add    %ebx,%esi
 2c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ca:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d0:	5b                   	pop    %ebx
 2d1:	5e                   	pop    %esi
 2d2:	5f                   	pop    %edi
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    
 2d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	pushl  0x8(%ebp)
 2ed:	e8 f0 00 00 00       	call   3e2 <open>
  if(fd < 0)
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
 2f7:	78 27                	js     320 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	ff 75 0c             	pushl  0xc(%ebp)
 2ff:	89 c3                	mov    %eax,%ebx
 301:	50                   	push   %eax
 302:	e8 f3 00 00 00       	call   3fa <fstat>
  close(fd);
 307:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30a:	89 c6                	mov    %eax,%esi
  close(fd);
 30c:	e8 b9 00 00 00       	call   3ca <close>
  return r;
 311:	83 c4 10             	add    $0x10,%esp
}
 314:	8d 65 f8             	lea    -0x8(%ebp),%esp
 317:	89 f0                	mov    %esi,%eax
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 320:	be ff ff ff ff       	mov    $0xffffffff,%esi
 325:	eb ed                	jmp    314 <stat+0x34>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 337:	0f be 11             	movsbl (%ecx),%edx
 33a:	8d 42 d0             	lea    -0x30(%edx),%eax
 33d:	3c 09                	cmp    $0x9,%al
  n = 0;
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 344:	77 1f                	ja     365 <atoi+0x35>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 350:	8d 04 80             	lea    (%eax,%eax,4),%eax
 353:	83 c1 01             	add    $0x1,%ecx
 356:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 35a:	0f be 11             	movsbl (%ecx),%edx
 35d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	5b                   	pop    %ebx
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 10             	mov    0x10(%ebp),%ebx
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 37e:	85 db                	test   %ebx,%ebx
 380:	7e 14                	jle    396 <memmove+0x26>
 382:	31 d2                	xor    %edx,%edx
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 392:	39 d3                	cmp    %edx,%ebx
 394:	75 f2                	jne    388 <memmove+0x18>
  return vdst;
}
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 39a:	b8 01 00 00 00       	mov    $0x1,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <exit>:
SYSCALL(exit)
 3a2:	b8 02 00 00 00       	mov    $0x2,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <wait>:
SYSCALL(wait)
 3aa:	b8 03 00 00 00       	mov    $0x3,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <pipe>:
SYSCALL(pipe)
 3b2:	b8 04 00 00 00       	mov    $0x4,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <read>:
SYSCALL(read)
 3ba:	b8 05 00 00 00       	mov    $0x5,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <write>:
SYSCALL(write)
 3c2:	b8 10 00 00 00       	mov    $0x10,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <close>:
SYSCALL(close)
 3ca:	b8 15 00 00 00       	mov    $0x15,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kill>:
SYSCALL(kill)
 3d2:	b8 06 00 00 00       	mov    $0x6,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <exec>:
SYSCALL(exec)
 3da:	b8 07 00 00 00       	mov    $0x7,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <open>:
SYSCALL(open)
 3e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mknod>:
SYSCALL(mknod)
 3ea:	b8 11 00 00 00       	mov    $0x11,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <unlink>:
SYSCALL(unlink)
 3f2:	b8 12 00 00 00       	mov    $0x12,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <fstat>:
SYSCALL(fstat)
 3fa:	b8 08 00 00 00       	mov    $0x8,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <link>:
SYSCALL(link)
 402:	b8 13 00 00 00       	mov    $0x13,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <mkdir>:
SYSCALL(mkdir)
 40a:	b8 14 00 00 00       	mov    $0x14,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <chdir>:
SYSCALL(chdir)
 412:	b8 09 00 00 00       	mov    $0x9,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <dup>:
SYSCALL(dup)
 41a:	b8 0a 00 00 00       	mov    $0xa,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <getpid>:
SYSCALL(getpid)
 422:	b8 0b 00 00 00       	mov    $0xb,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sbrk>:
SYSCALL(sbrk)
 42a:	b8 0c 00 00 00       	mov    $0xc,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <sleep>:
SYSCALL(sleep)
 432:	b8 0d 00 00 00       	mov    $0xd,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <uptime>:
SYSCALL(uptime)
 43a:	b8 0e 00 00 00       	mov    $0xe,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <getpinfo>:
SYSCALL(getpinfo)
 442:	b8 16 00 00 00       	mov    $0x16,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 459:	85 d2                	test   %edx,%edx
{
 45b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 45e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 460:	79 76                	jns    4d8 <printint+0x88>
 462:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 466:	74 70                	je     4d8 <printint+0x88>
    x = -xx;
 468:	f7 d8                	neg    %eax
    neg = 1;
 46a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 471:	31 f6                	xor    %esi,%esi
 473:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 476:	eb 0a                	jmp    482 <printint+0x32>
 478:	90                   	nop
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 fe                	mov    %edi,%esi
 482:	31 d2                	xor    %edx,%edx
 484:	8d 7e 01             	lea    0x1(%esi),%edi
 487:	f7 f1                	div    %ecx
 489:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
  }while((x /= base) != 0);
 490:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 492:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 495:	75 e9                	jne    480 <printint+0x30>
  if(neg)
 497:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 49a:	85 c0                	test   %eax,%eax
 49c:	74 08                	je     4a6 <printint+0x56>
    buf[i++] = '-';
 49e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4a3:	8d 7e 02             	lea    0x2(%esi),%edi
 4a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4b3:	83 ec 04             	sub    $0x4,%esp
 4b6:	83 ee 01             	sub    $0x1,%esi
 4b9:	6a 01                	push   $0x1
 4bb:	53                   	push   %ebx
 4bc:	57                   	push   %edi
 4bd:	88 45 d7             	mov    %al,-0x29(%ebp)
 4c0:	e8 fd fe ff ff       	call   3c2 <write>

  while(--i >= 0)
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	39 de                	cmp    %ebx,%esi
 4ca:	75 e4                	jne    4b0 <printint+0x60>
    putc(fd, buf[i]);
}
 4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cf:	5b                   	pop    %ebx
 4d0:	5e                   	pop    %esi
 4d1:	5f                   	pop    %edi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4df:	eb 90                	jmp    471 <printint+0x21>
 4e1:	eb 0d                	jmp    4f0 <printf>
 4e3:	90                   	nop
 4e4:	90                   	nop
 4e5:	90                   	nop
 4e6:	90                   	nop
 4e7:	90                   	nop
 4e8:	90                   	nop
 4e9:	90                   	nop
 4ea:	90                   	nop
 4eb:	90                   	nop
 4ec:	90                   	nop
 4ed:	90                   	nop
 4ee:	90                   	nop
 4ef:	90                   	nop

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4fc:	0f b6 1e             	movzbl (%esi),%ebx
 4ff:	84 db                	test   %bl,%bl
 501:	0f 84 b3 00 00 00    	je     5ba <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 507:	8d 45 10             	lea    0x10(%ebp),%eax
 50a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 50d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 50f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 512:	eb 2f                	jmp    543 <printf+0x53>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	0f 84 a7 00 00 00    	je     5c8 <printf+0xd8>
  write(fd, &c, 1);
 521:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 524:	83 ec 04             	sub    $0x4,%esp
 527:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 52a:	6a 01                	push   $0x1
 52c:	50                   	push   %eax
 52d:	ff 75 08             	pushl  0x8(%ebp)
 530:	e8 8d fe ff ff       	call   3c2 <write>
 535:	83 c4 10             	add    $0x10,%esp
 538:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 53b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 53f:	84 db                	test   %bl,%bl
 541:	74 77                	je     5ba <printf+0xca>
    if(state == 0){
 543:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 545:	0f be cb             	movsbl %bl,%ecx
 548:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 54b:	74 cb                	je     518 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 54d:	83 ff 25             	cmp    $0x25,%edi
 550:	75 e6                	jne    538 <printf+0x48>
      if(c == 'd'){
 552:	83 f8 64             	cmp    $0x64,%eax
 555:	0f 84 05 01 00 00    	je     660 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 55b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 561:	83 f9 70             	cmp    $0x70,%ecx
 564:	74 72                	je     5d8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 566:	83 f8 73             	cmp    $0x73,%eax
 569:	0f 84 99 00 00 00    	je     608 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56f:	83 f8 63             	cmp    $0x63,%eax
 572:	0f 84 08 01 00 00    	je     680 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	0f 84 ef 00 00 00    	je     670 <printf+0x180>
  write(fd, &c, 1);
 581:	8d 45 e7             	lea    -0x19(%ebp),%eax
 584:	83 ec 04             	sub    $0x4,%esp
 587:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 58b:	6a 01                	push   $0x1
 58d:	50                   	push   %eax
 58e:	ff 75 08             	pushl  0x8(%ebp)
 591:	e8 2c fe ff ff       	call   3c2 <write>
 596:	83 c4 0c             	add    $0xc,%esp
 599:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 59c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 59f:	6a 01                	push   $0x1
 5a1:	50                   	push   %eax
 5a2:	ff 75 08             	pushl  0x8(%ebp)
 5a5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5aa:	e8 13 fe ff ff       	call   3c2 <write>
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5b6:	84 db                	test   %bl,%bl
 5b8:	75 89                	jne    543 <printf+0x53>
    }
  }
}
 5ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bd:	5b                   	pop    %ebx
 5be:	5e                   	pop    %esi
 5bf:	5f                   	pop    %edi
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5c8:	bf 25 00 00 00       	mov    $0x25,%edi
 5cd:	e9 66 ff ff ff       	jmp    538 <printf+0x48>
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5d8:	83 ec 0c             	sub    $0xc,%esp
 5db:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e0:	6a 00                	push   $0x0
 5e2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	8b 17                	mov    (%edi),%edx
 5ea:	e8 61 fe ff ff       	call   450 <printint>
        ap++;
 5ef:	89 f8                	mov    %edi,%eax
 5f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f4:	31 ff                	xor    %edi,%edi
        ap++;
 5f6:	83 c0 04             	add    $0x4,%eax
 5f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5fc:	e9 37 ff ff ff       	jmp    538 <printf+0x48>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 608:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 60b:	8b 08                	mov    (%eax),%ecx
        ap++;
 60d:	83 c0 04             	add    $0x4,%eax
 610:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 613:	85 c9                	test   %ecx,%ecx
 615:	0f 84 8e 00 00 00    	je     6a9 <printf+0x1b9>
        while(*s != 0){
 61b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 61e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 620:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 622:	84 c0                	test   %al,%al
 624:	0f 84 0e ff ff ff    	je     538 <printf+0x48>
 62a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 62d:	89 de                	mov    %ebx,%esi
 62f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 632:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 635:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 638:	83 ec 04             	sub    $0x4,%esp
          s++;
 63b:	83 c6 01             	add    $0x1,%esi
 63e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 641:	6a 01                	push   $0x1
 643:	57                   	push   %edi
 644:	53                   	push   %ebx
 645:	e8 78 fd ff ff       	call   3c2 <write>
        while(*s != 0){
 64a:	0f b6 06             	movzbl (%esi),%eax
 64d:	83 c4 10             	add    $0x10,%esp
 650:	84 c0                	test   %al,%al
 652:	75 e4                	jne    638 <printf+0x148>
 654:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 657:	31 ff                	xor    %edi,%edi
 659:	e9 da fe ff ff       	jmp    538 <printf+0x48>
 65e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 0a 00 00 00       	mov    $0xa,%ecx
 668:	6a 01                	push   $0x1
 66a:	e9 73 ff ff ff       	jmp    5e2 <printf+0xf2>
 66f:	90                   	nop
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 676:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 679:	6a 01                	push   $0x1
 67b:	e9 21 ff ff ff       	jmp    5a1 <printf+0xb1>
        putc(fd, *ap);
 680:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 683:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 686:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 688:	6a 01                	push   $0x1
        ap++;
 68a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 68d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 690:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 693:	50                   	push   %eax
 694:	ff 75 08             	pushl  0x8(%ebp)
 697:	e8 26 fd ff ff       	call   3c2 <write>
        ap++;
 69c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 69f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a2:	31 ff                	xor    %edi,%edi
 6a4:	e9 8f fe ff ff       	jmp    538 <printf+0x48>
          s = "(null)";
 6a9:	bb c8 08 00 00       	mov    $0x8c8,%ebx
        while(*s != 0){
 6ae:	b8 28 00 00 00       	mov    $0x28,%eax
 6b3:	e9 72 ff ff ff       	jmp    62a <printf+0x13a>
 6b8:	66 90                	xchg   %ax,%ax
 6ba:	66 90                	xchg   %ax,%ax
 6bc:	66 90                	xchg   %ax,%ax
 6be:	66 90                	xchg   %ax,%ax

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 74 0b 00 00       	mov    0xb74,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d8:	39 c8                	cmp    %ecx,%eax
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	73 32                	jae    710 <free+0x50>
 6de:	39 d1                	cmp    %edx,%ecx
 6e0:	72 04                	jb     6e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e2:	39 d0                	cmp    %edx,%eax
 6e4:	72 32                	jb     718 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ec:	39 fa                	cmp    %edi,%edx
 6ee:	74 30                	je     720 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f3:	8b 50 04             	mov    0x4(%eax),%edx
 6f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f9:	39 f1                	cmp    %esi,%ecx
 6fb:	74 3a                	je     737 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6ff:	a3 74 0b 00 00       	mov    %eax,0xb74
}
 704:	5b                   	pop    %ebx
 705:	5e                   	pop    %esi
 706:	5f                   	pop    %edi
 707:	5d                   	pop    %ebp
 708:	c3                   	ret    
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 710:	39 d0                	cmp    %edx,%eax
 712:	72 04                	jb     718 <free+0x58>
 714:	39 d1                	cmp    %edx,%ecx
 716:	72 ce                	jb     6e6 <free+0x26>
{
 718:	89 d0                	mov    %edx,%eax
 71a:	eb bc                	jmp    6d8 <free+0x18>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 720:	03 72 04             	add    0x4(%edx),%esi
 723:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 726:	8b 10                	mov    (%eax),%edx
 728:	8b 12                	mov    (%edx),%edx
 72a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 733:	39 f1                	cmp    %esi,%ecx
 735:	75 c6                	jne    6fd <free+0x3d>
    p->s.size += bp->s.size;
 737:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 73a:	a3 74 0b 00 00       	mov    %eax,0xb74
    p->s.size += bp->s.size;
 73f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 742:	8b 53 f8             	mov    -0x8(%ebx),%edx
 745:	89 10                	mov    %edx,(%eax)
}
 747:	5b                   	pop    %ebx
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 75c:	8b 15 74 0b 00 00    	mov    0xb74,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 762:	8d 78 07             	lea    0x7(%eax),%edi
 765:	c1 ef 03             	shr    $0x3,%edi
 768:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 76b:	85 d2                	test   %edx,%edx
 76d:	0f 84 9d 00 00 00    	je     810 <malloc+0xc0>
 773:	8b 02                	mov    (%edx),%eax
 775:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 778:	39 cf                	cmp    %ecx,%edi
 77a:	76 6c                	jbe    7e8 <malloc+0x98>
 77c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 782:	bb 00 10 00 00       	mov    $0x1000,%ebx
 787:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 78a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 791:	eb 0e                	jmp    7a1 <malloc+0x51>
 793:	90                   	nop
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 79a:	8b 48 04             	mov    0x4(%eax),%ecx
 79d:	39 f9                	cmp    %edi,%ecx
 79f:	73 47                	jae    7e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a1:	39 05 74 0b 00 00    	cmp    %eax,0xb74
 7a7:	89 c2                	mov    %eax,%edx
 7a9:	75 ed                	jne    798 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	56                   	push   %esi
 7af:	e8 76 fc ff ff       	call   42a <sbrk>
  if(p == (char*)-1)
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ba:	74 1c                	je     7d8 <malloc+0x88>
  hp->s.size = nu;
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	50                   	push   %eax
 7c6:	e8 f5 fe ff ff       	call   6c0 <free>
  return freep;
 7cb:	8b 15 74 0b 00 00    	mov    0xb74,%edx
      if((p = morecore(nunits)) == 0)
 7d1:	83 c4 10             	add    $0x10,%esp
 7d4:	85 d2                	test   %edx,%edx
 7d6:	75 c0                	jne    798 <malloc+0x48>
        return 0;
  }
}
 7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7db:	31 c0                	xor    %eax,%eax
}
 7dd:	5b                   	pop    %ebx
 7de:	5e                   	pop    %esi
 7df:	5f                   	pop    %edi
 7e0:	5d                   	pop    %ebp
 7e1:	c3                   	ret    
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7e8:	39 cf                	cmp    %ecx,%edi
 7ea:	74 54                	je     840 <malloc+0xf0>
        p->s.size -= nunits;
 7ec:	29 f9                	sub    %edi,%ecx
 7ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7f7:	89 15 74 0b 00 00    	mov    %edx,0xb74
}
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 800:	83 c0 08             	add    $0x8,%eax
}
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	90                   	nop
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 810:	c7 05 74 0b 00 00 78 	movl   $0xb78,0xb74
 817:	0b 00 00 
 81a:	c7 05 78 0b 00 00 78 	movl   $0xb78,0xb78
 821:	0b 00 00 
    base.s.size = 0;
 824:	b8 78 0b 00 00       	mov    $0xb78,%eax
 829:	c7 05 7c 0b 00 00 00 	movl   $0x0,0xb7c
 830:	00 00 00 
 833:	e9 44 ff ff ff       	jmp    77c <malloc+0x2c>
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b1                	jmp    7f7 <malloc+0xa7>
