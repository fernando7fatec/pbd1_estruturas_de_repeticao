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
 RAISE NOTICE 'Basic LOOP';
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


DO
$$
DECLARE

BEGIN

END;
$$

