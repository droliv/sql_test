CREATE TABLE departamento(
    cd_departamento NUMBER(10),
    nome_responsavel VARCHAR2(50) NOT NULL,
    login_responsavel VARCHAR2(50) NOT NULL,
    email_responsavel VARCHAR2(50) NOT NULL,
    PRIMARY KEY(cd_departamento)
);