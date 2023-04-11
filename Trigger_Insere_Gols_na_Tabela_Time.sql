USE Campeonato
GO

CREATE OR ALTER TRIGGER TGR_Insere_Gols_Tabela_Time ON Partida AFTER INSERT
AS
BEGIN
    DECLARE @Mandante VARCHAR(100), @Gols_Mandante INT, @Visitante VARCHAR(100), @Gols_Visitante INT
    DECLARE @Pontos_Mandante INT, @Pontos_Visitante INT, @Partidas_Jogadas_Mandante INT, @Partidas_Jogadas_Visitante INT,
    @Vitorias_Mandante INT, @Vitorias_Visitante INT, @Empates_Mandante INT, @Empates_Visitante INT, @Derrotas_Mandante INT, @Derrotas_Visitante INT,
    @Gols_Marcados_Mandante INT, @Gols_Marcados_Visitante INT, @Gols_Sofridos_Mandante INT, @Gols_Sofridos_Visitante INT,
    @Saldo_Gols_Mandante INT, @Saldo_Gols_Visitante INT

    SELECT @Mandante = Nome_Mandante_Time, @Gols_Mandante = Gols_Mandante, @Visitante = Nome_Visitante_Time, @Gols_Visitante = Gols_Visitante
    FROM INSERTED
    SELECT @Pontos_Mandante = M.Pontos, @Partidas_Jogadas_Mandante = M.Partidas_Jogadas, @Vitorias_Mandante = M.Vitorias, 
        @Empates_Mandante = M.Empates, @Derrotas_Mandante = M.Derrotas, @Gols_Marcados_Mandante = M.Gols_Marcados,
        @Gols_Sofridos_Mandante = M.Gols_Sofridos, @Saldo_Gols_Mandante = M.Saldo_Gols
    FROM [Time] M
    WHERE Nome = @Mandante
    SELECT @Pontos_Visitante = V.Pontos, @Partidas_Jogadas_Visitante = V.Partidas_Jogadas, @Vitorias_Visitante = V.Vitorias, 
        @Empates_Visitante = V.Empates, @Derrotas_Visitante = V.Derrotas, @Gols_Marcados_Visitante = V.Gols_Marcados,
        @Gols_Sofridos_Visitante = V.Gols_Sofridos, @Saldo_Gols_Visitante = V.Saldo_Gols
    FROM [Time] V
    WHERE Nome = @Visitante

    -- Vitória do Mandante

    IF(@Gols_Mandante > @Gols_Visitante)
    BEGIN
        UPDATE [Time]
        SET Pontos = @Pontos_Mandante + 3, Partidas_Jogadas = @Partidas_Jogadas_Mandante + 1, Vitorias = @Vitorias_Mandante + 1,
        Gols_Marcados = @Gols_Marcados_Mandante + @Gols_Mandante, Gols_Sofridos = @Gols_Sofridos_Mandante + @Gols_Visitante,
        Saldo_Gols = @Saldo_Gols_Mandante + (@Gols_Mandante - @Gols_Visitante)
        WHERE Nome = @Mandante

        UPDATE [Time]
        SET Partidas_Jogadas = @Partidas_Jogadas_Visitante + 1, Derrotas = @Derrotas_Visitante + 1,
        Gols_Marcados = @Gols_Marcados_Visitante + @Gols_Visitante, Gols_Sofridos = @Gols_Sofridos_Visitante + @Gols_Mandante,
        Saldo_Gols = @Saldo_Gols_Visitante + (@Gols_Visitante - @Gols_Mandante)
        WHERE Nome = @Visitante
    END

    -- Vitória do Visitante

    IF(@Gols_Mandante < @Gols_Visitante)
    BEGIN
        UPDATE [Time]
        SET Partidas_Jogadas = @Partidas_Jogadas_Mandante + 1, Derrotas = @Derrotas_Mandante + 1,
        Gols_Marcados = @Gols_Marcados_Mandante + @Gols_Mandante, Gols_Sofridos = @Gols_Sofridos_Mandante + @Gols_Visitante,
        Saldo_Gols = @Saldo_Gols_Mandante + (@Gols_Mandante - @Gols_Visitante)
        WHERE Nome = @Mandante

        UPDATE [Time]
        SET Pontos = @Pontos_Visitante + 5, Partidas_Jogadas = @Partidas_Jogadas_Visitante + 1, Vitorias = @Vitorias_Visitante + 1,
        Gols_Marcados = @Gols_Marcados_Visitante + @Gols_Visitante, Gols_Sofridos = @Gols_Sofridos_Visitante + @Gols_Mandante,
        Saldo_Gols = @Saldo_Gols_Visitante + (@Gols_Visitante - @Gols_Mandante)
        WHERE Nome = @Visitante
    END

    -- Empate

    IF(@Gols_Mandante = @Gols_Visitante)
    BEGIN
        UPDATE [Time]
        SET Pontos = @Pontos_Mandante + 1, Partidas_Jogadas = @Partidas_Jogadas_Mandante + 1, Empates = @Empates_Mandante + 1,
        Gols_Marcados = @Gols_Marcados_Mandante + @Gols_Mandante, Gols_Sofridos = @Gols_Sofridos_Mandante + @Gols_Visitante,
        Saldo_Gols = @Saldo_Gols_Mandante + (@Gols_Mandante - @Gols_Visitante)
        WHERE Nome = @Mandante

        UPDATE [Time]
        SET Pontos = @Pontos_Visitante + 1, Partidas_Jogadas = @Partidas_Jogadas_Visitante + 1, Empates = @Empates_Visitante + 1,
        Gols_Marcados = @Gols_Marcados_Visitante + @Gols_Visitante, Gols_Sofridos = @Gols_Sofridos_Visitante + @Gols_Mandante,
        Saldo_Gols = @Saldo_Gols_Mandante + (@Gols_Visitante - @Gols_Mandante)
        WHERE Nome = @Visitante
    END
END
GO  