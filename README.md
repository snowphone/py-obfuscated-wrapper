py-obfuscated-wrapper
---------------------

py-obfuscated-wrapper는 pyarmor를 기반으로 작성된, 난독화된 exe파일을 생성하는 스크립트이다.
이는 크게 두 가지의 이유로 인해 작성되었다.
* Windows 환경에서 파일 인코딩으로 인해 정상적인 pyarmor과 pyinstaller의 작동이 불가능했다.
	* UTF-8로 개발환경을 맞출 경우, pyarmor에서 UTF-8을 인식하지 못하여 euc-kr로 시도한다.
	* euc-kr로 개발환경을 맞출 경우, pyarmor는 정상 작동하지만, pyinstaller에서 오류가 발생한다.
* pyarmor에서 pack과 expire date를 동시에 이용하는 직관적인 명령어가 존재하지 않는다.

따라서 위의 문제들을 해결하기 위해 pyarmor가 UTF-8으로 소스코드를 해석하도록 강제하였으며, 
pyarmor에서 expire date를 생성하는 licenses 명령과 exe파일을 생성하는 pack 명령을 합친 스크립트를 작성하였다. 
