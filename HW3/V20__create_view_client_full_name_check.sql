CREATE VIEW client_full_name_check
AS SELECT * from client
WHERE full_name = 'Shagiakhmetova Zukhra Midkhatovna'
WITH LOCAL CHECK OPTION;