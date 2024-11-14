Q1.
  create table departments(
    department_id INT unsigned auto_increment PRIMARY KEY,
    -> name VARCHAR(20) not null,
    -> created_at TIMESTAMP default CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
 
Q2.
  ALTER TABLE people ADD department_id INT unsigned AFTER email;

Q3.
  追加する部署一覧
    INSERT INTO departments(name)
    -> values
    -> ("営業"),
    -> ("開発"),
    -> ("経理"),
    -> ("人事"),
    -> ("情報システム");

  追加する人の条件
    insert into people(name,email,department_id,age,gender)
    -> values
    -> ('立花真','tachibana@email.com',1,32,1),
    -> ('花崎ちひろ','hanasaki@email.com',3,27,2),
    -> ('結城守','yuuki@email.com',1,24,1),
    -> ('荒川乾','arakawa@email.com',1,24,1),
    -> ('佐倉千枝','sakura@email.com',2,26,2),
    -> ('原田優成','harada@email.com',2,30,1),
    -> ('朝倉陽菜','asakura@email.com',2,25,2),
    -> ('野村永人','nomura@email.com',2,28,1),
    -> ('赤里若菜','akasato@email,com',4,34,2),
    -> ('里中聡','satonaka@email.com',5,33,1);

  追加する日報
    insert into reports(person_id,content)
    -> values
    -> (16,'明日の天気は雨のち晴れ'),
    -> (14,'間違いを見つけ次第報告を行うこと'),
    -> (15,'明後日に会議あり。報告のまとめを行うこと'),
    -> (10,'午後から営業周り。所持品確認'),
    -> (7,'有事があった際の報告場所'),
    -> (8,'里中さんに相談事。要確認'),
    -> (9,'連絡事項あり。赤里まで'),
    -> (11,'開発陣営からご報告事項があります'),
    -> (12,'レクリエーションのご連絡'),
    -> (13,'お疲れ様です。本日の業務のご報告');

Q4.
  update people SET department_id='1' WHERE person_id=1;
  update people SET department_id='2'WHERE person_id=2;
  update people SET department_id='4'WHERE person_id=3;
  update people SET department_id='5'WHERE person_id=4;
  update people SET department_id='1'WHERE person_id=6;

Q5.
  select name,age from people where gender=1 order by age desc;

Q6.
  peopleテーブルのdepartment_idが1に指定されている人のname、email、ageのカラムをレコードが作成された日時が古い順に取得することができる。

Q7.
  select name from people where age between 40 and 49 and gender=1 or age between 20 and 29 and gender=2;

Q8.
  select name from people where department_id=1 and age order by age desc;

Q9.
  select AVG(age) AS average_age from people where gender=2 and department_id=2;

Q10.
  select name,department_id,content from people INNER JOIN reports ON people.person_id = reports.person_id;

Q11.
  select name from people where not exists (select * from reports where people.person_id = reports.person_id);

  select name from people LEFT OUTER JOIN reports ON people.person_id = reports.person_id where reports.person_id IS null;