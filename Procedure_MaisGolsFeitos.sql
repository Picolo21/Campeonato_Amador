USE Campeonato
GO

CREATE OR ALTER PROCEDURE MaisGolsFeitos
AS
BEGIN
    SELECT TOP(1) Apelido AS [Time], Gols_Marcados AS [Gols Marcados]
    FROM [Time]
    ORDER BY Gols_Marcados DESC
END
GO