# x86-64 standalone vim

- 울 학교 네트워크 과제 서버에서 과제 중 **vi** 밖에 없어서 **code highlighting** 기능을 사용할 수 없었음. 하지만 **sudo** 권한이 없어 **vim** 을 설치할 수도 없었음.

- 그래서 **vim** 바이너리를 외부에서 가져와서 필요한 라이브러리는 **shared library path hooking** 으로 해결하는 방식으로 **standalone vim** 을 사용해보자. 

## Setup

- 네트워크 과제 서버에 접속합니다. 그리고 다음 명령어들을 차례로 입력하세요. 

```shell
cd
git clone https://github.com/ccss17/standalone-vim
cd standalone-vim
./setup.sh
```

- 끝났습니다. 

##### FROM 

![alt text](nosyntax.png)

##### TO 

![alt text](syntax.png)
