-- Remove existing data
DELETE FROM dbo.t_hello_world
WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world (my_message)
VALUES('Hello World2'), ('Hello World3');

-- Check to see if it works
SELECT t. *
FROM dbo.t_hello_world;

-- Try to test the trigger
UPDATE dbo.t_hello_world
SET my_message = 'Hello World4'
WHERE my_message = 'Hello World3';

-- Check if the trigger works
SELECT * 
FROM dbo.t_hello_world AS t;