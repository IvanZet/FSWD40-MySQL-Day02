-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 13. Jun 2018 um 09:55
-- Server-Version: 5.6.38
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `day2_mySQL`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `authors`
--

INSERT INTO `authors` (`id`, `firstName`, `lastName`, `bio`) VALUES
(3, 'Leo', 'Tollstoy', 'he was living in a village'),
(4, 'Zack', 'Palanik', 'he is a weird guy'),
(5, 'Game', 'Throne', 'fantasy name'),
(6, 'Joanne', 'Rowling', 'harry potter author');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `fk_publisherID` int(25) DEFAULT NULL,
  `fk_userID` int(11) NOT NULL,
  `fk_authorID` int(11) NOT NULL,
  `fk_locationID` int(11) DEFAULT NULL,
  `fk_categoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `books`
--

INSERT INTO `books` (`id`, `title`, `fk_publisherID`, `fk_userID`, `fk_authorID`, `fk_locationID`, `fk_categoryID`) VALUES
(4, 'Harry Potter', 5, 10, 6, 3, 6),
(6, 'Fight Club', 3, 11, 4, 4, 4),
(8, 'Peace and War', 1, 12, 3, 6, 4),
(10, 'Never Ending Story', 4, 14, 5, 7, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(3, 'Crime', 'thrilling books about murder'),
(4, 'Drama', 'someone is very sad'),
(5, 'Comedy', 'something funny'),
(6, 'Science Fiction', 'something about future');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `shelf` char(2) DEFAULT NULL,
  `shelfRow` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`id`, `shelf`, `shelfRow`) VALUES
(3, 'A', 1),
(4, 'A', 2),
(5, 'A', 3),
(6, 'B', 1),
(7, 'B', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisherID` int(11) NOT NULL,
  `label` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisherID`, `label`, `city`) VALUES
(1, 'Phoenix', 'New York'),
(2, 'Orac', 'Vienna'),
(3, 'Alpha', 'Moscow'),
(4, 'Unicorn', 'Munich'),
(5, 'Sky', 'London'),
(6, 'Fire', 'Madrid');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`) VALUES
(10, 'Mario', 'Schantel'),
(11, 'Ivan', 'Zykov'),
(12, 'Michael', 'Schlosser'),
(13, 'Max', 'Müller'),
(14, 'Peter', 'Berger');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`fk_userID`),
  ADD KEY `authorID` (`fk_authorID`),
  ADD KEY `locationID` (`fk_locationID`),
  ADD KEY `categoryID` (`fk_categoryID`),
  ADD KEY `fk_publisherID` (`fk_publisherID`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherID`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`fk_authorID`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`fk_locationID`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `books_ibfk_4` FOREIGN KEY (`fk_categoryID`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `books_ibfk_5` FOREIGN KEY (`fk_userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_6` FOREIGN KEY (`fk_publisherID`) REFERENCES `publisher` (`publisherID`);
