CREATE DATABASE Campeonato
GO

USE Campeonato
GO

CREATE TABLE Time
(
    Nome VARCHAR(100) NOT NULL,
    Apelido VARCHAR(50) NOT NULL,
    Data_Criacao DATE NOT NULL,
    Pontos INT DEFAULT 0,
    Partidas_Jogadas INT DEFAULT 0,
    Vitorias INT DEFAULT 0,
    Empates INT DEFAULT 0,
    Derrotas INT DEFAULT 0,
    Gols_Marcados INT DEFAULT 0,
    Gols_Sofridos INT DEFAULT 0,
    Saldo_Gols INT DEFAULT 0,

    CONSTRAINT PK_Time UNIQUE(Nome)
)
GO

CREATE TABLE Partida
(
    Nome_Mandante_Time VARCHAR(100) NOT NULL,
    Gols_Mandante INT NOT NULL,
    Nome_Visitante_Time VARCHAR(100) NOT NULL,
    Gols_Visitante INT NOT NULL,

    CONSTRAINT PK_Partida PRIMARY KEY(Nome_Mandante_Time, Nome_Visitante_Time),
    CONSTRAINT FK_Partida_Time FOREIGN KEY(Nome_Mandante_Time) REFERENCES [Time](Nome),
    CONSTRAINT FK_Partida_Time2 FOREIGN KEY(Nome_Visitante_Time) REFERENCES [Time](Nome)
)
GO

-- Inserindo os Times

INSERT INTO [Time]
    (Nome, Apelido, Data_Criacao)
VALUES
    ('São Paulo Futebol Clube', 'São Paulo F.C.', '1930-01-25'),
    ('Sport Club Corinthians Paulista', 'Corinthians', '1910-09-01'),
    ('Sociedade Esportiva Palmeiras', 'Palmeiras', '1914-08-26'),
    ('Santos Futebol Clube', 'Santos F.C.', '1912-04-14'),
    ('Associação Portuguesa de Desportos', 'Portuguesa', '1920-08-14')
GO

-- Rodada 1 - Santos

INSERT INTO Partida
VALUES('Santos Futebol Clube', 5, 'São Paulo Futebol Clube', 1)
INSERT INTO Partida
VALUES('Santos Futebol Clube', 7, 'Sport Club Corinthians Paulista', 2)
INSERT INTO Partida
VALUES('Santos Futebol Clube', 4, 'Sociedade Esportiva Palmeiras', 0)
INSERT INTO Partida
VALUES('Santos Futebol Clube', 3, 'Associação Portuguesa de Desportos', 3)

-- Rodada 2 - São Paulo

INSERT INTO Partida
VALUES('São Paulo Futebol Clube', 7, 'Santos Futebol Clube', 4)
INSERT INTO Partida
VALUES('São Paulo Futebol Clube', 3, 'Sport Club Corinthians Paulista', 1)
INSERT INTO Partida
VALUES('São Paulo Futebol Clube', 5, 'Sociedade Esportiva Palmeiras', 7)
INSERT INTO Partida
VALUES('São Paulo Futebol Clube', 3, 'Associação Portuguesa de Desportos', 0)

-- Rodada 3 - Corinthians

INSERT INTO Partida
VALUES('Sport Club Corinthians Paulista', 0, 'São Paulo Futebol Clube', 3)
INSERT INTO Partida
VALUES('Sport Club Corinthians Paulista', 2, 'Santos Futebol Clube', 4)
INSERT INTO Partida
VALUES('Sport Club Corinthians Paulista', 1, 'Sociedade Esportiva Palmeiras', 2)
INSERT INTO Partida
VALUES('Sport Club Corinthians Paulista', 5, 'Associação Portuguesa de Desportos', 6)

-- Rodada 4 - Palmeiras

INSERT INTO Partida
VALUES('Sociedade Esportiva Palmeiras', 0, 'Associação Portuguesa de Desportos', 0)
INSERT INTO Partida
VALUES('Sociedade Esportiva Palmeiras', 2, 'Santos Futebol Clube', 3)
INSERT INTO Partida
VALUES('Sociedade Esportiva Palmeiras', 3, 'São Paulo Futebol Clube', 1)
INSERT INTO Partida
VALUES('Sociedade Esportiva Palmeiras', 2, 'Sport Club Corinthians Paulista', 2)

-- Rodada 5 - Portuguesa

INSERT INTO Partida
VALUES('Associação Portuguesa de Desportos', 1, 'Sociedade Esportiva Palmeiras', 0)
INSERT INTO Partida
VALUES('Associação Portuguesa de Desportos', 4, 'Santos Futebol Clube', 2)
INSERT INTO Partida
VALUES('Associação Portuguesa de Desportos', 2, 'São Paulo Futebol Clube', 5)
INSERT INTO Partida
VALUES('Associação Portuguesa de Desportos', 1, 'Sport Club Corinthians Paulista', 1)

SELECT Apelido AS [Time], Pontos, Partidas_Jogadas AS [Partidas Jogadas], Vitorias,
    Empates, Derrotas, Gols_Marcados AS [Gols Marcados], Gols_Sofridos AS [Gols Sofridos], Saldo_Gols AS [Saldo de Gols]
FROM [Time]

-- Mostra o time que foi campeão do Campeonato Amador
EXEC.MostrarCampeao
GO

-- Mostra os 5 primeiros times do Campeonato Amador
EXEC.Classificacao
GO

-- Mostra o time que fez mais gols
EXEC.MaisGolsFeitos
GO

-- Mostra o time que levou mais gols
EXEC.MaisGolsSofridos
GO

-- Mostra o maior placar de um jogo do Campeonato Amador
EXEC.MaiorPlacar
GO

-- Mostra qual o jogo que cada time fez mais gols
EXEC.JogoComMaisGols 'Associação Portuguesa de Desportos'
GO

EXEC.JogoComMaisGols 'Sociedade Esportiva Palmeiras'
GO

EXEC.JogoComMaisGols 'Santos Futebol Clube'
GO

EXEC.JogoComMaisGols 'São Paulo Futebol Clube'
GO

EXEC.JogoComMaisGols 'Sport Club Corinthians Paulista'
GO