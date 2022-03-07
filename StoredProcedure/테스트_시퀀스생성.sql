-- 사용자 시퀀스 생성
create sequence ace.user_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;

-- 레시피 시퀀스 생성
create sequence ace.recipe_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;

-- 평가 시퀀스 생성
create sequence ace.comment_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache
    noorder;