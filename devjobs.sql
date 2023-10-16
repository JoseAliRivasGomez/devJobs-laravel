/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `candidatos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `vacante_id` bigint unsigned NOT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatos_user_id_foreign` (`user_id`),
  KEY `candidatos_vacante_id_foreign` (`vacante_id`),
  CONSTRAINT `candidatos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidatos_vacante_id_foreign` FOREIGN KEY (`vacante_id`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `salarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vacantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salario_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_dia` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicado` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vacantes_salario_id_foreign` (`salario_id`),
  KEY `vacantes_categoria_id_foreign` (`categoria_id`),
  KEY `vacantes_user_id_foreign` (`user_id`),
  CONSTRAINT `vacantes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_salario_id_foreign` FOREIGN KEY (`salario_id`) REFERENCES `salarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(9, 3, 1, 'FJUPpmgH92vs7Y8ImjIJXhSG7QAC8Vgyhfmcv5bL.pdf', '2022-09-29 20:32:00', '2022-09-29 20:32:00');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(10, 3, 2, 'HiKZOcpBiCAhsmRhB3xq49BOyC3owN5typX0kvL4.pdf', '2022-09-29 20:34:08', '2022-09-29 20:34:08');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(11, 3, 3, 'b0N3lKtTPzKmHZmfaSBYXk9f5sLVm4PksZAx7BZ7.pdf', '2022-09-29 22:02:12', '2022-09-29 22:02:12');

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Backend Developer', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(2, 'Frontend Developer', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(3, 'Mobile Developer', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(4, 'Techlead', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(5, 'UX / UI Design', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(6, 'Software Architecture', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(7, 'Devops', '2022-09-27 00:13:15', '2022-09-27 00:13:15');



INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_26_214118_add_rol_to_users_table', 2),
(9, '2022_09_26_225026_create_salarios_table', 3),
(10, '2022_09_26_230049_create_categorias_table', 3),
(11, '2022_09_26_230050_create_vacantes_table', 3),
(12, '2022_09_29_192720_create_candidatos_table', 4),
(13, '2022_09_29_201951_create_notifications_table', 5);

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1de1aece-fd05-429d-8ac7-d71c7d09929a', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 2, '{\"id_vacante\":1,\"nombre_vacante\":\"React Native Developer\",\"id_usuario\":3}', '2022-09-29 22:02:28', '2022-09-29 20:32:02', '2022-09-29 22:02:28');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('4ef922d4-710b-4d63-a662-359ca5c6a040', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 2, '{\"id_vacante\":2,\"nombre_vacante\":\"Frontend Developer\",\"id_usuario\":3}', '2022-09-29 22:02:28', '2022-09-29 20:34:09', '2022-09-29 22:02:28');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6114d6b1-287f-4485-aabc-1c709d20da1a', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 2, '{\"id_vacante\":3,\"nombre_vacante\":\"UX Designer\",\"id_usuario\":3}', '2022-09-29 22:02:28', '2022-09-29 22:02:14', '2022-09-29 22:02:28');





INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(1, '$0 - $499', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(2, '$500 - $749', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(3, '$750 - $999', '2022-09-27 00:13:15', '2022-09-27 00:13:15');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(4, '$1000 - $1499', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(5, '$1500 - $1999', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(6, '$2000 - $2499', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(7, '$2500 - $2999', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(8, '$3000 - $4999', '2022-09-27 00:13:15', '2022-09-27 00:13:15'),
(9, '+$5000', '2022-09-27 00:13:15', '2022-09-27 00:13:15');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(2, 'Tommy Shelby', 'tommy@gmail.com', '2022-09-26 21:44:56', '$2y$10$SbG.OWiCpZeCuDJFuE4gNuclLUVzC8QAoy8YL3mYLP.Y5hTUbO8Q6', '1DiQMtPxpgksMBntYOaDuBC4k1qqOrofx2oenMTwJ3xSgAJqHyxAFeqKZ9fU', '2022-09-26 21:44:21', '2022-09-26 21:44:56', 2);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(3, 'Tony Soprano', 'tony@gmail.com', '2022-09-26 22:13:01', '$2y$10$BhhZnzkdhzA1e85k2kHVn.VyW3Og.sHVVu7DzlJ/u0RJBP5Yvw/2K', 'q9QtqHkS6rCON2ZDKg0JzdLvrnxwG4yrUb4BV9yNloBx6N6VOgWNjdl2gdbX', '2022-09-26 22:12:42', '2022-09-26 22:13:01', 1);


INSERT INTO `vacantes` (`id`, `titulo`, `salario_id`, `categoria_id`, `user_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `created_at`, `updated_at`) VALUES
(1, 'React Native Developer', 5, 2, 2, 'Netflix', '2022-10-08', 'React Native Developer', 'zyYGx1poespHjNkh4jq2bBcHT8rorzZtffO1hkpF.jpg', 1, '2022-09-27 00:58:46', '2022-09-27 03:45:37');
INSERT INTO `vacantes` (`id`, `titulo`, `salario_id`, `categoria_id`, `user_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `created_at`, `updated_at`) VALUES
(2, 'Frontend Developer', 4, 2, 2, 'Uber', '2022-10-06', 'Frontend Developer', 'ii233Yay8QqzM0tz6UdTGfJ3z4NoybQAiIpP4Nbh.jpg', 1, '2022-09-27 01:00:45', '2022-09-27 01:00:45');
INSERT INTO `vacantes` (`id`, `titulo`, `salario_id`, `categoria_id`, `user_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `created_at`, `updated_at`) VALUES
(3, 'UX Designer', 6, 5, 2, 'Spotify', '2022-10-05', 'UX Designer', 'pxMPpxqBGDdEpfOjokJznSwLNxYkZq83uCO4r6AP.jpg', 1, '2022-09-27 01:01:26', '2022-09-27 01:01:26');
INSERT INTO `vacantes` (`id`, `titulo`, `salario_id`, `categoria_id`, `user_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `created_at`, `updated_at`) VALUES
(4, 'React JS Developer', 5, 2, 2, 'Facebook', '2022-10-04', 'React JS Engineer', 'LTjrxP0F8EFJ06FUsRWc4KwygkKMK6zJ9aHbcApy.jpg', 1, '2022-09-27 01:01:57', '2022-09-27 03:18:46'),
(5, 'QA Engineer', 2, 6, 2, 'Encora', '2022-10-04', 'QA Engineer', '1qrORvWrPMosVwZHOkKkEd1sqEaxM4SLvZYTDapW.jpg', 1, '2022-09-27 01:02:33', '2022-09-27 01:02:33');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;