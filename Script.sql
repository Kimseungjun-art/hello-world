--system 계정으로 접속한 뒤 해당계정으로 sql문 실행
--계정생성
CREATE USER webdb IDENTIFIED BY 1234;
--접속 리소스 사용, 권한 부여
GRANT resource, CONNECT TO webdb;
ALTER USER webdb IDENTIFIED BY webdb;
