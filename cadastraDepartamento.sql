CREATE OR REPLACE Procedure cadastrarDepartamento
     ( cd_departamento_p in varchar2,
       nome_responsavel_p in VARCHAR2,
       login_responsavel_p in VARCHAR2,
       email_responsavel_p in VARCHAR2)
  AS
     cd_departamento_r number := 0;
     cursor c1 is
     SELECT cd_departamento
      FROM departamento
      WHERE cd_departamento = cd_departamento_p;
  BEGIN
     open c1;
     fetch c1 into cd_departamento_r;
     if c1%notfound then
        INSERT INTO departamento(
            cd_departamento,
            nome_responsavel,
            login_responsavel,
            email_responsavel
        )
        VALUES ( cd_departamento_p,
                nome_responsavel_p,
                login_responsavel_p,
                email_responsavel_p );
     else
        UPDATE departamento
        SET  nome_responsavel = nome_responsavel_p,
            login_responsavel = login_responsavel_p,
            email_responsavel = email_responsavel_p
        WHERE cd_departamento = cd_departamento_p;
     end if;
     
     commit;
     close c1;
  EXCEPTION
  WHEN OTHERS THEN
     raise_application_error(-20001, 'Ocorreu um erro na inserção do departamento');
  END;