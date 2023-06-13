# Vault kv를 이용한 docker-compose 데모

### 요구조건
- docker 설치
- docker-compose 설치
- jq 설치
- vault 설치
- 대상 vault root token 확인
- 도커 엔진 : 1.12.0 이상
- 도커 컴포즈 : 1.6.0 이상
- 사용 포트 : 8000

### 실행

- 저장소 클론 -> 폴더 이동 -> compose-up.sh 실행, compose-down.sh 실행

```
$ git clone https://github.com/Victor-kr/docker-compose.git
$ cd docker-compose
$ ./compose-up.sh
$ ./compose-down.sh
```


### 주의
- postgres 서비스가 올라오는데 5초이상이 걸리기때문에 django 서비스에 sleep 10 커맨드 추가
