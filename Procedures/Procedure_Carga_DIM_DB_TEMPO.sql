
-- Acesso aos dados da tabela de Tempo
SELECT * FROM DIM_DB_TEMPO;

-- Setup inicial do Oracle SQLDeveloper
SET SERVEROUTPUT ON SIZE 1000000
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

-- Bloco Oracle PL/SQL
DECLARE
V_REG_DIM_DB_TEMPO DIM_DB_TEMPO%ROWTYPE;
V_DATA_INICIO 	DATE := TO_DATE('01/01/2000', 'DD/MM/YYYY');
V_DATA_FIM 		DATE := TO_DATE('31/12/2026', 'DD/MM/YYYY');
BEGIN

	V_REG_DIM_DB_TEMPO.SK_TEMPO  := 1;
	V_REG_DIM_DB_TEMPO.DT_EVENTO := SYSDATE;
	V_REG_DIM_DB_TEMPO.NR_DIA    := 14;
	V_REG_DIM_DB_TEMPO.NR_MES    := 05;
	V_REG_DIM_DB_TEMPO.NR_ANO    := 2024;
	V_REG_DIM_DB_TEMPO.NR_HORA   := 08;
	V_REG_DIM_DB_TEMPO.NR_MINUTO := 22;
	V_REG_DIM_DB_TEMPO.NR_DIA_SEMANA    := 3; 			-- 3a. feira é o dia da semana número 3
	V_REG_DIM_DB_TEMPO.NM_DIA_SEMANA    := '3a. feira';  -- 3a. feira é o dia da semana número 3
	V_REG_DIM_DB_TEMPO.ST_FERIADO    := 'NAO';
	V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO := 'NAO';
	V_REG_DIM_DB_TEMPO.ST_FINAL_SEMANA := 'NAO';
 	-- DBMS_OUTPUT.PUT_LINE('VARIAVEL DT_EVENTO ' || V_REG_DIM_DB_TEMPO.DT_EVENTO );
	--INSERT INTO DIM_DB_TEMPO VALUES V_REG_DIM_DB_TEMPO;
END;

-- Criar codigo fonte para o nosso LOOP, relativo ao periodo de data de 2000 a 2026
SELECT * FROM PF0110.T_FERIADO ORDER BY 1;

-- Bloco anônimo (não tem nome) criado com sucesso
DECLARE
V_REG_DIM_DB_TEMPO DIM_DB_TEMPO%ROWTYPE;
V_DATA_INICIO 	DATE := TO_DATE('01/01/2000', 'DD/MM/YYYY');
V_DATA_FIM 		DATE := TO_DATE('31/12/2026', 'DD/MM/YYYY');
BEGIN
    WHILE V_DATA_INICIO <= V_DATA_FIM 
    LOOP
		-- Código Ok
		V_REG_DIM_DB_TEMPO.SK_TEMPO  := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'YYYYMMDDHH24MISS'));
		V_REG_DIM_DB_TEMPO.DT_EVENTO := V_DATA_INICIO;
        V_REG_DIM_DB_TEMPO.NR_DIA    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'DD'));
        V_REG_DIM_DB_TEMPO.NR_MES    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'MM'));
        V_REG_DIM_DB_TEMPO.NR_ANO    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'YYYY'));
        V_REG_DIM_DB_TEMPO.NR_HORA   := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'HH24'));
        V_REG_DIM_DB_TEMPO.NR_MINUTO := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'MI'));
        V_REG_DIM_DB_TEMPO.NR_DIA_SEMANA    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'D')); 			-- 3a. feira é o dia da semana número 3
        V_REG_DIM_DB_TEMPO.NM_DIA_SEMANA    := TO_CHAR(V_DATA_INICIO,'DAY');  -- 3a. feira é o dia da semana número 3
	
        BEGIN
            SELECT 'SIM' 
            INTO V_REG_DIM_DB_TEMPO.ST_FERIADO
            FROM PF0110.T_FERIADO
            WHERE DT = V_DATA_INICIO;            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_REG_DIM_DB_TEMPO.ST_FERIADO := 'NAO';
        END;
    
        IF V_REG_DIM_DB_TEMPO.ST_FERIADO = 'NAO' THEN
           -- Verificar se é vespera de feriado 
            BEGIN
                SELECT 'SIM' 
                INTO V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO
                FROM PF0110.T_FERIADO
                WHERE DT = V_DATA_INICIO+1;  -- Amanhã será feriado?          
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO := 'NAO';
            END;
        ELSE
               V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO   := 'NAO';   
        END IF;
    
        IF TO_NUMBER( TO_CHAR(V_DATA_INICIO,'D')) IN (1,7) THEN
            V_REG_DIM_DB_TEMPO.ST_FINAL_SEMANA      := 'SIM';
        ELSE
            V_REG_DIM_DB_TEMPO.ST_FINAL_SEMANA      := 'NAO';
        END IF;
 	-- DBMS_OUTPUT.PUT_LINE('VARIAVEL DT_EVENTO ' || V_REG_DIM_DB_TEMPO.DT_EVENTO );
	INSERT INTO DIM_DB_TEMPO VALUES V_REG_DIM_DB_TEMPO;
	--###
    --  DBMS_OUTPUT.PUT_LINE('V_DATA_INICIO: ' || V_DATA_INICIO ||
    --  'V_DATA_FIM: ' || V_DATA_FIM );
      
      V_DATA_INICIO := V_DATA_INICIO + 1;
    
    END LOOP;
END;
select * from dim_db_tempo order by 1;
select COUNT(*) from dim_db_tempo order by 1;
ROLLBACK;


-- CRIANDO A PROCEDURE
CREATE OR REPLACE PROCEDURE PRC_CARGA_DIM_DB_TEMPO AS
V_REG_DIM_DB_TEMPO DIM_DB_TEMPO%ROWTYPE;
V_DATA_INICIO 	DATE := TO_DATE('01/01/2000', 'DD/MM/YYYY');
V_DATA_FIM 		DATE := TO_DATE('31/12/2026', 'DD/MM/YYYY');
BEGIN
    WHILE V_DATA_INICIO <= V_DATA_FIM 
    LOOP
		-- Código Ok
		V_REG_DIM_DB_TEMPO.SK_TEMPO  := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'YYYYMMDDHH24MISS'));
		V_REG_DIM_DB_TEMPO.DT_EVENTO := V_DATA_INICIO;
        V_REG_DIM_DB_TEMPO.NR_DIA    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'DD'));
        V_REG_DIM_DB_TEMPO.NR_MES    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'MM'));
        V_REG_DIM_DB_TEMPO.NR_ANO    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'YYYY'));
        V_REG_DIM_DB_TEMPO.NR_HORA   := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'HH24'));
        V_REG_DIM_DB_TEMPO.NR_MINUTO := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'MI'));
        V_REG_DIM_DB_TEMPO.NR_DIA_SEMANA    := TO_NUMBER( TO_CHAR(V_DATA_INICIO,'D')); 			-- 3a. feira é o dia da semana número 3
        V_REG_DIM_DB_TEMPO.NM_DIA_SEMANA    := TO_CHAR(V_DATA_INICIO,'DAY');  -- 3a. feira é o dia da semana número 3
	
        BEGIN
            SELECT 'SIM' 
            INTO V_REG_DIM_DB_TEMPO.ST_FERIADO
            FROM PF0110.T_FERIADO
            WHERE DT = V_DATA_INICIO;            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_REG_DIM_DB_TEMPO.ST_FERIADO := 'NAO';
        END;
    
        IF V_REG_DIM_DB_TEMPO.ST_FERIADO = 'NAO' THEN
           -- Verificar se é vespera de feriado 
            BEGIN
                SELECT 'SIM' 
                INTO V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO
                FROM PF0110.T_FERIADO
                WHERE DT = V_DATA_INICIO+1;  -- Amanhã será feriado?          
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO := 'NAO';
            END;
        ELSE
               V_REG_DIM_DB_TEMPO.ST_VESPERA_FERIADO   := 'NAO';   
        END IF;
    
        IF TO_NUMBER( TO_CHAR(V_DATA_INICIO,'D')) IN (1,7) THEN
            V_REG_DIM_DB_TEMPO.ST_FINAL_SEMANA      := 'SIM';
        ELSE
            V_REG_DIM_DB_TEMPO.ST_FINAL_SEMANA      := 'NAO';
        END IF;
 	-- DBMS_OUTPUT.PUT_LINE('VARIAVEL DT_EVENTO ' || V_REG_DIM_DB_TEMPO.DT_EVENTO );
	INSERT INTO DIM_DB_TEMPO VALUES V_REG_DIM_DB_TEMPO;
	--###
    --  DBMS_OUTPUT.PUT_LINE('V_DATA_INICIO: ' || V_DATA_INICIO ||
    --  'V_DATA_FIM: ' || V_DATA_FIM );
      
      V_DATA_INICIO := V_DATA_INICIO + 1;
    
    END LOOP;
	-- Por fim, confirmamos as transações abertas
	COMMIT;
END;
/

DELETE FROM DIM_DB_TEMPO;

EXECUTE PRC_CARGA_DIM_DB_TEMPO;

select * from dim_db_tempo order by 1;
select COUNT(*) from dim_db_tempo order by 1;

