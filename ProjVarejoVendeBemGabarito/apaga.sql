-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2024-08-06 10:38:07 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE dim_bairro CASCADE CONSTRAINTS;

DROP TABLE dim_cidade CASCADE CONSTRAINTS;

DROP TABLE dim_cliente CASCADE CONSTRAINTS;

DROP TABLE dim_cliente_logr CASCADE CONSTRAINTS;

DROP TABLE dim_estado CASCADE CONSTRAINTS;

DROP TABLE dim_logradouro CASCADE CONSTRAINTS;

DROP TABLE dim_loja CASCADE CONSTRAINTS;

DROP TABLE dim_produto CASCADE CONSTRAINTS;

DROP TABLE dim_promocao CASCADE CONSTRAINTS;

DROP TABLE dim_tempo CASCADE CONSTRAINTS;

DROP TABLE dim_vendedor CASCADE CONSTRAINTS;

DROP TABLE fto_venda CASCADE CONSTRAINTS;

-- predefined type, no DDL - SDO_GEOMETRYv2

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dim_bairro (
    sk_bairro NUMBER NOT NULL,
    sk_cidade NUMBER NOT NULL,
    nm_bairro VARCHAR2(40) NOT NULL
)
LOGGING;

COMMENT ON COLUMN dim_bairro.sk_bairro IS
    'Esta � a Surrogate Key da Dimens�o Estado do Pa�s. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_bairro.nm_bairro IS
    'Este atributo ir� receber o nome do Estado. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

ALTER TABLE dim_bairro ADD CONSTRAINT sk_dim_bairro PRIMARY KEY ( sk_bairro );

CREATE TABLE dim_cidade (
    sk_cidade      NUMBER NOT NULL,
    sk_estado      NUMBER NOT NULL,
    nm_cidade      VARCHAR2(40) NOT NULL,
    nr_codigo_ibge NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN dim_cidade.sk_cidade IS
    'Esta � a Surrogate Key da Dimens�o Estado do Pa�s. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_cidade.nm_cidade IS
    'Este atributo ir� receber o nome do Estado. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

COMMENT ON COLUMN dim_cidade.nr_codigo_ibge IS
    'Este atributo ir� receber o codigo do IBGE. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

ALTER TABLE dim_cidade ADD CONSTRAINT sk_dim_cidade PRIMARY KEY ( sk_cidade );

CREATE TABLE dim_cliente (
    sk_cliente      NUMBER NOT NULL,
    nm_cliente      VARCHAR2(90) NOT NULL,
    ds_estado_civil VARCHAR2(35) NOT NULL,
    ds_escolaridade VARCHAR2(35) NOT NULL,
    dt_nascimento   DATE
)
LOGGING;

COMMENT ON COLUMN dim_cliente.sk_cliente IS
    'Esta � a Surrogate Key da Dimens�o Cliente. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_cliente.nm_cliente IS
    'Este atributo ir� receber o nome do cliente. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

COMMENT ON COLUMN dim_cliente.ds_estado_civil IS
    'Este atributo ir� receber o Estado Civil do cliente. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

COMMENT ON COLUMN dim_cliente.ds_escolaridade IS
    'Este atributo ir� receber a Escolaridade do cliente. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

COMMENT ON COLUMN dim_cliente.dt_nascimento IS
    'Esta � a data de nascimento do cliente.. Seu conte�do deve ser obrigat�rio e do tipo data.';

ALTER TABLE dim_cliente ADD CONSTRAINT sk_dim_cliente PRIMARY KEY ( sk_cliente );

CREATE TABLE dim_cliente_logr (
    sk_cliente_logr NUMBER NOT NULL,
    sk_cliente      NUMBER NOT NULL,
    sk_logradouro   NUMBER NOT NULL,
    dt_inicio       DATE NOT NULL,
    dt_fim          NUMBER(8)
)
LOGGING;

COMMENT ON COLUMN dim_cliente_logr.sk_cliente_logr IS
    'Esta � a Surrogate Key da Dimens�o Estado do Pa�s. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_cliente_logr.dt_inicio IS
    'Este atributo ir� receber o nome do Estado. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

ALTER TABLE dim_cliente_logr ADD CONSTRAINT sk_dim_cliente_logr PRIMARY KEY ( sk_cliente_logr );

CREATE TABLE dim_estado (
    sk_estado NUMBER NOT NULL,
    nm_estado VARCHAR2(40) NOT NULL,
    sg_estado CHAR(2) NOT NULL
)
LOGGING;

COMMENT ON COLUMN dim_estado.sk_estado IS
    'Esta � a Surrogate Key da Dimens�o Estado do Pa�s. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_estado.nm_estado IS
    'Este atributo ir� receber o nome do Estado. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

COMMENT ON COLUMN dim_estado.sg_estado IS
    'Este atributo ir� receber o codigo do IBGE. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

ALTER TABLE dim_estado ADD CONSTRAINT sk_dim_estado PRIMARY KEY ( sk_estado );

CREATE TABLE dim_logradouro (
    sk_logradouro NUMBER NOT NULL,
    nm_logradouro VARCHAR2(90) NOT NULL,
    nr_cep        NUMBER(8),
    sk_bairro     NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN dim_logradouro.sk_logradouro IS
    'Esta � a Surrogate Key da Dimens�o Estado do Pa�s. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_logradouro.nm_logradouro IS
    'Este atributo ir� receber o nome do Estado. Seu conte�do deve ser obrigat�rio e do tipo caractere.';

ALTER TABLE dim_logradouro ADD CONSTRAINT sk_dim_logradouro PRIMARY KEY ( sk_logradouro );

CREATE TABLE dim_loja (
    sk_loja   NUMBER NOT NULL,
    cd_loja   NUMBER NOT NULL,
    nm_loja   VARCHAR2(35) NOT NULL,
    nm_estado NUMBER(25) NOT NULL,
    nm_cidade VARCHAR2(10) NOT NULL,
    nm_bairro VARCHAR2(35) NOT NULL
)
LOGGING;

COMMENT ON COLUMN dim_loja.sk_loja IS
    'Esta � a Surrogate Key da Dimens�o Loja. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_loja.cd_loja IS
    'Esta � c�digo do Loja da Dimens�o Loja.. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_loja.nm_loja IS
    'Esta � nome da loja da Dimens�o Loja. Seu conte�do deve ser obrigat�rio e do tipo string.';

COMMENT ON COLUMN dim_loja.nm_estado IS
    'Esta � nome do Estado da loja . Seu conte�do deve ser obrigat�rio e do tipo string..';

COMMENT ON COLUMN dim_loja.nm_cidade IS
    'Esta � nome do Estado da loja . Seu conte�do deve ser obrigat�rio e do tipo string.';

COMMENT ON COLUMN dim_loja.nm_bairro IS
    'Esta � nome do Bairro da loja . Seu conte�do deve ser obrigat�rio e do tipo string.';

ALTER TABLE dim_loja ADD CONSTRAINT dim_loja_pk PRIMARY KEY ( sk_loja );

CREATE TABLE dim_produto (
    sk_produto       NUMBER NOT NULL,
    cd_produto       NUMBER(8) NOT NULL,
    nm_produto       VARCHAR2(45) NOT NULL,
    nr_codigo_barras NUMBER(15) NOT NULL,
    ds_embalagem     VARCHAR2(30)
)
LOGGING;

COMMENT ON COLUMN dim_produto.sk_produto IS
    'Esta � a Surrogate Key da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_produto.cd_produto IS
    'Esta � c�digo do produto da Dimens�o Produto. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_produto.nm_produto IS
    'Esta � nome do produto da Dimens�o Produto. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_produto.nr_codigo_barras IS
    'Esta � n�mero do codigo de barras da Dimens�o Produto. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_produto.ds_embalagem IS
    'As poss�veis embalagens s�o: Caixa, Unidade e Fardo.';

ALTER TABLE dim_produto ADD CONSTRAINT dim_produto_pk PRIMARY KEY ( sk_produto );

CREATE TABLE dim_promocao (
    sk_promocao NUMBER NOT NULL,
    cd_promocao NUMBER NOT NULL,
    nm_promocao VARCHAR2(35) NOT NULL,
    dt_inicio   DATE NOT NULL,
    dt_termino  DATE
)
LOGGING;

COMMENT ON COLUMN dim_promocao.sk_promocao IS
    'Esta � a Surrogate Key da Dimens�o Promo��o. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_promocao.cd_promocao IS
    'Esta � c�digo da promocao da Dimens�o promocao.. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_promocao.nm_promocao IS
    'Esta � nome  da promocao da Dimens�o promocao.. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_promocao.dt_inicio IS
    'Esta � a data de inicio  da promocao da Dimens�o promocao.. Seu conte�do deve ser obrigat�rio e do tipo data.';

COMMENT ON COLUMN dim_promocao.dt_termino IS
    'Esta � a data de inicio  da promocao da Dimens�o promocao.. Seu conte�do deve ser obrigat�rio e do tipo data.';

ALTER TABLE dim_promocao ADD CONSTRAINT sk_dim_promocao PRIMARY KEY ( sk_promocao );

CREATE TABLE dim_tempo (
    sk_tempo              NUMBER NOT NULL,
    dt_data               DATE NOT NULL,
    nr_dia                NUMBER NOT NULL,
    nm_dia_semana_extenso VARCHAR2(18) NOT NULL,
    nm_mes                VARCHAR2(15) NOT NULL,
    nr_ano                NUMBER(4) NOT NULL,
    nr_quinzena           NUMBER(1) NOT NULL,
    nr_trimestre          NUMBER(1) NOT NULL,
    nr_semestre           NUMBER(1) NOT NULL,
    nm_feriado            VARCHAR2(30)
)
LOGGING;

COMMENT ON COLUMN dim_tempo.sk_tempo IS
    'Esta � a Surrogate Key da Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_tempo.dt_data IS
    'Esse atributo ir� receber informa��es sobre a data, contendo dia mes ano hora minuto e segundo. Atributo obrigat�rio.';

COMMENT ON COLUMN dim_tempo.nr_dia IS
    'Este dado representa o dia da semana que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico.'
    ;

COMMENT ON COLUMN dim_tempo.nm_dia_semana_extenso IS
    'Este dado representa o dia por extenso da semana que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo string.'
    ;

COMMENT ON COLUMN dim_tempo.nm_mes IS
    'Este dado representa o mes por extenso da semana que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo string.'
    ;

COMMENT ON COLUMN dim_tempo.nr_ano IS
    'Este dado representa o ano que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico. ';

COMMENT ON COLUMN dim_tempo.nr_quinzena IS
    'Este dado representa o n�mero da quinzena que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico. Poss�veis valores: 1 e 2.'
    ;

COMMENT ON COLUMN dim_tempo.nr_trimestre IS
    'Este dado representa o n�mero do trimestre que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico. Poss�veis valores: 1,2,3 e 4 trimestre.'
    ;

COMMENT ON COLUMN dim_tempo.nr_semestre IS
    'Este dado representa o n�mero do semestre que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico. Poss�veis valores: 1 e 2.'
    ;

COMMENT ON COLUMN dim_tempo.nm_feriado IS
    'Este dado representa o nome do feriado que ocorreu o evento na Dimens�o Tempo. Seu conte�do deve ser opcional e do tipo string. '
    ;

ALTER TABLE dim_tempo ADD CONSTRAINT sk_dim_tempo PRIMARY KEY ( sk_tempo );

CREATE TABLE dim_vendedor (
    sk_vendedor NUMBER NOT NULL,
    cd_vendedor NUMBER NOT NULL,
    nm_vendedor VARCHAR2(35) NOT NULL,
    nr_cpf      NUMBER(12) NOT NULL,
    ds_sexo     VARCHAR2(10)
)
LOGGING;

COMMENT ON COLUMN dim_vendedor.sk_vendedor IS
    'Esta � a Surrogate Key da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_vendedor.cd_vendedor IS
    'Esta � c�digo do vendedor da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_vendedor.nm_vendedor IS
    'Esta � nome do vendedor da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo string.';

COMMENT ON COLUMN dim_vendedor.nr_cpf IS
    'Esta � numero do CPF do vendedor da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN dim_vendedor.ds_sexo IS
    'Os tipos de sexo poss�veis s�o: Feminino, Masculino e Hermafrodita.';

ALTER TABLE dim_vendedor ADD CONSTRAINT dim_vendedor_pk PRIMARY KEY ( sk_vendedor );

CREATE TABLE fto_venda (
    sk_vendedor     NUMBER NOT NULL,
    sk_tempo        NUMBER NOT NULL,
    sk_produto      NUMBER NOT NULL,
    sk_promocao     NUMBER NOT NULL,
    sk_loja         NUMBER NOT NULL,
    sk_cliente_logr NUMBER NOT NULL,
    nr_qtde_veda    NUMBER(8, 2) NOT NULL,
    vl_unit_vda     NUMBER(8, 2) NOT NULL,
    vl_tot_vda      NUMBER(12, 2) NOT NULL
)
LOGGING;

COMMENT ON COLUMN fto_venda.sk_vendedor IS
    'Esta � a Surrogate Key da Dimens�o Vendedor. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN fto_venda.sk_tempo IS
    'Esta � a Surrogate Key da Dimens�o Tempo. Seu conte�do deve ser obrigat�rio e do tipo num�rico.';

COMMENT ON COLUMN fto_venda.nr_qtde_veda IS
    'Este dado representa a quantidade de venda realizada. Seu conte�do deve ser obrigat�rio e do tipo num�rico com 2 casas decimais.'
    ;

COMMENT ON COLUMN fto_venda.vl_unit_vda IS
    'Este dado representa a o valor unitario da venda realizada. Seu conte�do deve ser obrigat�rio e do tipo num�rico com 2 casas decimais.'
    ;

ALTER TABLE fto_venda
    ADD CONSTRAINT fto_venda_pk PRIMARY KEY ( sk_vendedor,
                                              sk_tempo,
                                              sk_produto,
                                              sk_promocao,
                                              sk_loja );

ALTER TABLE dim_logradouro
    ADD CONSTRAINT fk_bairro_logr FOREIGN KEY ( sk_bairro )
        REFERENCES dim_bairro ( sk_bairro )
    NOT DEFERRABLE;

ALTER TABLE dim_cliente_logr
    ADD CONSTRAINT fk_cliente_logr FOREIGN KEY ( sk_cliente )
        REFERENCES dim_cliente ( sk_cliente )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT fk_cliente_logr_venda FOREIGN KEY ( sk_cliente_logr )
        REFERENCES dim_cliente_logr ( sk_cliente_logr )
    NOT DEFERRABLE;

ALTER TABLE dim_bairro
    ADD CONSTRAINT fk_dim_cidade_bairro FOREIGN KEY ( sk_cidade )
        REFERENCES dim_cidade ( sk_cidade )
    NOT DEFERRABLE;

ALTER TABLE dim_cidade
    ADD CONSTRAINT fk_dim_estado_cidade FOREIGN KEY ( sk_estado )
        REFERENCES dim_estado ( sk_estado )
    NOT DEFERRABLE;

ALTER TABLE dim_cliente_logr
    ADD CONSTRAINT fk_logr_cliente FOREIGN KEY ( sk_logradouro )
        REFERENCES dim_logradouro ( sk_logradouro )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT produto_fk FOREIGN KEY ( sk_produto )
        REFERENCES dim_produto ( sk_produto )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT rel_loja_vda FOREIGN KEY ( sk_loja )
        REFERENCES dim_loja ( sk_loja )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT rel_prom_vda FOREIGN KEY ( sk_promocao )
        REFERENCES dim_promocao ( sk_promocao )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT tempo_fk FOREIGN KEY ( sk_tempo )
        REFERENCES dim_tempo ( sk_tempo )
    NOT DEFERRABLE;

ALTER TABLE fto_venda
    ADD CONSTRAINT vendedor_fk FOREIGN KEY ( sk_vendedor )
        REFERENCES dim_vendedor ( sk_vendedor )
    NOT DEFERRABLE;



-- Relat�rio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
