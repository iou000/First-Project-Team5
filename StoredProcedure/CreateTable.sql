-- 사용자 테이블 생성
create table t_user(
    id number primary key,
    username varchar2(20) not null,
    password varchar2(40) not null
);

-- 레시피 테이블 생성
create table t_recipe(
    id number primary key,
    image varchar2(4000) not null,
    title varchar2(200) not null,
    intro varchar2(2000) not null,
    category varchar2(20) not null,
    ingredients varchar2(4000) not null,
    details varchar2(4000) not null,
    createdat date default sysdate not null,
    updatedat date default sysdate not null,
    viewcount number default 0 not null,
    user_id number references t_user(id)
);

-- 평가 테이블 생성
create table t_comment(
    id number primary key,
    grade number not null,
    contents varchar2(2000) not null,
    createdat date default sysdate not null,
    updatedat date default sysdate not null,
    user_id references t_user(id),
    recipe_id references t_recipe(id)
);