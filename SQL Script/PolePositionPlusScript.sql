/* Lógico_6: */

CREATE DATABASE PolePositionPlus;
USE PolePositionPlus;

CREATE TABLE Piloto (
    id_piloto INT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    dataNascimento DATE,
    descricao VARCHAR(200),
    fk_Equipe_id_equipe INT
);

CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY,
    Nome VARCHAR(100),
    Mascote VARCHAR(100),
    Patrocinador VARCHAR(100)
);

CREATE TABLE Corrida (
    id_corrida INT PRIMARY KEY,
    data DATE,
    fk_Campeonato_id_campeonato INT
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    dataNascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(100),
    senha VARCHAR(30),
    moedas FLOAT DEFAULT 200
);

CREATE TABLE Aposta (
    id_aposta INT PRIMARY KEY,
    posicao INT,
    fk_Usuario_id_usuario INT,
    fk_Competicao_Participa_ID_Competicao INT
);

CREATE TABLE Campeonato (
    id_campeonato INT PRIMARY KEY,
    Cidade VARCHAR(100),
    Nome VARCHAR(100)
);

CREATE TABLE Competicao_Participa (
    ID_Competicao INT PRIMARY KEY,
    posicao INT,
    pontuacao INT,
    fk_Piloto_id_piloto INT,
    fk_Corrida_id_corrida INT
);

CREATE TABLE Cidade (
    id_cidade INT PRIMARY KEY,
    nome_cidade VARCHAR(30),
    fk_id_campeonato INT
);
 
ALTER TABLE Piloto ADD CONSTRAINT FK_Piloto_2
    FOREIGN KEY (fk_Equipe_id_equipe)
    REFERENCES Equipe (id_equipe)
    ON DELETE RESTRICT;
 
ALTER TABLE Corrida ADD CONSTRAINT FK_Corrida_2
    FOREIGN KEY (fk_Campeonato_id_campeonato)
    REFERENCES Campeonato (id_campeonato)
    ON DELETE RESTRICT;
 
ALTER TABLE Aposta ADD CONSTRAINT FK_Aposta_2
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Aposta ADD CONSTRAINT FK_Aposta_3
    FOREIGN KEY (fk_Competicao_Participa_ID_Competicao)
    REFERENCES Competicao_Participa (ID_Competicao)
    ON DELETE CASCADE;
 
ALTER TABLE Competicao_Participa ADD CONSTRAINT FK_Competicao_Participa_2
    FOREIGN KEY (fk_Piloto_id_piloto)
    REFERENCES Piloto (id_piloto);
 
ALTER TABLE Competicao_Participa ADD CONSTRAINT FK_Competicao_Participa_3
    FOREIGN KEY (fk_Corrida_id_corrida)
    REFERENCES Corrida (id_corrida);
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_id_campeonato)
    REFERENCES Campeonato (id_campeonato);
    
ALTER TABLE Aposta
ADD Piloto INT;

ALTER TABLE Aposta ADD CONSTRAINT CK_POS
    CHECK (Posicao BETWEEN 1 AND 20);

-- povoando as tabelas:

INSERT INTO Equipe VALUES
(1,"RedBull","Touro","Oracle"), 
(2,"Renault",NULL,"MAPFRE"),
(3,"Mercedes",NULL, "Petronas"),
(4,"Aston Martin","Urso","Cognizart"),
(5,"Ferrari","Teddy","Stake"),
(6,"Alpine","Urso Polar","Banco BRB"),
(7,"McLaren",NULL,"DP World"),
(8,"Williams","Falcão","Gulf Oil"),
(9,"Alfa Romeo","Cavalo Marinho","Stake"),
(10,"Alfa Tauri","Touro Alado","PKN Orlen"),
(11, "Haas", "Cobra", "Uralkali"),
(12, "Sauber", "Dente de Sabre", "Claro"),
(13, "Toro Rosso", "Touro Alado","Honda"),
(14, "Lotus", "flor", "Richard Mile"),
(15, "Force India", "Naja", "BWT");


INSERT INTO Piloto VALUES
(1,"Max","Verstappen",STR_TO_DATE('30/09/1997','%d/%m/%Y'),
	"Max Emilian Verstappen é um automobilista neerlandês. Ele é piloto de Fórmula 1 desde 2015, tendo feito sua estreia pela equipe Toro Rosso.",1), 
(2,"Lewis","Hamilton",STR_TO_DATE('07/01/1985','%d/%m/%Y'),
	"Sir Lewis Carl Davidson Hamilton MBE HonFREng Kt é um automobilista britânico. Sete vezes campeão mundial de Fórmula 1, nos anos de 2008, 2014, 2015, 2017, 2018, 2019 e 2020.",3),
(3,"Charles","LeClerc",STR_TO_DATE('16/10/1985','%d/%m/%Y'),
	"Charles Marc Hervé Perceval Leclerc, mais conhecido como Charles Leclerc, é um piloto de automóveis monegasco que compete na Fórmula 1 pela equipe Ferrari.",5),
(4,"Carlos","Sainz",STR_TO_DATE('01/09/1994','%d/%m/%Y'),
	"Carlos Sainz Vázquez de Castro, mais conhecido como Carlos Sainz Jr. é um piloto de automobilismo espanhol que atua na Fórmula 1 pela Scuderia Ferrari.",5),
(5,"Fernando","Alonso",STR_TO_DATE('29/07/1981','%d/%m/%Y'),
	"Fernando Alonso Díaz é um automobilista espanhol que atua na Fórmula 1 pela equipe Aston Martin. É bicampeão mundial de Fórmula 1 em 2005 e 2006 pela Renault.",4),
(6,"Esteban","Ocon",STR_TO_DATE('17/09/1996','%d/%m/%Y'),
	"Esteban Ocon é um piloto de Fórmula 1 francês que conquistou sua primeira vitória na categoria em 2021 com a equipe Alpine.",6),
(7,"Pierre","Gasly",STR_TO_DATE('07/02/1996','%d/%m/%Y'),
	"Pierre Gasly é um piloto de Fórmula 1 francês que atualmente compete pela equipe Alpine.",6),
(8,"Lando","Norris",STR_TO_DATE('13/11/1999','%d/%m/%Y'),
	"Lando Norris é um piloto de Fórmula 1 britânico que compete pela equipe McLaren.",7),
(9,"Oscar","Piastri",STR_TO_DATE('06/04/2001','%d/%m/%Y'),
	"Oscar Piastri é um jovem piloto de automobilismo australiano, conhecido por suas conquistas nas categorias de base, incluindo o título na Fórmula 3 em 2020.",7),
(10,"Yuki","Tsunoda",STR_TO_DATE('11/05/2000','%d/%m/%Y'),
	"Yuki Tsunoda é um piloto de Fórmula 1 japonês que estreou na categoria em 2021 com a equipe AlphaTauri, mostrando-se promissor em sua primeira temporada.",10),
(11, "Sergio", "Perez", STR_TO_DATE('26/01/1990','%d/%m/%Y'),
	"Sergio Perez, renomado piloto mexicano de Fórmula 1, destaca-se pela sua habilidade excepcional ao volante e estratégias táticas impressionantes nas corridas.", 1),
(12, "George", "Russel", STR_TO_DATE('15/02/1998','%d/%m/%Y'),
	"George Russell, talentoso piloto britânico de Fórmula 1, é reconhecido pela sua destreza nas pistas, impressionando com sua velocidade e habilidade técnica.", 3),
(13, "Lance", "Stroll", STR_TO_DATE('29/10/1998','%d/%m/%Y'),
	"Lance Stroll, piloto canadense de Fórmula 1, destaca-se por sua abordagem agressiva nas corridas e por ser um competidor determinado, conquistando seu espaço com ousadia.", 4),
(14, "Daniel", "Ricciardo", STR_TO_DATE('01/07/1989','%d/%m/%Y'),
	"Daniel Ricciardo, carismático piloto australiano de Fórmula 1, é conhecido pelo seu estilo arrojado de pilotagem, combinando habilidade técnica com um sorriso contagiante.", 10),
(15, "Alexander", "Albon", STR_TO_DATE('23/03/1996','%d/%m/%Y'),
	"Alexander Albon, talentoso piloto tailandês de Fórmula 1, destaca-se por sua determinação e velocidade, combinando agilidade nas ultrapassagens com uma abordagem estratégica.", 8);


INSERT INTO Campeonato VALUES
(1,"Sakhir","Bahrain International Circuit"),
(2,"Monte Carlo","Circuit de Monaco"),
(3,"Jeddah","Jeddah Corniche Circuit"),
(4,"Melbourne","Albert Park Circuit"),
(5,"Sao Paulo","Autodromo José Carlos Pace"),
(6,"Suzuka","Suzuka International Racing Course"),
(7,"Monza","Monza Circuit"),
(8,"Xangai","Shanghai International Circuit"),
(9,"Baku","Baku City Circuit"),
(10,"Austin","Circuit of the Americas"), 
(11, "Istambul", "Istanbul Park"),
(12, "Barcelona", "Circuit de Barcelona-Catalunya"),
(13, "Silverstone", "Silverstone Circuit"),
(14, "Sochi", "Sochi Autodrom"),
(15, "Budapeste", "Hungaroring");

INSERT INTO Corrida VALUES
(1,STR_TO_DATE('05/03/2023','%d/%m/%Y'),1),
(2,STR_TO_DATE('19/03/2023','%d/%m/%Y'),3),
(3,STR_TO_DATE('02/04/2023','%d/%m/%Y'),4),
(4,STR_TO_DATE('28/05/2023','%d/%m/%Y'),2),
(5,STR_TO_DATE('24/09/2023','%d/%m/%Y'),6),
(6,STR_TO_DATE('20/05/2023','%d/%m/%Y'),7),
(7,STR_TO_DATE('21/05/2023','%d/%m/%Y'),8),
(8,STR_TO_DATE('22/05/2023','%d/%m/%Y'),9),
(9,STR_TO_DATE('23/05/2023','%d/%m/%Y'),10),
(10,STR_TO_DATE('24/05/2023','%d/%m/%Y'),5),
(11,STR_TO_DATE('13/02/2023','%d/%m/%Y'),12),
(12, STR_TO_DATE('17/03/2023','%d/%m/%Y'),11),
(13, STR_TO_DATE('01/04/2023','%d/%m/%Y'),15),
(14, STR_TO_DATE('07/03/2023','%d/%m/%Y'),14),
(15, STR_TO_DATE('20/02/2023','%d/%m/%Y'),13);

INSERT INTO Competicao_participa VALUES
(1,1,25,1,1),
(2,3,15,5,1),
(3,4,12,4,1),
(4,5,10,2,1),
(5,18,0,3,1),
(6,5,8,6,1),
(7,6,6,7,1),
(8,7,16,8,1),
(9,8,10,9,1),
(10,9,2,10,1),
(11,2,3,11, 1),
(12,10,11,12,1),
(13,11,19,13,1),
(14,12,1,14,1),
(15,13,15,15,1);

INSERT INTO Usuario(nome, sobrenome, dataNascimento, email, telefone, senha, moedas) VALUES
("Joao","Freitas",STR_TO_DATE('19/10/2001','%d/%m/%Y'),"joao@gmail.com","(41) 99999-9999","joao1234",50),
("Henrique","Grigoli",STR_TO_DATE('08/08/2003','%d/%m/%Y'),"henrique@gmail.com","(41) 93831-3299","henrique2003",100),
("Bernardo","Jakubiak",STR_TO_DATE('01/04/2002','%d/%m/%Y'),"bernardo@gmail.com","(41) 99123-9999","berbsi",300),
("Carlos","Hobmeier",STR_TO_DATE('12/02/1997','%d/%m/%Y'),"carlos@gmail.com","(41) 99999-9231","carloshob2",400),
("Amanda","Queiroz",STR_TO_DATE('05/01/1997','%d/%m/%Y'),"amanda@gmail.com","(41) 92323-3299","Amanda2000",150),
("Bruno","Silva",STR_TO_DATE('12/02/1990','%d/%m/%Y'),"bruno@gmail.com","(41) 99999-9232","Bruninho23",250),
("Juca","Oliveira",STR_TO_DATE('12/03/1992','%d/%m/%Y'),"juca@gmail.com","(41) 99999-9233","Juquinha",400),
("Alfredo","Moreira",STR_TO_DATE('17/02/1999','%d/%m/%Y'),"alfredo@gmail.com","(41) 99999-9234","AlfredoQueijo",100),
("Denis","Sobral",STR_TO_DATE('11/06/2000','%d/%m/%Y'),"denis@gmail.com","(41) 99999-9235","DenisDj",200),
("Caio","Domingues",STR_TO_DATE('06/02/1995','%d/%m/%Y'),"caio@gmail.com","(41) 99999-9237","CaioALencar",400),
("Carol","Cabral",STR_TO_DATE('06/03/1995','%d/%m/%Y'),"carol@gmail.com","(41) 99999-9737","1234567",600),
("Mévio","Lombroso",STR_TO_DATE('08/02/1995','%d/%m/%Y'),"mevio@gmail.com","(41) 99999-6237","20012Admin",700),
("Tício","Furtado",STR_TO_DATE('26/07/1999','%d/%m/%Y'),"ticio@gmail.com","(41) 99999-9267","ticio23",450),
("Francisco","Beltrão",STR_TO_DATE('06/01/2000','%d/%m/%Y'),"francisco@gmail.com","(41) 99999-9537","Chico23",100),
("Florinda","Guerra",STR_TO_DATE('26/02/1992','%d/%m/%Y'),"florinda@gmail.com","(41) 99999-9233","FlorindaMadruga",50);


INSERT INTO Aposta VALUES
(1,1,1,1,1),
(2,4,4,3,2),
(3,2,2,2,5),
(4,3,2,2,3),
(5,1,5,1,4),
(6,1,6,2,6),
(7,1,6,3,7),
(8,1,6,1,8),
(9,1,6,2,9),
(10,1,6,1,10),
(11,1,4,1,11),
(12,1,12,2,12),
(13,1,10,3,13),
(14,1,9,1,14),
(15,1,13,2,15);

INSERT INTO Cidade Values
(1, 'Manama', 1),
(2, 'Sakhir', 1),
(3, 'Monte Carlo', 2),
(4, 'Nice', 2),
(5, 'Jeddah', 3),
(6, 'Meca', 3),
(7, 'Melbourne', 4),
(8, 'Geelong', 4),
(9, 'São Paulo', 5),
(10, 'Interlagos', 5),
(11, 'Suzuka', 6),
(12, 'Nagoya', 6),
(13, 'Monza', 7),
(14, 'Milão', 7),
(15, 'Xangai', 8),
(16, 'Jiading', 8),
(17, 'Baku', 9),
(18, 'Ganja', 9),
(19, 'Austin', 10),
(20, 'Houston', 10);


SELECT * FROM Equipe;
SELECT * FROM Aposta;
SELECT * FROM Campeonato;
SELECT * FROM Cidade;
SELECT * FROM Competicao_participa;
SELECT * FROM Corrida;
SELECT * FROM Piloto;
SELECT * FROM Usuario;



-- CONSULTAS
-- 6 - agregação

-- consulta 1
SELECT
    YEAR(dataNascimento) AS Ano,
    AVG(moedas) AS 'Média de Moedas',
    count(id_usuario) AS 'Quantidade de Pessoas'
FROM
    Usuario
GROUP BY
    Ano
ORDER BY
	Ano;

-- consulta 2
SELECT
    a.fk_Competicao_Participa_ID_Competicao AS id_corrida,
    SUM(u.moedas) AS total_moedas_apostadas
FROM
    Aposta a
JOIN
    Usuario u ON a.fk_Usuario_id_usuario = u.id_usuario
GROUP BY
    a.fk_Competicao_Participa_ID_Competicao
ORDER BY
	total_moedas_apostadas DESC;


-- consulta 3
SELECT
    e.Nome AS nome_equipe,
    p.nome AS nome_piloto,
    AVG(cp.pontuacao) AS pontuacao_media
FROM
    Equipe e
JOIN
    Piloto p ON e.id_equipe = p.fk_Equipe_id_equipe
JOIN
    Competicao_Participa cp ON p.id_piloto = cp.fk_Piloto_id_piloto
GROUP BY
    e.id_equipe, e.Nome, p.id_piloto, p.nome
ORDER BY
	nome_equipe ASC, pontuacao_media DESC;

-- 6.2
-- consulta 1
SELECT
    u.nome AS nome_usuario,
    p.nome AS nome_piloto,
    a.posicao
FROM
    Aposta a, Usuario u, Competicao_Participa cp, Piloto p
WHERE
    a.fk_Usuario_id_usuario = u.id_usuario
    AND a.fk_Competicao_Participa_ID_Competicao = cp.ID_Competicao
    AND cp.fk_Piloto_id_piloto = p.id_piloto;

-- consulta 2
SELECT
    u.nome AS nome_usuario,
    p.nome AS nome_piloto,
    a.posicao AS posicao_apostada,
    cp.posicao AS posicao_real,
    cam.Nome AS nome_campeonato
FROM
    Aposta a, Usuario u, Competicao_Participa cp, Piloto p, Corrida c, Campeonato cam
WHERE
    a.fk_Usuario_id_usuario = u.id_usuario
    AND a.fk_Competicao_Participa_ID_Competicao = cp.ID_Competicao
    AND cp.fk_Piloto_id_piloto = p.id_piloto
    AND cp.fk_Corrida_id_corrida = c.id_corrida
    AND c.fk_Campeonato_id_campeonato = cam.id_campeonato
    AND a.posicao = cp.posicao;

-- consulta 3
SELECT
    c.id_corrida,
    COUNT(a.id_aposta) AS total_apostas
FROM
    Corrida c
LEFT JOIN
    Competicao_Participa cp ON c.id_corrida = cp.fk_Corrida_id_corrida
LEFT JOIN
    Aposta a ON cp.ID_Competicao = a.fk_Competicao_Participa_ID_Competicao
GROUP BY
    c.id_corrida
ORDER BY
    total_apostas DESC
LIMIT 1;



-- stored procedure
DELIMITER //
CREATE PROCEDURE ListarUsuariosComApostas(IN corrida_id INT)
BEGIN
    SELECT
        U.nome AS NomeUsuario,
        U.sobrenome AS SobrenomeUsuario,
        A.posicao AS PosicaoAposta,
        P.nome AS NomePiloto
    FROM
        Usuario U
    JOIN Aposta A ON U.id_usuario = A.fk_Usuario_id_usuario
    JOIN Competicao_Participa CP ON A.fk_Competicao_Participa_ID_Competicao = CP.ID_Competicao
    JOIN Piloto P ON CP.fk_Piloto_id_piloto = P.id_piloto
    WHERE
        CP.fk_Corrida_id_corrida = corrida_id;
END //
DELIMITER ;
CALL ListarUsuariosComApostas(1);


-- trigger
DELIMITER //
CREATE TRIGGER AtualizarMoedasApostador AFTER INSERT ON Aposta
FOR EACH ROW
BEGIN
    DECLARE valorAposta FLOAT;    
    -- Obter o valor da aposta
    SELECT CP.pontuacao INTO valorAposta
    FROM Competicao_Participa CP
    WHERE CP.ID_Competicao = NEW.fk_Competicao_Participa_ID_Competicao;
    -- Atualizar o saldo de moedas do usuário
    UPDATE Usuario
    SET moedas = moedas - valorAposta
    WHERE id_usuario = NEW.fk_Usuario_id_usuario;
END //
DELIMITER ;

-- antes do trigger
Select id_usuario, moedas from usuario;

INSERT INTO Aposta
VALUES (16, 1, 1, 1, 5);

-- depois do trigger
Select id_usuario, moedas from usuario;



CREATE TABLE LogApostas (
    id_mensagem INT PRIMARY KEY auto_increment,
    mensagem VARCHAR(255)
);

-- outro trigger (log)
DELIMITER //
CREATE TRIGGER log_aposta
AFTER INSERT ON Aposta
FOR EACH ROW
BEGIN
    DECLARE log_message VARCHAR(255);
    SET log_message = CONCAT('Nova aposta inserida - ID: ', NEW.id_aposta,
                             ', Posição: ', NEW.posicao,
                             ', ID do Usuário: ', NEW.fk_Usuario_id_usuario,
                             ', ID da Competição: ', NEW.fk_Competicao_Participa_ID_Competicao);
    INSERT INTO LogApostas (mensagem) VALUES (log_message);
END //
DELIMITER ;

select * from logapostas;

insert into aposta values (17, 1, 3, 1, 3);

select * from logapostas;










-- códigos da primeira entrega


SELECT * FROM equipe JOIN piloto on equipe.id_equipe = piloto.id_piloto;

SELECT *
FROM Aposta
JOIN Competicao_Participa
on Aposta.fk_Competicao_Participa_ID_Competicao = Competicao_Participa.ID_Competicao
WHERE Piloto = fk_Piloto_id_piloto;

SELECT p.nome,p.sobrenome,Competicao_Participa.posicao,pontuacao 
FROM Piloto AS p 
JOIN Competicao_Participa 
ON Competicao_Participa.fk_Piloto_id_piloto = p.id_piloto;

SELECT p.nome, p.sobrenome, e.nome
FROM Piloto AS p
join Equipe AS e	
ON e.id_equipe = p.fk_equipe_id_equipe
ORDER BY p.nome ASC;

select * from usuario;
    
    
    
