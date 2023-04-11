USE Campeonato
GO

CREATE OR ALTER PROCEDURE MaisGolsSofridos
AS
BEGIN
    SELECT TOP(1) Apelido AS [Time], Gols_Sofridos AS [Gols Sofridos]
    FROM [Time]
    ORDER BY Gols_Sofridos DESC
END
GO