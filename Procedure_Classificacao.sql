USE Campeonato
GO

CREATE OR ALTER PROCEDURE Classificacao
AS
BEGIN
    SELECT TOP(5) Apelido AS [Time], Pontos AS [Pontuação], Vitorias, Saldo_Gols AS [Saldo de Gols]
    FROM [Time]
    ORDER BY Pontos DESC, Vitorias DESC, Saldo_Gols DESC
END
GO