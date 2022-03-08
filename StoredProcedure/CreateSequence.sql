-- 사용자 시퀀스 생성
create sequence user01.user_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;

-- 레시피 시퀀스 생성
create sequence user01.recipe_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;

-- 평가 시퀀스 생성
create sequence user01.comment_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;