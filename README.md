# 概要

第8回目課題：DockerによるMySQLの構築を行う。

## 手順

REST APIのプロジェクト作成のため、[Spring Initializr](https://start.spring.io/)
から以下の依存関係（ある要素が別の要素の存在や完了を前提としている関係のこと）を生成。

- Spring Web
- MySQL Driver
- MyBatis Framework

生成されたzipファイルを解凍し、任意のディレクトリへ格納後、IntelliJより開く。

["docker-compose.yml"](https://qiita.com/yuta-ushijima/items/d3d98177e1b28f736f04),["Dockerfile"](https://qiita.com/gon0821/items/f9e3bcbb6cb01d4ef7fa)
を配置する。

ディレクトリ内のファイル構成は下記。

```
.
├── Dockerfile
├── README.md
├── conf
│   └── mysql
│       └── my.cnf
├── docker-compose.yml
├── renovate.json
└── sql
    └── 001-create-table-and-load-data.sql
```

dockerの確認をする。

```bash
% docker -v
Docker version 24.0.7, build afdd53b
```

docker-compose.ymlがあることを確認する。

```bash
% ls
Dockerfile              conf                    renovate.json
README.md               docker-compose.yml      sql
```

コンテナを起動する。

```bash
% docker compose up -d
[+] Running 2/2
 ⠿ Network docker-mysql-hands-on_default  Created                                                                                  0.0s
 ⠿ Container docker-mysql-hands-on        Started
```

コンテナを確認する。  
docker-mysql-hands-onがあればOK。

```bash
% docker ps           
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS          PORTS                               NAMES
850fd542e459   docker-mysql-hands-on_db   "docker-entrypoint.s…"   45 seconds ago   Up 45 seconds   33060/tcp, 0.0.0.0:3307->3306/tcp   docker-mysql-hands-on
```

MySQLにログインする。
パスワードはdocker-compose.ymlに記載どおり「password」

```bash
% docker compose exec db mysql -uroot -p    
Enter password:
```

以下のように表示されればMySQLにログイン完了。

```bash
% docker compose exec db mysql -uroot -p    
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

players_listがあることを確認する。   
SQL文においてセミコロンはコマンドの終わりを意味。

```mysql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| players_list       |
| sys                |
+--------------------+
5 rows in set (0.05 sec)

```

players_listの利用を開始する。

```mysql
mysql> use players_list;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```

playersテーブルがあることを確認する。

```mysql
mysql> show tables;
+------------------------+
| Tables_in_players_list |
+------------------------+
| players                |
+------------------------+
1 row in set (0.00 sec)
```

playersテーブルのレコードを確認する。

```mysql
mysql> select * from players;
+----+------------------+---------------+-----------+
| id | name             | uniformNumber | position  |
+----+------------------+---------------+-----------+
|  1 | 村上頌樹         | 41            | 投手      |
|  2 | 坂本 誠志郎      | 12            | 捕手      |
|  3 | 大山 悠輔        | 3             | 一塁手    |
|  4 | 中野 拓夢        | 51            | 二塁手    |
|  5 | 佐藤 輝明        | 8             | 三塁手    |
|  6 | 木浪 聖也        | 0             | 遊撃手    |
|  7 | ノイジー         | 7             | 左翼手    |
|  8 | 近本 光司        | 5             | 中堅手    |
|  9 | 森下 翔太        | 1             | 右翼手    |
+----+------------------+---------------+-----------+
9 rows in set (0.00 sec)
```

ログアウトする。

```mysql
mysql> exit
Bye
```

起動したDockerコンテナを停止する。

```bash
$ docker compose down
```

停止できていることを確認する。

```bash
% docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

終了
# No.8
