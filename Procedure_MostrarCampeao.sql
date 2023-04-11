USE Campeonato
GO

CREATE OR ALTER PROCEDURE MostrarCampeao
AS
BEGIN
    SELECT TOP(1) Apelido AS [Time], Pontos AS [Pontuação], Vitorias, Saldo_Gols AS [Saldo de Gols]
    FROM [Time]
    ORDER BY Pontos DESC, Vitorias DESC, Saldo_Gols DESC
END
GO