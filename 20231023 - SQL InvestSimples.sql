-- Comandos de Drop Table --

--DROP TABLE T_CLIENTE CASCADE CONSTRAINTS;
--DROP TABLE T_ENTRADAS CASCADE CONSTRAINTS;


-- Comandos de Drop SEQUENCE --

--DROP SEQUENCE SQ_CLIENTES;
--DROP SEQUENCE SQ_ENTRADAS;


/* ESTE SCRIPT CONTÉM A CRIAÇÃO DAS TABELAS, INSERÇÃO DE DADOS E CONSULTAS, CONFORME SOLICITADO NO EXERCÿCIO */


--criando os Script de sequências das tabelas

CREATE SEQUENCE SQ_CLIENTES INCREMENT BY 1 MAXVALUE 999999 MINVALUE 1 CACHE 20;
CREATE SEQUENCE SQ_ENTRADAS INCREMENT BY 1 MAXVALUE 999999 MINVALUE 1 CACHE 20;



-- Comandos da tabela Cliente --

-- Criação da tabela T_CLIENTE --

CREATE TABLE t_cliente (
    id_cliente          INTEGER NOT NULL,
    nm_nome             VARCHAR2(20) NOT NULL,
    nm_sobrenome        VARCHAR2(60) NOT NULL,
    nm_email            VARCHAR2(50) NOT NULL,
    nr_cpf              VARCHAR2(15) NOT NULL,
    dt_nascimento       DATE,
    cd_cep              VARCHAR2(10) NOT NULL,
    nr_endereco         VARCHAR2(10),
    nm_complem_endereco VARCHAR2(30)
);

ALTER TABLE t_cliente ADD CONSTRAINT t_cliente_pk PRIMARY KEY ( id_cliente );

-- Cadastrar os dados do usuário --

INSERT INTO T_CLIENTE (id_cliente, nm_nome, nm_sobrenome, nm_email, nr_cpf, dt_nascimento, cd_cep, nr_endereco, nm_complem_endereco) 
VALUES (SQ_CLIENTES.nextval, 'nm_nome', 'nm_sobrenome', 'nm_email', 'nr_cpf','01-JAN-1990', 'cd_cep', 'nr_ender', 'nm_complem_endereco');

INSERT INTO T_CLIENTE (id_cliente, nm_nome, nm_sobrenome, nm_email, nr_cpf, dt_nascimento, cd_cep, nr_endereco, nm_complem_endereco) 
VALUES (SQ_CLIENTES.nextval, 'Juarez', 'Garcia', 'juarez.garcia@gmail.com', '333.333.333-33','28-MAY-1985', '32132-321', '575', '');

SELECT * FROM T_CLIENTE;

-- Alterar todos os dados do usuario, utilizando seu codigo como referencia. --

UPDATE T_CLIENTE SET 	nm_nome = 'nm_nome',
						nm_sobrenome = 'nm_sobrenome',
						nm_email = 'nm_email',
						nr_cpf = 'nr_cpf',
                        dt_nascimento = '01-JAN-1990',
						cd_cep = 'cd_cep',
						nr_endereco = 'nr_endereco',
						nm_complem_endereco = 'nm_complem_endereco'
						
WHERE id_cliente = 1;

--DELETE FROM T_CLIENTE WHERE id_cliente = 1;


SELECT * FROM T_CLIENTE;

SELECT * FROM T_CLIENTE WHERE id_cliente = '1';
						

-- Criação da tabela T_ENTRADAS --

CREATE TABLE t_entradas (
    id_entrada              INTEGER NOT NULL,
    dt_entrada              DATE,
    nr_valor_entrada        NUMBER(10,2) NOT NULL,
    nm_tipo_entrada         VARCHAR2(40),
    nm_desc_entrada         VARCHAR2(100),
    t_cliente_id_cliente    INTEGER NOT NULL
);

ALTER TABLE t_entradas ADD CONSTRAINT t_entradas_pk PRIMARY KEY ( id_entrada );

ALTER TABLE t_entradas
    ADD CONSTRAINT t_entradas_t_cliente_fk FOREIGN KEY ( t_cliente_id_cliente )
        REFERENCES t_cliente ( id_cliente );



-- Cadastrar as receitas do usuário. --

INSERT INTO T_ENTRADAS (id_entrada, dt_entrada, nr_valor_entrada, nm_tipo_entrada, nm_desc_entrada, t_cliente_id_cliente)
    VALUES (SQ_ENTRADAS.nextval, '13-OCT-23', 150.0, 'Receita', 'Entrada de Receita', 1);
    
SELECT * FROM T_ENTRADAS ORDER BY id_entrada;
--DELETE FROM T_ENTRADAS WHERE id_entrada = 10;
-- Alterar todos os dados das receitas do usuário, utilizando o código como referência. --

UPDATE T_ENTRADAS SET	dt_entrada = '01-JAN-1990',
						nr_valor_entrada = 200,
						nm_tipo_entrada = 'nm_tipo_entrada',
						nm_desc_entrada = 'nm_desc_entrada'
						
WHERE id_entrada = 1;

SELECT * FROM T_ENTRADAS WHERE id_entrada = 1;

