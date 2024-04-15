-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2024 at 11:44 AM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wegram`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `likes_count` int(11) DEFAULT NULL,
  `comments_count` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `username`, `caption`, `image_url`, `likes_count`, `comments_count`, `created_at`) VALUES
(1, 1, 'john_doe', 'Magnifique coucher de soleil ce soir ! 🌅 #nature #sunset', 'https://example.com/images/sunset.jpg', 120, 25, '2023-03-15 17:30:00'),
(2, 2, 'jane_smith', 'Exploration urbaine dans la ville. #city #urbanexploration', 'https://example.com/images/city.jpg', 85, 15, '2023-03-14 11:45:00'),
(3, 3, 'alex_carter', 'Délicieux brunch du dimanche. 🥞☕️ #brunch #sunday', 'https://example.com/images/brunch.jpg', 200, 40, '2023-03-13 10:00:00'),
(4, 4, 'emily_wilson', 'Nouveau membre de la famille ! Bienvenue à notre chaton. 😻 #catsofinstagram #newfamilymember', 'https://example.com/images/cat.jpg', 300, 55, '2023-03-12 15:20:00'),
(5, 5, 'michael_jackson', 'Séance de studio en cours. 🎶 #music #studio', 'https://example.com/images/music.jpg', 150, 30, '2023-03-11 19:00:00'),
(6, 6, 'sarah_anderson', 'Journée à la plage. ☀️🌊 #beachday #summer', 'https://example.com/images/beach.jpg', 400, 70, '2023-03-10 13:00:00'),
(7, 7, 'chris_roberts', 'En route pour de nouvelles aventures ! 🚗💨 #roadtrip #adventure', 'https://example.com/images/roadtrip.jpg', 250, 45, '2023-03-09 08:30:00'),
(8, 8, 'laura_davis', 'Délicieux dîner entre amis. 🍽️🍷 #dinnerparty #friends', 'https://example.com/images/dinner.jpg', 180, 35, '2023-03-08 18:00:00'),
(9, 9, 'max_garcia', 'Vue imprenable depuis le sommet de la montagne. ⛰️ #mountainview #hiking', 'https://example.com/images/mountain.jpg', 280, 50, '2023-03-07 09:10:00'),
(10, 10, 'olivia_smith', 'Souvenir de voyage en Europe. 🌍✈️ #europe #travel', 'https://example.com/images/travel.jpg', 320, 60, '2023-03-06 14:45:00'),
(11, 11, 'natalie_wong', 'Exploration de la nature sauvage. 🌿🐾 #wilderness #nature', 'https://example.com/images/wilderness.jpg', 180, 25, '2023-03-05 10:20:00'),
(12, 12, 'kevin_adams', 'Séance photo en plein air. 📸☀️ #photoshoot #outdoor', 'https://example.com/images/photoshoot.jpg', 240, 40, '2023-03-04 13:50:00'),
(13, 13, 'sophie_brown', 'Balade à vélo le long de la rivière. 🚲🌳 #bikeride #river', 'https://example.com/images/bikeride.jpg', 150, 20, '2023-03-03 07:15:00'),
(14, 14, 'daniel_cook', 'Levée de soleil pittoresque. 🌄 #sunrise #landscape', 'https://example.com/images/sunrise.jpg', 300, 50, '2023-03-02 05:00:00'),
(15, 15, 'ava_hall', 'Petite escapade en montagne. 🏞️ #mountainescape #hiking', 'https://example.com/images/mountainescape.jpg', 200, 30, '2023-03-01 16:30:00'),
(16, 16, 'liam_wilson', 'Moment de détente avec un bon livre. 📚☕️ #reading #relaxation', 'https://example.com/images/reading.jpg', 260, 35, '2023-02-28 18:45:00'),
(17, 17, 'lily_smith', 'Pique-nique dans le parc. 🥪🌳 #picnic #park', 'https://example.com/images/picnic.jpg', 180, 25, '2023-02-27 11:00:00'),
(18, 18, 'ethan_jones', 'Exploration des ruelles de la vieille ville. 🏰🌇 #oldtown #exploration', 'https://example.com/images/oldtown.jpg', 220, 40, '2023-02-26 09:30:00'),
(19, 19, 'mia_davis', 'Nuit sous les étoiles. ✨🏕️ #camping #stargazing', 'https://example.com/images/camping.jpg', 320, 55, '2023-02-25 19:00:00'),
(20, 20, 'noah_taylor', 'Coucher de soleil sur la plage. 🌅🌊 #sunsetbeach #ocean', 'https://example.com/images/sunsetbeach.jpg', 280, 45, '2023-02-24 17:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Pseudo` varchar(50) NOT NULL,
  `Passwd` varchar(512) NOT NULL,
  `Publications` int(11) NOT NULL DEFAULT 0,
  `Followers` int(11) NOT NULL DEFAULT 0,
  `Following` int(11) NOT NULL DEFAULT 0,
  `Description` varchar(300) DEFAULT NULL,
  `Birthday` date NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `Email` varchar(250) NOT NULL,
  `Visibility` varchar(10) NOT NULL DEFAULT 'public',
  `PathProfilPicture` varchar(50) NOT NULL,
  `Genre` varchar(15) NOT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `Nom`, `Pseudo`, `Passwd`, `Publications`, `Followers`, `Following`, `Description`, `Birthday`, `isAdmin`, `Email`, `Visibility`, `PathProfilPicture`, `Genre`, `isVerified`) VALUES
(1, 'Quentin Pollet', 'QUINQUIN', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 0, 0, 'Salut c moi', '2004-10-15', 0, 'Quentinpol140@gmail.com', 'public', '/test', 'Homme', 0),
(7, 'tests', 'DJquinquin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 0, 0, NULL, '2024-03-14', 0, 'Quentinp40@gmail.com', 'public', '', '', 0),
(8, 'Hugo', 'hugo.tabary', 'b51431eee259cee024933f7823e758a5571e479859e4342cad907c7a28e6d94f', 0, 0, 0, NULL, '2005-03-28', 1, 'hugotabarylapro@gmail.com', 'public', '', '', 0),
(12, 'tests', 'sdsds', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 0, 0, NULL, '2024-03-07', 0, 'Quentinpoldfdfd140@gmail.com', 'public', '', '', 0),
(13, 'fdfd', 'dfddf', '427e170f76f81f7742e9da100d71346aa631acb3f9980a1a41680883c0654431', 0, 0, 0, NULL, '2024-03-11', 0, 'Qudfdfddfdfdfdentinpol140@gmail.com', 'public', '', '', 0),
(14, 'tests', 'fddfd', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, 0, 0, NULL, '2024-03-07', 0, 'dffddf@gmail.com', 'public', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Pseudo` (`Pseudo`,`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
