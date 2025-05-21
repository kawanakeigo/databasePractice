-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。

CREATE DATABASE practice;

-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL DEFAULT '', 
  age INTEGER NOT NULL DEFAULT 0,        
  gender VARCHAR(10) NOT NULL DEFAULT 'Other' CHECK (gender IN ('Man', 'Woman', 'Other')) 
);

COMMENT ON TABLE users IS 'ユーザー情報管理テーブル';
COMMENT ON COLUMN users.id IS 'ユーザーID';
COMMENT ON COLUMN users.name IS '氏名';
COMMENT ON COLUMN users.age IS '年齢';
COMMENT ON COLUMN users.gender IS '性別（Man/Woman/Other）';


-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT '会社員', 
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);

COMMENT ON TABLE jobs IS '仕事情報管理テーブル';
COMMENT ON COLUMN jobs.id IS '仕事ID';
COMMENT ON COLUMN jobs.user_id IS 'ユーザーのID';
COMMENT ON COLUMN jobs.name IS '仕事名';
