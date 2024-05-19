USE master;
GO

DROP DATABASE IF EXISTS MusicFestival;
GO

CREATE DATABASE MusicFestival;
GO

USE MusicFestival;
GO

CREATE TABLE Participant
(
    ID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100),
    Genre NVARCHAR(50),
) AS NODE;

CREATE TABLE Stage
(
    ID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100),
) AS NODE;

CREATE TABLE Visitor
(
    ID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100),
) AS NODE;

CREATE TABLE PerformanceOn AS EDGE;

CREATE TABLE Books (price decimal(10,2)) AS EDGE;

CREATE TABLE Likes (rating decimal(10,2)) AS EDGE;

CREATE TABLE FriendOf AS EDGE;



ALTER TABLE PerformanceOn
ADD CONSTRAINT EC_PerformanceOn CONNECTION (Participant TO Stage);

ALTER TABLE Books
ADD CONSTRAINT EC_Books CONNECTION (Visitor TO Stage);

ALTER TABLE Likes
ADD CONSTRAINT EC_Likes CONNECTION (Visitor TO Participant);

ALTER TABLE FriendOf
ADD CONSTRAINT EC_FriendOf CONNECTION (Participant TO Participant);

INSERT INTO Participant (ID, Name, Genre) VALUES
(1, N'Travis Scott', N'Рэп'),
(2, N'Цой', N'Рок'),
(3, N'Mixazili', N'Нью-рок'),
(4, N'Yeat', N'Рэп'),
(5, N'Hako', N'Нью-джазз'),
(6, N'Моцарт', N'Классика'),
(7, N'Mobb Deep', N'Мемфис-рэп'),
(8, N'Kay Flock', N'Дрилл'),
(9, N'Рома228', N'Фонк'),
(10, N'Nirvana', N'Метал');

INSERT INTO Stage (ID, Name) VALUES
(1, N'Главная сцена'),
(2, N'Вторая сцена'),
(3, N'Крытая сцена'),
(4, N'Интерактивная сцена'),
(5, N'Голографическая сцена');

INSERT INTO Visitor (ID, Name) VALUES
(1, N'Миша'),
(2, N'Рома'),
(3, N'Ваня'),
(4, N'Антон'),
(5, N'Сеня'),
(6, N'Никита'),
(7, N'Илья'),
(8, N'Катя'),
(9, N'Оля'),
(10, N'Наташа');

INSERT INTO FriendOf ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Participant WHERE id = 1),
 (SELECT $node_id FROM Participant WHERE id = 2)),
 ((SELECT $node_id FROM Participant WHERE id = 1),
 (SELECT $node_id FROM Participant WHERE id = 7)),
 ((SELECT $node_id FROM Participant WHERE id = 3),
 (SELECT $node_id FROM Participant WHERE id = 4)),
 ((SELECT $node_id FROM Participant WHERE id = 2),
 (SELECT $node_id FROM Participant WHERE id = 9)),
 ((SELECT $node_id FROM Participant WHERE id = 4),
 (SELECT $node_id FROM Participant WHERE id = 1)),
 ((SELECT $node_id FROM Participant WHERE id = 5),
 (SELECT $node_id FROM Participant WHERE id = 7)),
 ((SELECT $node_id FROM Participant WHERE id = 6),
 (SELECT $node_id FROM Participant WHERE id = 10)),
 ((SELECT $node_id FROM Participant WHERE id = 7),
 (SELECT $node_id FROM Participant WHERE id = 5)),
 ((SELECT $node_id FROM Participant WHERE id = 8),
 (SELECT $node_id FROM Participant WHERE id = 3)),
 ((SELECT $node_id FROM Participant WHERE id = 9),
 (SELECT $node_id FROM Participant WHERE id = 1)),
 ((SELECT $node_id FROM Participant WHERE id = 10),
 (SELECT $node_id FROM Participant WHERE id = 9)),
 ((SELECT $node_id FROM Participant WHERE id = 3),
 (SELECT $node_id FROM Participant WHERE id = 8)),
 ((SELECT $node_id FROM Participant WHERE id = 7),
 (SELECT $node_id FROM Participant WHERE id = 9));

INSERT INTO PerformanceOn ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Participant WHERE id = 1),
 (SELECT $node_id FROM Stage WHERE id = 1)),
 ((SELECT $node_id FROM Participant WHERE id = 4),
 (SELECT $node_id FROM Stage WHERE id = 1)),
 ((SELECT $node_id FROM Participant WHERE id = 10),
 (SELECT $node_id FROM Stage WHERE id = 1)),
 ((SELECT $node_id FROM Participant WHERE id = 5),
 (SELECT $node_id FROM Stage WHERE id = 2)),
 ((SELECT $node_id FROM Participant WHERE id = 8),
 (SELECT $node_id FROM Stage WHERE id = 2)),
 ((SELECT $node_id FROM Participant WHERE id = 3),
 (SELECT $node_id FROM Stage WHERE id = 3)),
 ((SELECT $node_id FROM Participant WHERE id = 7),
 (SELECT $node_id FROM Stage WHERE id = 3)),
 ((SELECT $node_id FROM Participant WHERE id = 1),
 (SELECT $node_id FROM Stage WHERE id = 4)),
 ((SELECT $node_id FROM Participant WHERE id = 3),
 (SELECT $node_id FROM Stage WHERE id = 4)),
 ((SELECT $node_id FROM Participant WHERE id = 9),
 (SELECT $node_id FROM Stage WHERE id = 4)),
 ((SELECT $node_id FROM Participant WHERE id = 2),
 (SELECT $node_id FROM Stage WHERE id = 5)),
 ((SELECT $node_id FROM Participant WHERE id = 6),
 (SELECT $node_id FROM Stage WHERE id = 5));

INSERT INTO Books ($from_id, $to_id, price)
VALUES ((SELECT $node_id FROM Visitor WHERE ID = 1),
 (SELECT $node_id FROM Stage WHERE ID = 1), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 2),
 (SELECT $node_id FROM Stage WHERE ID = 1), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 4),
 (SELECT $node_id FROM Stage WHERE ID = 1), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 8),
 (SELECT $node_id FROM Stage WHERE ID = 1), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 9),
 (SELECT $node_id FROM Stage WHERE ID = 1), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 2),
 (SELECT $node_id FROM Stage WHERE ID = 2), 80),
 ((SELECT $node_id FROM Visitor WHERE ID = 4),
 (SELECT $node_id FROM Stage WHERE ID = 2), 80),
 ((SELECT $node_id FROM Visitor WHERE ID = 3),
 (SELECT $node_id FROM Stage WHERE ID = 2), 80),
 ((SELECT $node_id FROM Visitor WHERE ID = 5),
 (SELECT $node_id FROM Stage WHERE ID = 3), 60),
 ((SELECT $node_id FROM Visitor WHERE ID = 6),
 (SELECT $node_id FROM Stage WHERE ID = 3), 60),
 ((SELECT $node_id FROM Visitor WHERE ID = 7),
 (SELECT $node_id FROM Stage WHERE ID = 4), 150),
 ((SELECT $node_id FROM Visitor WHERE ID = 10),
 (SELECT $node_id FROM Stage WHERE ID = 4), 150),
 ((SELECT $node_id FROM Visitor WHERE ID = 1),
 (SELECT $node_id FROM Stage WHERE ID = 5), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 1),
 (SELECT $node_id FROM Stage WHERE ID = 4), 150),
 ((SELECT $node_id FROM Visitor WHERE ID = 5),
 (SELECT $node_id FROM Stage WHERE ID = 2), 80),
 ((SELECT $node_id FROM Visitor WHERE ID = 2),
 (SELECT $node_id FROM Stage WHERE ID = 4), 150),
 ((SELECT $node_id FROM Visitor WHERE ID = 10),
 (SELECT $node_id FROM Stage WHERE ID = 5), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 3),
 (SELECT $node_id FROM Stage WHERE ID = 5), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 2),
 (SELECT $node_id FROM Stage WHERE ID = 5), 100),
 ((SELECT $node_id FROM Visitor WHERE ID = 4),
 (SELECT $node_id FROM Stage WHERE ID = 4), 150);

INSERT INTO Likes ($from_id, $to_id, rating)
VALUES ((SELECT $node_id FROM Visitor WHERE ID = 1),
 (SELECT $node_id FROM Participant WHERE ID = 1), 9),
 ((SELECT $node_id FROM Visitor WHERE ID = 1),
 (SELECT $node_id FROM Participant WHERE ID = 4), 8),
 ((SELECT $node_id FROM Visitor WHERE ID = 4),
 (SELECT $node_id FROM Participant WHERE ID = 2), 10),
 ((SELECT $node_id FROM Visitor WHERE ID = 6),
 (SELECT $node_id FROM Participant WHERE ID = 8), 7),
 ((SELECT $node_id FROM Visitor WHERE ID = 2),
 (SELECT $node_id FROM Participant WHERE ID = 5), 8),
 ((SELECT $node_id FROM Visitor WHERE ID = 9),
 (SELECT $node_id FROM Participant WHERE ID = 1), 10),
 ((SELECT $node_id FROM Visitor WHERE ID = 7),
 (SELECT $node_id FROM Participant WHERE ID = 3), 5),
 ((SELECT $node_id FROM Visitor WHERE ID = 3),
 (SELECT $node_id FROM Participant WHERE ID = 4), 4),
 ((SELECT $node_id FROM Visitor WHERE ID = 8),
 (SELECT $node_id FROM Participant WHERE ID = 6), 9),
 ((SELECT $node_id FROM Visitor WHERE ID = 3),
 (SELECT $node_id FROM Participant WHERE ID = 6), 10);

-- Использование функции MATCH
-- 1. Найти все выступления на Главной сцене:
SELECT 
    p.Name AS ParticipantName, 
    s.Name AS StageName
FROM 
    Participant p,
    Stage s,
    PerformanceOn po
WHERE 
    MATCH(p-(po)->s)
    AND s.Name = N'Главная сцена';

-- 2. Найти всех посетителей, купивших место на Голографической сцене:
SELECT 
    v.Name AS VisitorName, 
    s.Name AS StageName, 
    b.price AS TicketPrice
FROM 
    Visitor v,
    Stage s,
    Books b
WHERE 
    MATCH(v-(b)->s)
    AND s.Name = N'Голографическая сцена';

-- 3. Найти всех посетителей, которые лайкнули артиста 'Travis Scott':
SELECT 
    v.Name AS VisitorName, 
    p.Name AS ParticipantName, 
    l.rating AS Rating
FROM 
    Visitor v,
    Participant p,
    Likes l
WHERE 
    MATCH(v-(l)->p)
    AND p.Name = N'Travis Scott';

-- 4. Найти все сцены, на которых выступал артист 'Цой':
SELECT 
    p.Name AS ParticipantName, 
    s.Name AS StageName
FROM 
    Participant p,
    Stage s,
    PerformanceOn po
WHERE 
    MATCH(p-(po)->s)
    AND p.Name = N'Цой';

-- 5. Найти всех посетителей и их любимых артистов с рейтингом выше 8:
SELECT 
    v.Name AS VisitorName, 
    p.Name AS ParticipantName, 
    l.rating AS Rating
FROM 
    Visitor v,
    Participant p,
    Likes l
WHERE 
    MATCH(v-(l)->p)
    AND l.rating > 8;

--

	SELECT Participant1.Name AS ParticipantName
 , STRING_AGG(Participant2.Name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Participant AS Participant1
 , FriendOf FOR PATH AS fo
 , Participant FOR PATH AS Participant2
WHERE MATCH(SHORTEST_PATH(Participant1(-(fo)->Participant2)+))
 AND Participant1.Name = N'Hako';


 	SELECT Participant1.Name AS ParticipantName
 , STRING_AGG(Participant2.Name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Participant AS Participant1
 , FriendOf FOR PATH AS fo
 , Participant FOR PATH AS Participant2
WHERE MATCH(SHORTEST_PATH(Participant1(-(fo)->Participant2){1,3}))
 AND Participant1.Name = N'Mixazili';
