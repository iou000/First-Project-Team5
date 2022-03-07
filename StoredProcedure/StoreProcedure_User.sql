-- 사용자 테이블 삽입 프로시저
create or replace procedure user_insert(p_username t_user.username%type, p_password t_user.password%type)
is
begin
     insert into t_user(id, username, password) values(user_seq.nextval, p_username, p_password);
end;
/

-- 사용자 테이블 삭제 프로시저
create or replace procedure user_delete(p_id t_user.id%type)
is
begin
    delete from t_user where id = p_id;
end;
/

-- 사용자 테이블 조회 프로시저
create or replace procedure user_select_all
is
    cursor cur
    is
    select username, password from t_user order by 1;
begin
    for item in cur loop
        dbms_output.put_line(item.username||', '||item.password);
    end loop;
end;
/

-- 사용자가 존재하는지 조회하는 프로시저
create or replace function is_user_exists(p_id t_user.id%type) return varchar2
is
    v_ret varchar2(1);
begin
    select 'x' into v_ret from t_user where id = p_id;

    if v_ret is not null then
        return 'true';
    end if;
    exception
        when no_data_found then
            return 'false';
end;    
/

-- 사용자 테이블 패키지 명세
create or replace package user_pack
is
    procedure user_select_all;
    procedure user_insert(p_username t_user.username%type, p_password t_user.password%type);
    procedure user_delete(p_id t_user.id%type);
    function is_user_exists(p_id t_user.id%type) return varchar2;
end;
/

-- 사용자 테이블 패키지 본문
create or replace package body user_pack
is  
    procedure user_select_all
    is
        cursor cur
        is
        select username, password from t_user order by 1;
    begin
        for item in cur loop
            dbms_output.put_line(item.username||', '||item.password);
        end loop;
    end;
  
    procedure user_insert(p_username t_user.username%type, p_password t_user.password%type)
    is
    begin
        insert into t_user(id, username, password) values(user_seq.nextval, p_username, p_password);
    end;

    procedure user_delete(p_id t_user.id%type)
    is
    begin
        delete from t_user where id = p_id;
    end;

    function is_user_exists(p_id t_user.id%type) return varchar2
    is
        v_ret varchar2(1);
    begin
        select 'x' into v_ret from t_user where id = p_id;
        if v_ret is not null then
            return 'true';
        end if;
        exception
            when no_data_found then
        return 'false';
    end;
end;
/