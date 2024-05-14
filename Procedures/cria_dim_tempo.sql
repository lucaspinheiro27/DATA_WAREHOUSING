-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2024-05-07 09:35:34 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g


CREATE TABLE dim_db_tempo (
    sk_tempo           NUMBER NOT NULL,
    dt_evento          DATE NOT NULL,
    nr_dia             NUMBER(2) NOT NULL,
    nr_mes             NUMBER(2) NOT NULL,
    nr_ano             NUMBER(4) NOT NULL,
    nr_hora            NUMBER(2) NOT NULL,
    nr_minuto          NUMBER(2) NOT NULL,
    nr_dia_semana      NUMBER(1) NOT NULL,
    nm_dia_semana      VARCHAR2(20) NOT NULL,
    st_feriado         CHAR(3) NOT NULL,
    st_vespera_feriado CHAR(3) NOT NULL,
    st_final_semana    CHAR(3) NOT NULL
);

COMMENT ON COLUMN dim_db_tempo.sk_tempo IS
    'Surrogate Key da dimensãoTempo. Esse valor será preenchido automaticamente pela carga ETL.';

COMMENT ON COLUMN dim_db_tempo.dt_evento IS
    'Esse atributo irá receber a data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.';

COMMENT ON COLUMN dim_db_tempo.nr_dia IS
    'Esse atributo irá receber o dia da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.';

COMMENT ON COLUMN dim_db_tempo.nr_mes IS
    'Esse atributo irá receber o mês  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.'
    ;

COMMENT ON COLUMN dim_db_tempo.nr_ano IS
    'Esse atributo irá receber o ano  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.'
    ;

COMMENT ON COLUMN dim_db_tempo.nr_hora IS
    'Esse atributo irá receber a hora  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.'
    ;

COMMENT ON COLUMN dim_db_tempo.nr_minuto IS
    'Esse atributo irá receber o minuto  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL.'
    ;

COMMENT ON COLUMN dim_db_tempo.nr_dia_semana IS
    'Esse atributo irá receber o numero do dia da semana  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL. Dia 1 (domingo); Dia 2 (segunda-feira)... Dia 7 (sábado).'
    ;

COMMENT ON COLUMN dim_db_tempo.nm_dia_semana IS
    'Esse atributo irá receber o nome do dia da semana  da data em que ocorreu o evento. Esse valor será preenchido automaticamente pelo processo ETL. Dia 1 (domingo); Dia 2 (segunda-feira)... Dia 7 (sábado).'
    ;

COMMENT ON COLUMN dim_db_tempo.st_feriado IS
    'Esse atributo irá receber o status referente a data do evento. Se essa data for um feriado nacional, colocar o conteúdo SIM. Se a data não for um feriado, colocar o conteúdo NÃO.'
    ;

COMMENT ON COLUMN dim_db_tempo.st_vespera_feriado IS
    'Esse atributo irá receber o status referente a data do evento. Se essa data for uma        véspera de feriado nacional, colocar o conteúdo SIM. Se a data não for uma véspera de  feriado, colocar o conteúdo NÃO.'
    ;

COMMENT ON COLUMN dim_db_tempo.st_final_semana IS
    'Esse atributo irá receber o status referente a data do evento. Se essa data for um final de semana, colocar o conteúdo SIM. Se a data não for final de semana, colocar o conteúdo NÃO.'
    ;

ALTER TABLE dim_db_tempo ADD CONSTRAINT pk_dim_db_tempo PRIMARY KEY ( sk_tempo );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             1
-- CREATE INDEX                             0
-- ALTER TABLE                              1
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
