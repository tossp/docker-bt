# 宝塔Linux面板 For Docker

## docker-compose.yml 示例
```yml
# 宝塔面板
# mkdir ./storage/{wwwroot,backup,wwwlogs}
# 启动指令docker-compose up -d

version: '3'

services:
 bt:
  image: tossp/btcn
  volumes:
   - ./storage/wwwroot:/www/wwwroot
   - ./storage/backup:/www/backup
   - ./storage/wwwlogs:/www/wwwlogs
   - /sys/fs/cgroup:/sys/fs/cgroup:ro
  expose:
   - "21"
   - "80"
   - "443"
   - "3306"
   - "8888"
   - "39000-40000"
  ports:
   - "8888:8888"
  restart: always
```
