USE Campeonato
GO

CREATE OR ALTER PROCEDURE JogoComMaisGols
    @Time VARCHAR(100)
AS
BEGIN
    SELECT TOP(1) [Maior Número de Gols Feitos em uma Partida]
    FROM(
        SELECT *, (Gols_Mandante) AS [Maior Número de Gols Feitos em uma Partida]
        FROM Partida
        WHERE Nome_Mandante_Time = @Time
        UNION
        SELECT *, (Gols_Visitante) AS [Gols do Time @Time]
        FROM Partida
        WHERE Nome_Visitante_Time = @Time
    ) AS [Maior Número de Gols Feitos em uma Partida]
    ORDER BY [Maior Número de Gols Feitos em uma Partida] DESC
END
GO