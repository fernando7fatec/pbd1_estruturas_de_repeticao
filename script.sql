
-- ************
-- 1.1 
-- Resolva 
-- https://www.beecrowd.com.br/judge/pt/problems/view/1059
-- Prints even numbers btw 1and100
-- ************
DO 
$$ 
DECLARE
 counter INT := 0;
 evenNumber INT := 0;
BEGIN
 LOOP
  SELECT MOD(counter,2) INTO evenNumber;
  IF evenNumber = 0 THEN
   RAISE NOTICE '%',counter;
  END IF;
  counter := counter + 1;
  EXIT WHEN counter = 101;
 END LOOP;
END;
$$