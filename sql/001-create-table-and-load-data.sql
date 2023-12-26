DROP TABLE IF EXISTS players;

CREATE TABLE players(
  id int unsigned AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  uniformNumber VARCHAR(100) NOT NULL,
  position VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

INSERT INTO players(id,name, uniformNumber,position) VALUES(1,"村上頌樹",41,"投手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(2,"坂本 誠志郎",12, "捕手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(3,"大山 悠輔",3, "一塁手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(4,"中野 拓夢",51,"二塁手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(5,"佐藤 輝明",8,"三塁手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(6,"木浪 聖也",0,"遊撃手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(7,"ノイジー",7,"左翼手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(8,"近本 光司",5,"中堅手");
INSERT INTO players(id,name, uniformNumber,position) VALUES(9,"森下 翔太",1,"右翼手");
