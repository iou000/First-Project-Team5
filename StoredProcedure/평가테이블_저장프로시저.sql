-- 특정 레시피의 전체 평가를 조회하는 프로시저
create or replace procedure comment_select(p_recipe_id number)
is
    -- 커서 선언
    cursor cur
    is
    SELECT u.username us, c.grade gr, c.contents co, c.updatedat up FROM t_comment c
    JOIN t_user u on u.id=c.user_id -- t_user 테이블의 username 컬럼을 가지고 오기 위해서 조인
    WHERE p_recipe_id=c.recipe_id -- 현재 보고있는 레시피에 대한 평가만 가져오기 위한 WHERE 조건
    ORDER BY up DESC;
begin
    -- 커서 OPEN, FETCH
    for item in cur loop
        dbms_output.put_line(item.us||', '||item.gr||', '||item.co||', '||item.up);
    end loop;
end;
/

-- 평가 삽입 프로시저
create or replace procedure comment_insert(
    p_grade number, p_contents varchar2, p_user_id number, p_recipe_id number)
is
begin
    insert into t_comment(id, grade, contents, createdat, updatedat, user_id, recipe_id)
    values(comment_seq.nextval, p_grade, p_contents, sysdate, sysdate, p_user_id, p_recipe_id);
end;
/

-- 평가 수정 프로시저
create or replace procedure comment_update(
    p_id number, p_grade number, p_contents varchar2)
is
begin
    update t_comment set grade=p_grade, contents=p_contents, updatedat=sysdate where id=p_id;
end;
/

-- 평가 삭제 프로시저
create or replace procedure comment_delete(p_id number)
is
begin
    delete from t_comment where id=p_id;
end;
/

-- 평가 패키지 명세
create or replace package comment_pack
is
    procedure comment_select(p_recipe_id number);
    procedure comment_insert(p_grade number, p_contents varchar2, p_user_id number, p_recipe_id number);
    procedure comment_update(p_id number, p_grade number, p_contents varchar2);
    procedure comment_delete(p_id number);
end;
/

-- 평가 패키지 본문
create or replace package body comment_pack
is
    -- 특정 레시피의 전체 평가를 조회하는 프로시저
    procedure comment_select(p_recipe_id number)
    is
        -- 커서 선언
        cursor cur
        is
        SELECT u.username us, c.grade gr, c.contents co, c.updatedat up FROM t_comment c
        JOIN t_user u on u.id=c.user_id -- t_user 테이블의 username 컬럼을 가지고 오기 위해서 조인
        WHERE p_recipe_id=c.recipe_id -- 현재 보고있는 레시피에 대한 평가만 가져오기 위한 WHERE 조건
        ORDER BY up DESC; -- 최근 수정날짜순으로 정렬
    begin
        -- 커서 OPEN, FETCH
        for item in cur loop
            dbms_output.put_line(item.us||', '||item.gr||', '||item.co||', '||item.up);
        end loop;
    end;
    
    -- 평가 삽입 프로시저
    procedure comment_insert(
        p_grade number, p_contents varchar2, p_user_id number, p_recipe_id number)
    is
    begin
        insert into t_comment(id, grade, contents, createdat, updatedat, user_id, recipe_id)
        values(comment_seq.nextval, p_grade, p_contents, sysdate, sysdate, p_user_id, p_recipe_id);
    end;
    
    -- 평가 수정 프로시저
    procedure comment_update(
        p_id number, p_grade number, p_contents varchar2)
    is
    begin
        update t_comment set grade=p_grade, contents=p_contents, updatedat=sysdate where id=p_id;
    end;

    -- 평가 삭제 프로시저
    procedure comment_delete(p_id number)
    is
    begin
        delete from t_comment where id=p_id;
    end;
end;
/