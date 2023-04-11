USE Campeonato
GO

CREATE OR ALTER PROCEDURE MaiorPlacar
AS
BEGIN
    SELECT TOP(1) Nome_Mandante_Time AS [Time Mandante], Gols_Mandante AS [Gols Mandante], Gols_Visitante AS [Gols Visitante],
    Nome_Visitante_Time AS [Time Visitante], (Gols_Mandante + Gols_Visitante) AS [Total de Gols na Partida]
    FROM Partida
    ORDER BY (Gols_Mandante + Gols_Visitante) DESC
END
GO