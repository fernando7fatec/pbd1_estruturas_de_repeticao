-- ***********************
-- ToolBox 
-- A function that generates
-- random numbers
-- ***********************
CREATE OR REPLACE FUNCTION valor_aleatorio_entre(lim_inferior INT, lim_superior INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT; END;
$$ LANGUAGE plpgsql;


-- ***********************
-- 1.1 
-- Resolva 
-- https://www.beecrowd.com.br/judge/pt/problems/view/1059
-- Prints even numbers btw 1and100
-- ***********************

-- ### 1.1 BEGINS ### ---

-- Vanilla LOOP
DO 
$$ 
DECLARE
 counter INT := 0;
 evenNumber INT := 0;
BEGIN
 LOOP
  -- pick the remainder using MOD() func.
  SELECT MOD(counter,2) INTO evenNumber; 
  -- if the remainder is 0, then, even# it is!
  IF evenNumber = 0 THEN
   RAISE NOTICE '%',counter;
  END IF;
  -- add 1 to counter
  counter := counter + 1;
  -- exit when 100 is reached.
  EXIT WHEN counter = 101;
 END LOOP;
END;
$$

-- WHILE LOOP
DO 
$$ 
DECLARE
 counter INT := 0;
 evenNumber INT := 0;
BEGIN
 -- WHILE LOOP
 WHILE counter <= 100 LOOP
  -- pick the remainder using MOD() func.
  SELECT MOD(counter,2) INTO evenNumber; 
  -- if the remainder is 0, then, even# it is!
  IF evenNumber = 0 THEN
   RAISE NOTICE '%',counter;
  END IF;
  -- add 1 to counter
  counter := counter + 1;
  -- exit when 100 is reached.
 END LOOP;
END;
$$

-- FOR LOOP
DO 
$$ 
DECLARE
 counter INT := 0;
 evenNumber INT := 0;
BEGIN
 -- FOR LOOP
 FOR i IN 0..100 LOOP
  -- pick the remainder using MOD() func.
  SELECT MOD(i,2) INTO evenNumber; 
  -- if the remainder is 0, then, even# it is!
  IF evenNumber = 0 THEN
   RAISE NOTICE '%',i;
  END IF;
 END LOOP;
END;
$$

-- FOR EACH LOOP
DO
$$
DECLARE
  numeros_0a100 INT[] := ARRAY[0];
  numero INT;
  evenNumber INT;
BEGIN
  -- Creates an array 
  -- filled 1to100 integers.
  FOR i IN 0..100 LOOP
    numeros_0a100[i] := i;
  END LOOP;
   
  -- Iterate thru. the int array
  FOREACH numero IN ARRAY numeros_0a100 LOOP
    SELECT MOD(numero,2) INTO evenNumber;
	-- Prints if the # is even
    IF evenNumber = 0 THEN
      RAISE NOTICE '%',numeros_0a100[numero];
	END IF;
  END LOOP;
END
$$

-- ****************
-- Read 6 numbers
-- print how many 
-- positive numbers 
-- among them.
-- https://judge.beecrowd.com/en/problems/view/1060
-- ****************
DO
$$
DECLARE 
 num_positivos INT := 0;
 numero INT := 0;
 n INT;
BEGIN
  FOR n IN 1..6 LOOP
   numero = valor_aleatorio_entre(-50,50);
   RAISE NOTICE 'Num aleatorios %',numero;
   IF numero > 0 THEN
     num_positivos = num_positivos + 1;
   END IF;
  END LOOP;
  RAISE NOTICE 'Total de Numeros positivos: %',num_positivos;
END
$$

-- Vanilla LOOP
DO
$$
DECLARE 
 num_positivos INT := 0;
 numero INT := 0;
 contador INT := 0;
BEGIN
  LOOP 
   contador = contador + 1;
   numero = valor_aleatorio_entre(-50,50);
   RAISE NOTICE 'Num aleatorios %',numero;
   IF numero > 0 THEN
     num_positivos = num_positivos + 1;
   END IF;
   EXIT WHEN contador = 6;
  END LOOP;
  RAISE NOTICE 'Total de Numeros positivos: %',num_positivos;
END
$$

-- While LOOP
DO
$$
DECLARE 
 num_positivos INT := 0;
 numero INT := 0;
 contador INT := 0;
BEGIN
  WHILE contador <= 6 LOOP 
   contador = contador + 1;
   numero = valor_aleatorio_entre(-50,50);
   RAISE NOTICE 'Num aleatorios %',numero;
   IF numero > 0 THEN
     num_positivos = num_positivos + 1;
   END IF;
  END LOOP;
  RAISE NOTICE 'Total de Numeros positivos: %',num_positivos;
END
$$

-- ForEach LOOP
DO
$$
DECLARE 
 num_positivos INT := 0;
 numero INT := 0;
 contador INT := 0;
BEGIN
  WHILE contador <= 6 LOOP 
   contador = contador + 1;
   numero = valor_aleatorio_entre(-50,50);
   RAISE NOTICE 'Num aleatorios %',numero;
   IF numero > 0 THEN
     IF numero = 0 THEN
	  numero = valor_aleatorio_entre(-50,50);
	 END IF;
     num_positivos = num_positivos + 1;
   END IF;
  END LOOP;
  RAISE NOTICE 'Total de Numeros positivos: %',num_positivos;
END
$$

-- ****************
-- Prints Integers
-- btw -50 and +50
-- ****************

-- Vanilla LOOP
DO
$$
DECLARE
 counter INT := -51;
BEGIN
 RAISE NOTICE 'Basic LOOP';
 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
  EXIT WHEN counter = 50;
 END LOOP;
END;
$$

-- While LOOP
DO
$$
DECLARE
 counter INT := -51;
BEGIN
 RAISE NOTICE 'While LOOP';
 WHILE counter <= 50 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
 END LOOP;
END;
$$

-- FOR LOOP
DO
$$
DECLARE
 counter INT := -51;
BEGIN
 RAISE NOTICE 'Basic LOOP';
 FOR i IN -50..50 LOOP 
   RAISE NOTICE '%',i;
 END LOOP;
END;
$$

-- FOR EACH LOOP
DO
$$
DECLARE
   numeros_50 INT[] := ARRAY[0];
   numero INT;
   evenNumber INT;
BEGIN
  -- Creates an array 
  -- filled 1to100 integers.
  FOR i IN -50..50 LOOP
    numeros_50[i] := i;
  END LOOP;
   
  -- Iterate thru. the int array
  FOREACH numero IN ARRAY numeros_50 LOOP
	RAISE NOTICE '%',numeros_50[numero];
  END LOOP;
END
$$


-- ****************
-- Prints Integers
-- btw 20 and +50
-- ****************

-- Vanilla LOOP 20to50
DO
$$
DECLARE
 counter INT := 19;
BEGIN
 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
  EXIT WHEN counter = 50;
 END LOOP;
END;
$$

-- While LOOP 20to50
DO
$$
DECLARE
 counter INT := 19;
BEGIN
 WHILE counter <= 50 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
 END LOOP;
END;
$$

-- FOR LOOP 20to50
DO
$$
DECLARE

BEGIN
	FOR i IN 20..50 LOOP
	 RAISE NOTICE '%',i;
	END LOOP;
END
$$

-- FOREACH LOOP 20to50
DO
$$
DECLARE
   numeros_50 INT[] := ARRAY[0];
   numero INT = 19;
   evenNumber INT;
   n INT;
BEGIN
  -- Creates an array 
  FOR i IN 0..30 LOOP
    numeros_50[i] := numero + 1;
	numero = numero + 1;
  END LOOP;
   
  -- Iterate thru. the int array
  FOREACH n IN ARRAY numeros_50 LOOP
	RAISE NOTICE '%',n;
  END LOOP;
END
$$

-- ****************
-- Prints Integers
-- btw 1 and 100
-- ****************

-- Vanilla LOOP 1to100
DO
$$
DECLARE
 counter INT := 0;
BEGIN
 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
  EXIT WHEN counter = 100;
 END LOOP;
END;
$$

-- While LOOP 1to100
DO
$$
DECLARE
 counter INT := 0;
BEGIN
 WHILE counter <= 99 LOOP 
  counter = counter + 1;
  RAISE NOTICE '%',counter;
 END LOOP;
END;
$$

-- FOR LOOP 1to100
DO
$$
DECLARE

BEGIN
	FOR i IN 1..100 LOOP
	 RAISE NOTICE '%',i;
	END LOOP;
END
$$

-- FOREACH LOOP 1to100
DO
$$
DECLARE
   numeros_50 INT[] := ARRAY[0];
   numero INT = 0;
   evenNumber INT;
   n INT;
BEGIN
  -- Creates an array 
  FOR i IN 0..99 LOOP
    numeros_50[i] := numero + 1;
	numero = numero + 1;
  END LOOP;
   
  -- Iterate thru. the int array
  FOREACH n IN ARRAY numeros_50 LOOP
	RAISE NOTICE '%',n;
  END LOOP;
END
$$
-- ### 1.1 ENDS ### ---


-- ### 1.2 BEGINS ### ---

-- 1.2 Faça um programa que calcule o determinante de 
-- uma matriz quadrada de ordem 3 utilizando a regra de Sarrus. Veja a regra aqui:
-- https://en.wikipedia.org/wiki/Rule_of_Sarrus
-- Preencha a matriz com valores inteiros aleatórios
-- no intervalo de 1 a 12.
-- **
-- using the func() that generates 
-- a random numer btw 1and12
-- valor_aleatorio_entre(floor,cealing)
DO $$
DECLARE

    -- multi dimensional
	-- matrix as array
	-- fill it up with random numbers...
    matriz INT[][] := ARRAY[
      [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
      [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
      [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)]
    ];
    -- m will hold the determinated
	-- matrix result
    m INT;
BEGIN
    -- Exibindo a matriz
    RAISE NOTICE 'Matriz: %', matriz;
	
	-- Calculates the determinated using Sarrus rules
    m := matriz[1][1] * matriz[2][2] * matriz[3][3] +
                     matriz[1][2] * matriz[2][3] * matriz[3][1] +
                     matriz[1][3] * matriz[2][1] * matriz[3][2] -
                     (matriz[1][3] * matriz[2][2] * matriz[3][1] +
                      matriz[1][1] * matriz[2][3] * matriz[3][2] +
                      matriz[1][2] * matriz[2][1] * matriz[3][3]);
    RAISE NOTICE 'Determinante: %', m;
END $$;
-- ### 1.2 ENDS ### ---