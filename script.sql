-- ***********************
-- 1.1 
-- Resolva 
-- https://www.beecrowd.com.br/judge/pt/problems/view/1059
-- Prints even numbers btw 1and100
-- ***********************

-- ### 1.1 BEGINS ### ---

-- LOOP
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




-- ### 1.1 ENDS ### ---

