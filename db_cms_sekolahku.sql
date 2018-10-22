-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22 Okt 2018 pada 08.36
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_sekolahku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Akademik',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `is_active` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `type` bigint(20) NOT NULL DEFAULT '0',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `year` year(4) NOT NULL DEFAULT '0000',
  `organizer` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `title`, `url`, `target`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'http://sekolahku.web.id', '_blank', '1.png', '2018-04-02 01:52:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'President University', 'http://president.ac.id', '_blank', '2.png', '2018-04-02 01:52:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `sub_class` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) NOT NULL DEFAULT '0',
  `class_group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Kelas',
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) NOT NULL DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion` bigint(20) NOT NULL DEFAULT '0',
  `marital_status` bigint(20) NOT NULL DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institutions_lifter` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank` bigint(20) DEFAULT '0' COMMENT 'Pangkat / Golongan',
  `salary_source` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `skills_laboratory` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `handle_special_needs` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) NOT NULL DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_categories`
--

CREATE TABLE `file_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `file_categories`
--

INSERT INTO `file_categories` (`id`, `category`, `slug`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', '2018-04-02 01:52:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2018-04-02 01:52:03', NULL, '2018-10-22 05:08:31', NULL, NULL, NULL, 1, NULL, 'true'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2018-04-02 01:52:03', NULL, '2018-10-22 05:08:31', NULL, NULL, NULL, 1, NULL, 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `title`, `url`, `target`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'http://sekolahku.web.id', '_blank', '2018-04-02 01:52:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `position` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `parent_id`, `position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 4, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Gallery Photo', 'gallery-photo', '_self', 'modules', 9, 1, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Gallery Video', 'gallery-video', '_self', 'modules', 9, 2, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'PPDB 2017', '#', '_self', 'links', 0, 2, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'Gallery', '#', '_self', 'links', 0, 3, '2018-04-02 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'Profil Mts Al-Hidayah', '#', '', 'links', 0, 1, '2018-04-02 01:52:04', '2018-10-22 06:16:31', '2018-10-22 06:15:41', '2018-10-22 06:16:31', NULL, 1, 1, 1, 'false'),
(13, 'Visi dan Misi', 'read/2/visi-dan-misi', '_self', 'pages', 10, 2, '2018-10-22 05:50:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(14, 'Sejarah Mts Al-Hidayah', 'category/profil-mts-al-hidayah', '', 'post_categories', 10, 1, '2018-10-22 06:03:20', '2018-10-22 06:17:16', NULL, '2018-10-22 06:17:16', NULL, 1, NULL, 1, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'acl', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'Blog', 'Blog', 'blog', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'Media', 'Media', 'media', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'Peserta Didik / Mahasiswa', 'Peserta Didik / Mahasiswa', 'students', 'true', '2018-04-02 01:51:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(100) NOT NULL,
  `option` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `options`
--

INSERT INTO `options` (`id`, `group`, `option`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'student_status', 'Lulus', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'student_status', 'Mutasi', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'student_status', 'Dikeluarkan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'student_status', 'Putus Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'student_status', 'Meninggal', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'student_status', 'Hilang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'student_status', 'Lainnya', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'employment', 'Tidak bekerja', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, 'employment', 'Nelayan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(12, 'employment', 'Petani', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(13, 'employment', 'Peternak', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(14, 'employment', 'PNS/TNI/POLRI', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(15, 'employment', 'Karyawan Swasta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(16, 'employment', 'Pedagang Kecil', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(17, 'employment', 'Pedagang Besar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(18, 'employment', 'Wiraswasta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(19, 'employment', 'Wirausaha', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(20, 'employment', 'Buruh', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(21, 'employment', 'Pensiunan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(22, 'employment', 'Lain-lain', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(23, 'special_needs', 'Tidak', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(24, 'special_needs', 'Tuna Netra', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(30, 'special_needs', 'Tuna Laras', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(32, 'special_needs', 'Tuna ganda', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(33, 'special_needs', 'Hiper aktif', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(37, 'special_needs', 'Narkoba', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(38, 'special_needs', 'Indigo', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(39, 'special_needs', 'Down Sindrome', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(40, 'special_needs', 'Autis', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(41, 'special_needs', 'Lainnya', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(42, 'education', 'Tidak sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(43, 'education', 'Putus SD', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(44, 'education', 'SD Sederajat', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(45, 'education', 'SMP Sederajat', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(46, 'education', 'SMA Sederajat', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(47, 'education', 'D1', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(48, 'education', 'D2', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(49, 'education', 'D3', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(50, 'education', 'D4/S1', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(51, 'education', 'S2', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(52, 'education', 'S3', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(53, 'scholarship', 'Anak berprestasi', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(54, 'scholarship', 'Anak Miskin', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(55, 'scholarship', 'Pendidikan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(56, 'scholarship', 'Unggulan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(57, 'scholarship', 'Lain-lain', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(58, 'achievement_type', 'Sains', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(59, 'achievement_type', 'Seni', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(60, 'achievement_type', 'Olahraga', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(61, 'achievement_type', 'Lain-lain', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(62, 'achievement_level', 'Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(63, 'achievement_level', 'Kecamatan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(64, 'achievement_level', 'Kabupaten', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(65, 'achievement_level', 'Provinsi', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(66, 'achievement_level', 'Nasional', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(67, 'achievement_level', 'Internasional', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(68, 'monthly_income', 'Kurang dari 500,000', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(69, 'monthly_income', '500.000 - 999.9999', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(70, 'monthly_income', '1 Juta - 1.999.999', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(71, 'monthly_income', '2 Juta - 4.999.999', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(72, 'monthly_income', '5 Juta - 20 Juta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(73, 'monthly_income', 'Lebih dari 20 Juta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(74, 'residence', 'Bersama orang tua', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(75, 'residence', 'Wali', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(76, 'residence', 'Kos', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(77, 'residence', 'Asrama', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(78, 'residence', 'Panti Asuhan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(79, 'residence', 'Lainnya', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(80, 'transportation', 'Jalan kaki', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(81, 'transportation', 'Kendaraan pribadi', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(82, 'transportation', 'Kendaraan Umum / angkot / Pete-pete', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(83, 'transportation', 'Jemputan Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(84, 'transportation', 'Kereta Api', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(85, 'transportation', 'Ojek', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(86, 'transportation', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(87, 'transportation', 'Perahu penyebrangan / Rakit / Getek', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(88, 'transportation', 'Lainnya', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(89, 'religion', 'Islam', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(90, 'religion', 'kristen / protestan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(91, 'religion', 'Katholik', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(92, 'religion', 'Hindu', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(93, 'religion', 'Budha', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(94, 'religion', 'Khong Hu Chu', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(95, 'religion', 'Lainnya', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(96, 'school_level', '1 - Sekolah Dasar (SD)/ Sederajat', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(97, 'school_level', '2 - Sekolah Menengah Pertama (SMP)/ Sederajat', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(98, 'school_level', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(99, 'school_level', '4 - Sekolah Menengah Kejuruan (SMK)', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(100, 'school_level', '5 - Universitas', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(101, 'school_level', '6 - Sekolah Tinggi', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(102, 'school_level', '7 - Politeknik', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(103, 'marital_status', 'Kawin', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(104, 'marital_status', 'Belum Kawin', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(105, 'marital_status', 'Berpisah', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(106, 'institutions_lifter', 'Pemerintah Pusat', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(107, 'institutions_lifter', 'Pemerintah Provinsi', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(108, 'institutions_lifter', 'Pemerintah Kab/Kota', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(109, 'institutions_lifter', 'Ketua yaysan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(110, 'institutions_lifter', 'Kepala Sekolah', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(111, 'institutions_lifter', 'Komite Sekolah', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(112, 'institutions_lifter', 'Lainnya', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(113, 'employment_status', 'PNS ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(118, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(122, 'employment_status', 'CPNS', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(123, 'employment_status', 'Lainnya', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(124, 'employment_type', 'Guru Kelas', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(125, 'employment_type', 'Guru Mata Pelajaran', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(126, 'employment_type', 'Guru BK', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(127, 'employment_type', 'Guru Inklusi', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(128, 'employment_type', 'Tenaga Administrasi Sekola', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(129, 'employment_type', 'Gurtu Pendamping', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(130, 'employment_type', 'Guru Magang', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(131, 'employment_type', 'Guru TIK', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(132, 'employment_type', 'Laboran', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(133, 'employment_type', 'Pustakawan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(134, 'employment_type', 'Lainnya', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(135, 'rank', 'I/A', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(136, 'rank', 'I/B', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(137, 'rank', 'I/C', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(138, 'rank', 'I/D', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(139, 'rank', 'II/A', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(140, 'rank', 'II/B', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(141, 'rank', 'II/C', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(142, 'rank', 'II/D', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(143, 'rank', 'III/A', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(144, 'rank', 'III/B', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(145, 'rank', 'III/C', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(146, 'rank', 'III/D', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(147, 'rank', 'IV/A', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(148, 'rank', 'IV/B', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(149, 'rank', 'IV/C', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(150, 'rank', 'IV/D', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(151, 'rank', 'IV/E', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(152, 'salary_source', 'APBN', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(153, 'salary_source', 'APBD Provinsi', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(154, 'salary_source', 'APBD Kab/Kota', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(155, 'salary_source', 'Yaysan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(156, 'salary_source', 'Sekolah', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(157, 'salary_source', 'Lembaga Donor', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(158, 'salary_source', 'Lainnya', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(159, 'skills_laboratory', 'Lab IPA', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(160, 'skills_laboratory', 'Lab Fisika', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(161, 'skills_laboratory', 'Lab Biologi', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(162, 'skills_laboratory', 'Lab Kimia', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(163, 'skills_laboratory', 'Lab Bahasa', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(164, 'skills_laboratory', 'Lab Komputer', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(165, 'skills_laboratory', 'Teknik Bangunan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(166, 'skills_laboratory', 'Teknik Serveai & Pemetaan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(167, 'skills_laboratory', 'Teknik Ketenagakerjaan', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(168, 'skills_laboratory', 'Teknik Pendidnginan & Tata Udara', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(169, 'skills_laboratory', 'Teknik Mesin', '2018-04-02 01:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) NOT NULL DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'publish',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'open',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'headmaster_photo.png', 0, '', 'welcome', 'publish', 'public', 'open', '', '', 0, '2018-04-02 01:52:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Visi dan Misi', '<p><strong>VISI</strong></p>\n<p>Mewujudkan Sekolah berkualitas Meraih Prestasi Dengan memiliki Kompetensi serta menciptakan manusia berilmu dan&nbsp; berakhlakul karimah.</p>\n<p>&nbsp;<strong>MISI</strong></p>\n<ol>\n<li>Meningkatkan dan menerapkan disiplin seluruh warga sekolah yang terkait dengan menanamkan budaya tertib belajar dan budaya kerja</li>\n<li>Membina peserta didik berlandaskan iman dan ketaqwaan</li>\n<li>Terwujudnya lulusan yang cerdas ,berakhlak mulya dan berbudi pekerti</li>\n<li>Terwujudnya budaya keunggulan dalam prestasi akademik maupun non akademik</li>\n<li>Mengembangkan dan memacu profesionalisme guru dan pegawai guna terwujudnya pendidik dan tenaga pendidikan yang berkualitas</li>\n<li>Terpenuhinya sarana dan prasarana pendidikan sekolah sehingga terwujudnya lingkungan mendukung pembelajaran</li>\n<li>Terlaksananya kurikulum sekolah dan pengembangannya</li>\n<li>Terlaksananya manajemen berbasis sekolah</li>\n<li>Terwujudnya kualitas sistem penilaian sesuai Standar Nasional Pendidikan</li>\n<li>Mengembangkan layanan profesional dalam semangat kerjasama dan keteladanan guna meningkatkan prestasi kerja dan prestasi belajar siswa</li>\n</ol>', NULL, 1, '1', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 9, '2018-04-02 01:52:03', '2018-10-22 05:50:06', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(3, 'Sejarah Mts Al-Hidayah', '<p>Madrasah Tsanawiyah (Mts) Al Hidayah berdiri dibawah naungan Yayasan Pendidikan dan Perguruan Islam (YPPI) Al Hidayah, didirikan sebagai alternatif jawaban atas persoalan pendidikan yang berkembang di masyarakat. Masyarakat selama ini selalu dihadapkan dengan dua pilihan dalam pendidikan; pertama, jika masyarakat memilih pendidikan yang berbasis religi (agama) saja maka konskwensi yang diterima adalah kekurang mampuan lulusan tersebut dibidang sains (ilmu pengetahuan umum) padahal keilmuan ini sangat dibutuhkan untuk mengembangkan kehidupan yang lebih baik dan layak. Kedua, jika masyarak memilih pendidikan yang berbasis sains (ilmu pengetahuan umum), maka konsekuensi yang diterima adalah kekurangmampuan lulusan pendidikan tersebut dalam bidang religi (agama), padahal ilmuan agama sangat dibutuhkan sebagai pengendali hidup di dunia maupun di akhirat.</p>\n<p>MTs Al Hidayah berawal dari Madrasah Ibtidaiyah didirikan oleh masyarakat pada tahun 1980, pada tahun 1988 menjadi MTs Al Hidayah dan berhak menyelenggarakan pendidikan dan pengajaran, serta mengikuti Ujian Akhir Negara. Pada tanggal 1 Juni 1988 resmi menjadi MTs Al Hidayah dengan SK Kepala Kandepag Provinsi Lampung no: Wh/PP.00.5/1321/1999 Tanggal 2 September 1999, dan telah diperpanjang dengan nomor : KW.08.2/hk.00.8/331/2016 tanggal 4 November 2016 dan Keputusan Mentri Hukum Dan Hak Asasi Manusia Republik Indonesia Nomor: AHU-0033034.AH.01.04 Tahun 2016.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Kepala sekolah di MTs Al Hidayah sejak tahun 1989 sampai sekarang telah berganti sebanyak 5 kali adapun nama-nama kepala sekolah sebagai berikut: pertama, Drs. Samsul Ma&rsquo;arif menjadi kepala sekolah sejak tahun 1989 sampai dengan tahun 1995; kedua, Drs. Muhdar Nur K menjadi kepala sekolah sejak tahun 1995 sampai dengan 1999; ketiga, Haris Subardi menjadi kepala sekolah sejak tahun 1999 sampai dengan 2002; keempat, Dra. Listiati menjadi kepala sekolah dari tahun 2002 sampai dengan tahun 2007; kelima, Nurhayati,S.Pd. menjadi kepala sekolah sejak tahun 2007 sampai dengan sekarang.&nbsp;&nbsp;&nbsp;&nbsp;</p>', '09d683cba62e68e53760bd057afcb80b.jpg', 1, '2', 'post', 'publish', 'public', 'open', 'sejarah-mts-al-hidayah', 'berita, pengumuman, sekilas-info', 10, '2018-04-02 01:52:03', '2018-10-22 06:01:15', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(4, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2018-04-02 01:52:03', NULL, '2018-10-22 05:07:46', NULL, NULL, NULL, 1, NULL, 'true'),
(5, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2018-04-02 01:52:03', NULL, '2018-10-22 05:07:46', NULL, NULL, NULL, 1, NULL, 'true'),
(6, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2018-04-02 01:52:03', NULL, '2018-10-22 05:07:46', NULL, NULL, NULL, 1, NULL, 'true'),
(7, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2018-04-02 01:52:03', NULL, '2018-10-22 05:07:46', NULL, NULL, NULL, 1, NULL, 'true'),
(8, 'Visi dan Misi', '<p><strong>VISI</strong></p>\n<p>Mewujudkan Sekolah berkualitas Meraih Prestasi Dengan memiliki Kompetensi serta menciptakan manusia berilmu dan&nbsp; berakhlakul karimah.</p>\n<p>&nbsp;<strong>MISI</strong></p>\n<ol>\n<li>Meningkatkan dan menerapkan disiplin seluruh warga sekolah yang terkait dengan menanamkan budaya tertib belajar dan budaya kerja</li>\n<li>Membina peserta didik berlandaskan iman dan ketaqwaan</li>\n<li>Terwujudnya lulusan yang cerdas ,berakhlak mulya dan berbudi pekerti</li>\n<li>Terwujudnya budaya keunggulan dalam prestasi akademik maupun non akademik</li>\n<li>Mengembangkan dan memacu profesionalisme guru dan pegawai guna terwujudnya pendidik dan tenaga pendidikan yang berkualitas</li>\n<li>Terpenuhinya sarana dan prasarana pendidikan sekolah sehingga terwujudnya lingkungan mendukung pembelajaran</li>\n<li>Terlaksananya kurikulum sekolah dan pengembangannya</li>\n<li>Terlaksananya manajemen berbasis sekolah</li>\n<li>Terwujudnya kualitas sistem penilaian sesuai Standar Nasional Pendidikan</li>\n<li>Mengembangkan layanan profesional dalam semangat kerjasama dan keteladanan guna meningkatkan prestasi kerja dan prestasi belajar siswa</li>\n</ol>', NULL, 1, '', 'post', 'publish', 'public', 'open', 'visi-dan-misi', '', 0, '2018-10-22 05:45:24', '2018-10-22 06:06:49', '2018-10-22 06:11:11', '2018-10-22 06:07:18', 1, 1, 1, 1, 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_categories`
--

INSERT INTO `post_categories` (`id`, `category`, `slug`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', '2018-04-02 01:52:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Profil Mts Al-Hidayah', 'profil-mts-al-hidayah', NULL, '2018-10-22 04:58:56', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `registration_phases`
--

CREATE TABLE `registration_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000' COMMENT 'Tahun PPDB',
  `phase` varchar(255) NOT NULL COMMENT 'Gelombang / Fase Pendaftaran',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `registration_phases`
--

INSERT INTO `registration_phases` (`id`, `year`, `phase`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 2018, '1', '2018-10-18', '2018-10-27', '2018-10-09 14:14:52', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registration_quotas`
--

CREATE TABLE `registration_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000' COMMENT 'Tahun PPDB',
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Kuota yang diterima secara keseluruhan',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `type` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `start_year` year(4) NOT NULL DEFAULT '0000',
  `end_year` year(4) NOT NULL DEFAULT '0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(100) NOT NULL,
  `variable` varchar(255) DEFAULT NULL,
  `value` text,
  `default` text,
  `group_access` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `group`, `variable`, `value`, `default`, `group_access`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public, student, employee, administrator, super_user', 'Pemeliharaan situs', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Berakhir Pemeliharaan Situs', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public, student, employee, administrator, super_user', 'Cache situs', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public, student, employee, administrator, super_user', 'Lama Cache Situs', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public, student, employee, administrator, super_user', 'Deskripsi Meta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public, student, employee, administrator, super_user', 'Kata Kunci Meta', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'general', 'google_map_api_key', NULL, 'AIzaSyDmiycFxzYZ37FOwA4wqSbL3z2YvIYIArw', 'public, student, employee, administrator, super_user', 'API Key Google Map', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'general', 'latitude', NULL, '-6.2407311', 'public, student, employee, administrator, super_user', 'Latitude', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'general', 'longitude', NULL, '106.9972892', 'public, student, employee, administrator, super_user', 'Longitude', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'general', 'favicon', NULL, 'favicon.png', 'public, student, employee, administrator, super_user', 'Favicon', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, 'general', 'header', '0b0d10f984f56a6d1977c4ff989c5988.png', 'header.png', 'public, student, employee, administrator, super_user', 'Gambar Header', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(12, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(13, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', '', 'Recaptcha Secret Key', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(14, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public, student, employee, administrator, super_user', 'Time Zone', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(15, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public, student, employee, administrator, super_user', 'Tipe file yang diizinkan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(16, 'media', 'upload_max_filesize', NULL, '0', 'public, student, employee, administrator, super_user', 'Maksimal Ukuran File yang Diupload', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(17, 'media', 'thumbnail_size_height', NULL, '100', 'administrator, super_user', 'Tinggi Gambar Thumbnail', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(18, 'media', 'thumbnail_size_width', NULL, '150', 'administrator, super_user', 'Lebar Gambar Thumbnail', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(19, 'media', 'medium_size_height', NULL, '308', 'administrator, super_user', 'Tinggi Gambar Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(20, 'media', 'medium_size_width', NULL, '460', 'administrator, super_user', 'Lebar Gambar Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(21, 'media', 'large_size_height', NULL, '600', 'administrator, super_user', 'Tinggi Gambar Besar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(22, 'media', 'large_size_width', NULL, '800', 'administrator, super_user', 'Lebar Gambar Besar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(23, 'media', 'album_cover_height', NULL, '250', 'administrator, super_user', 'Tinggi Cover Album Photo', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(24, 'media', 'album_cover_width', NULL, '400', 'administrator, super_user', 'Lebar Cover Album Photo', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(25, 'media', 'banner_height', NULL, '81', 'administrator, super_user', 'Tinggi Iklan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(26, 'media', 'banner_width', NULL, '245', 'administrator, super_user', 'Lebar Iklan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(27, 'media', 'image_slider_height', NULL, '400', 'administrator, super_user', 'Tinggi Gambar Slide', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(28, 'media', 'image_slider_width', NULL, '900', 'administrator, super_user', 'Lebar Gambar Slide', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(29, 'media', 'student_photo_height', NULL, '170', 'public, student, employee, administrator, super_user', 'Tinggi Photo Peserta Didik', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(30, 'media', 'student_photo_width', NULL, '113', 'public, student, employee, administrator, super_user', 'Lebar Photo Peserta Didik', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(31, 'media', 'employee_photo_height', NULL, '170', 'employee, administrator, super_user', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(32, 'media', 'employee_photo_width', NULL, '113', 'employee, administrator, super_user', 'Lebar Photo Guru dan Tenaga Kependidikan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(33, 'media', 'headmaster_photo_height', NULL, '170', 'administrator, super_user', 'Tinggi Photo Kepala Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(34, 'media', 'headmaster_photo_width', NULL, '113', 'administrator, super_user', 'Lebar Photo Kepala Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(35, 'media', 'header_height', NULL, '80', 'administrator, super_user', 'Tinggi Gambar Header', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(36, 'media', 'header_width', NULL, '200', 'administrator, super_user', 'Lebar Gambar Header', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(37, 'media', 'logo_height', NULL, '120', 'administrator, super_user', 'Tinggi Logo Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(38, 'media', 'logo_width', NULL, '120', 'administrator, super_user', 'Lebar Logo Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(39, 'writing', 'default_post_category', NULL, '1', 'student, employee, administrator, super_user', 'Default Kategori Tulisan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(40, 'writing', 'default_post_status', NULL, 'publish', 'student, employee, administrator, super_user', 'Default Status Tulisan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(41, 'writing', 'default_post_visibility', NULL, 'public', 'student, employee, administrator, super_user', 'Default Akses Tulisan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(42, 'writing', 'default_post_discussion', NULL, 'open', 'student, employee, administrator, super_user', 'Default Komentar Tulisan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(43, 'writing', 'post_image_thumbnail_height', NULL, '100', 'student, employee, administrator, super_user', 'Tinggi Gambar Kecil', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(44, 'writing', 'post_image_thumbnail_width', NULL, '150', 'student, employee, administrator, super_user', 'Lebar Gambar Kecil', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(45, 'writing', 'post_image_medium_height', NULL, '250', 'student, employee, administrator, super_user', 'Tinggi Gambar Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(46, 'writing', 'post_image_medium_width', NULL, '400', 'student, employee, administrator, super_user', 'Lebar Gambar Sedang', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(47, 'writing', 'post_image_large_height', NULL, '450', 'student, employee, administrator, super_user', 'Tinggi Gambar Besar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(48, 'writing', 'post_image_large_width', NULL, '840', 'student, employee, administrator, super_user', 'Lebar Gambar Besar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(49, 'reading', 'post_per_page', NULL, '10', 'public, student, employee, administrator, super_user', 'Tulisan per halaman', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(50, 'reading', 'post_rss_count', NULL, '10', 'public, student, employee, administrator, super_user', 'Jumlah RSS', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(51, 'reading', 'post_related_count', NULL, '10', 'public, student, employee, administrator, super_user', 'Jumlah Tulisan Terkait', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(52, 'reading', 'comment_per_page', NULL, '10', 'public, student, employee, administrator, super_user', 'Komentar per halaman', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(53, 'discussion', 'comment_moderation', NULL, 'false', 'administrator, super_user', 'Komentar harus disetujui secara manual', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(54, 'discussion', 'comment_registration', NULL, 'false', 'public, student, employee, administrator, super_user', 'Pengguna harus terdaftar dan login untuk komentar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(55, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public, student, employee, administrator, super_user', 'Komentar disaring', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(56, 'discussion', 'comment_order', NULL, 'asc', 'public, student, employee, administrator, super_user', 'Urutan Komentar', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(57, 'social_account', 'facebook', NULL, '', 'public, student, employee, administrator, super_user', 'Facebook', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(58, 'social_account', 'twitter', NULL, '', 'public, student, employee, administrator, super_user', 'Twitter', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(59, 'social_account', 'google_plus', NULL, '', 'public, student, employee, administrator, super_user', 'Google Plus', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(60, 'social_account', 'linked_in', NULL, '', 'public, student, employee, administrator, super_user', 'Linked In', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(61, 'social_account', 'youtube', NULL, '', 'public, student, employee, administrator, super_user', 'Youtube', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(62, 'social_account', 'instagram', NULL, '', 'public, student, employee, administrator, super_user', 'Instagram', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(63, 'mail_server', 'sendgrid_username', NULL, '', 'administrator, super_user', 'Sendgrid Username', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(64, 'mail_server', 'sendgrid_password', NULL, '', 'administrator, super_user', 'Sendgrid Password', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(65, 'mail_server', 'sendgrid_api_key', NULL, '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', 'administrator, super_user', 'Sendgrid API Key', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(66, 'school_profile', 'npsn', NULL, '123', 'public, student, employee, administrator, super_user', 'NPSN', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(67, 'school_profile', 'school_name', 'Mts Al-Hidayah', 'SMA Negeri 9 Kuningan', 'public, student, employee, administrator, super_user', 'Nama Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(68, 'school_profile', 'headmaster', NULL, 'Anton Sofyan', 'public, student, employee, administrator, super_user', 'Kepala Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(69, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public, student, employee, administrator, super_user', 'Photo Kepala Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(70, 'school_profile', 'school_level', '2', '3', 'public, student, employee, administrator, super_user', 'Bentuk Pendidikan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(71, 'school_profile', 'school_status', NULL, '1', 'public, student, employee, administrator, super_user', 'Status Sekolah', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(72, 'school_profile', 'ownership_status', NULL, '1', 'administrator, super_user', 'Status Kepemilikan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(73, 'school_profile', 'decree_operating_permit', NULL, '-', 'administrator, super_user', 'SK Izin Operasional', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(74, 'school_profile', 'decree_operating_permit_date', NULL, '2018-04-02', 'administrator, super_user', 'Tanggal SK Izin Operasional', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(75, 'school_profile', 'tagline', '', 'Where Tomorrow\'s Leaders Come Together', 'public, student, employee, administrator, super_user', 'Slogan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(76, 'school_profile', 'rt', NULL, '12', 'public, student, employee, administrator, super_user', 'RT', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(77, 'school_profile', 'rw', NULL, '06', 'public, student, employee, administrator, super_user', 'RW', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(78, 'school_profile', 'sub_village', NULL, 'Wage', 'public, student, employee, administrator, super_user', 'Dusun', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(79, 'school_profile', 'village', NULL, 'Kadugede', 'public, student, employee, administrator, super_user', 'Kelurahan / Desa', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(80, 'school_profile', 'sub_district', NULL, 'Kadugede', 'public, student, employee, administrator, super_user', 'Kecamatan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(81, 'school_profile', 'district', 'Kota Bandar Lampung', 'Kuningan', 'public, student, employee, administrator, super_user', 'Kabupaten', '2018-04-02 01:51:58', '2018-10-09 13:51:49', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(82, 'school_profile', 'postal_code', NULL, '45561', 'public, student, employee, administrator, super_user', 'Kode Pos', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(83, 'school_profile', 'street_address', 'Jl. Nawawi Gelar Dalom, Rajabasa Jaya, Rajabasa, Kota Bandar Lampung, Lampung', 'Jalan Raya Kadugede No. 11', 'public, student, employee, administrator, super_user', 'Alamat Jalan', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(84, 'school_profile', 'phone', NULL, '0232123456', 'public, student, employee, administrator, super_user', 'Telepon', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(85, 'school_profile', 'fax', NULL, '0232123456', 'public, student, employee, administrator, super_user', 'Fax', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(86, 'school_profile', 'email', NULL, 'info@sman9kuningan.sch.id', 'public, student, employee, administrator, super_user', 'Email', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(87, 'school_profile', 'website', NULL, 'http://www.sman9kuningan.sch.id', 'public, student, employee, administrator, super_user', 'Website', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(88, 'school_profile', 'logo', NULL, 'logo.png', 'public, student, employee, administrator, super_user', 'Logo', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(89, 'admission', 'admission_status', NULL, 'open', 'public, student, employee, administrator, super_user', 'Status Penerimaan Peserta Didik Baru', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(90, 'admission', 'admission_year', NULL, '2018', 'public, student, employee, administrator, super_user', 'Tahun Penerimaan Peserta Didik Baru', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(91, 'admission', 'admission_start_date', NULL, '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Mulai PPDB', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(92, 'admission', 'admission_end_date', NULL, '2017-12-31', 'public, student, employee, administrator, super_user', 'Tanggal Selesai PPDB', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(93, 'admission', 'announcement_start_date', NULL, '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(94, 'admission', 'announcement_end_date', NULL, '2017-12-31', 'public, student, employee, administrator, super_user', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2018-04-02 01:51:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT NULL COMMENT 'Jurusan / Program Keahlian',
  `first_choice` bigint(20) DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice` bigint(20) DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB',
  `admission_phase_id` bigint(20) DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Calon Siswa Baru ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `is_alumni` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Alumni ?',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Student Aktif ?',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `nim` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Mahasiswa',
  `nis` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `diploma_number` varchar(50) DEFAULT NULL COMMENT 'No. Seri Ijazah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion` bigint(20) DEFAULT NULL,
  `special_needs` bigint(20) DEFAULT NULL COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence` bigint(20) DEFAULT NULL COMMENT 'Tempat Tinggal',
  `transportation` bigint(20) DEFAULT NULL COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education` bigint(20) DEFAULT '0',
  `father_employment` bigint(20) DEFAULT '0',
  `father_monthly_income` bigint(20) DEFAULT '0',
  `father_special_needs` bigint(20) DEFAULT '0',
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education` bigint(20) DEFAULT NULL,
  `mother_employment` bigint(20) DEFAULT NULL,
  `mother_monthly_income` bigint(20) DEFAULT NULL,
  `mother_special_needs` bigint(20) DEFAULT NULL,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education` bigint(20) DEFAULT NULL,
  `guardian_employment` bigint(6) DEFAULT NULL,
  `guardian_monthly_income` bigint(20) DEFAULT NULL,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(2) DEFAULT '0' COMMENT 'Jumlah Saudara Kandng',
  `student_status` bigint(20) DEFAULT NULL COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2018-04-02 01:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Pengumuman', 'pengumuman', '2018-04-02 01:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2018-04-02 01:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'sekilas-info', 'sekilas-info', '2018-10-22 05:06:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Cosmo', 'cosmo', 'Anton Sofyan', 'true', '2018-04-02 01:52:01', '2018-10-09 14:19:29', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(2, 'Flatly', 'flatly', 'Anton Sofyan', 'false', '2018-04-02 01:52:01', '2018-10-09 14:18:13', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(3, 'Journal', 'journal', 'Anton Sofyan', 'false', '2018-04-02 01:52:01', '2018-10-09 14:17:42', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(4, 'Simplex', 'simplex', 'Anton Sofyan', 'false', '2018-04-02 01:52:01', '2018-10-09 14:18:00', NULL, NULL, NULL, 1, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `biography` text,
  `user_registered` datetime DEFAULT NULL,
  `user_group_id` bigint(20) NOT NULL DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `forgot_password_key` varchar(100) DEFAULT NULL,
  `forgot_password_request_date` date DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'true',
  `is_logged_in` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `biography`, `user_registered`, `user_group_id`, `user_type`, `profile_id`, `forgot_password_key`, `forgot_password_request_date`, `is_active`, `is_logged_in`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Admin', '$2y$10$YaZadpEE8yiHVoWEz//Z1uxUGWGRLyOCb87mhdU8Hcn1EOzrQgZiO', 'Admin', 'admin@mail.com', NULL, NULL, '2018-10-09 20:45:31', 0, 'super_user', NULL, NULL, NULL, 'true', 'true', '2018-10-22 10:33:32', '::1', '2018-10-09 13:45:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('civph5r8urmgnkb30hhdgnkr9nfu57p9', '::1', 1540178378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534303137383337333b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31343a224d747320416c2d48696461796168223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a303a22223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a31393a224b6f74612042616e646172204c616d70756e67223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a37373a224a6c2e204e61776177692047656c61722044616c6f6d2c2052616a6162617361204a6179612c2052616a61626173612c204b6f74612042616e646172204c616d70756e672c204c616d70756e67223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d31302d3138223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d31302d3237223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031372d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031372d31322d3331223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2231223b7468656d657c733a353a22636f736d6f223b),
('bh24d5905c8ddk3obbtm8bj29s14gqbr', '::1', 1540179206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534303137393230363b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31343a224d747320416c2d48696461796168223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a303a22223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a31393a224b6f74612042616e646172204c616d70756e67223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a37373a224a6c2e204e61776177692047656c61722044616c6f6d2c2052616a6162617361204a6179612c2052616a61626173612c204b6f74612042616e646172204c616d70756e672c204c616d70756e67223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d31302d3138223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d31302d3237223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031372d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031372d31322d3331223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2231223b7468656d657c733a353a22636f736d6f223b69647c733a313a2231223b757365725f6e616d657c733a353a2241646d696e223b757365725f66756c6c5f6e616d657c733a353a2241646d696e223b757365725f656d61696c7c733a31343a2261646d696e406d61696c2e636f6d223b757365725f75726c7c4e3b757365725f726567697374657265647c733a31393a22323031382d31302d30392032303a34353a3331223b757365725f67726f75705f69647c733a313a2230223b757365725f747970657c733a31303a2273757065725f75736572223b70726f66696c655f69647c4e3b69735f6c6f676765645f696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a333a2261636c223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2273747564656e7473223b693a31333b733a373a2270726f66696c65223b7d7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22313730223b656d706c6f7965655f70686f746f5f77696474687c733a333a22313133223b686561646d61737465725f70686f746f5f6865696768747c733a333a22313730223b686561646d61737465725f70686f746f5f77696474687c733a333a22313133223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031382d30342d3032223b6b6579776f72647c733a373a2273656a61726168223b736964656261725f636f6c6c617073657c623a303b),
('fdh6ump43bfu8jglhdk4oivh92rujr83', '::1', 1540187970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534303138373937303b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a33363a2230623064313066393834663536613664313937376334666639383963353938382e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31343a224d747320416c2d48696461796168223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a303a22223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a31393a224b6f74612042616e646172204c616d70756e67223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a37373a224a6c2e204e61776177692047656c61722044616c6f6d2c2052616a6162617361204a6179612c2052616a61626173612c204b6f74612042616e646172204c616d70756e672c204c616d70756e67223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d31302d3138223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d31302d3237223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031372d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031372d31322d3331223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2231223b7468656d657c733a353a22636f736d6f223b),
('d4toc9usn7e266t932ee89hfa1m74dac', '::1', 1540189412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534303138393335343b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a33363a2230623064313066393834663536613664313937376334666639383963353938382e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31343a224d747320416c2d48696461796168223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a303a22223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a31393a224b6f74612042616e646172204c616d70756e67223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a37373a224a6c2e204e61776177692047656c61722044616c6f6d2c2052616a6162617361204a6179612c2052616a61626173612c204b6f74612042616e646172204c616d70756e672c204c616d70756e67223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d31302d3138223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d31302d3237223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031372d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031372d31322d3331223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2231223b7468656d657c733a353a22636f736d6f223b69647c733a313a2231223b757365725f6e616d657c733a353a2241646d696e223b757365725f66756c6c5f6e616d657c733a353a2241646d696e223b757365725f656d61696c7c733a31343a2261646d696e406d61696c2e636f6d223b757365725f75726c7c4e3b757365725f726567697374657265647c733a31393a22323031382d31302d30392032303a34353a3331223b757365725f67726f75705f69647c733a313a2230223b757365725f747970657c733a31303a2273757065725f75736572223b70726f66696c655f69647c4e3b69735f6c6f676765645f696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a333a2261636c223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2273747564656e7473223b693a31333b733a373a2270726f66696c65223b7d7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22313730223b656d706c6f7965655f70686f746f5f77696474687c733a333a22313133223b686561646d61737465725f70686f746f5f6865696768747c733a333a22313730223b686561646d61737465725f70686f746f5f77696474687c733a333a22313133223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031382d30342d3032223b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class`,`sub_class`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`student_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE,
  ADD KEY `class_group_settings_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `npwp` (`npwp`),
  ADD UNIQUE KEY `niy` (`niy`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `employees_spouse_employment__idx` (`spouse_employment`) USING BTREE,
  ADD KEY `employees_employment_status__idx` (`employment_status`) USING BTREE,
  ADD KEY `employees_employment_type__idx` (`employment_type`) USING BTREE,
  ADD KEY `employees_institutions_lifter__idx` (`institutions_lifter`) USING BTREE,
  ADD KEY `employees_rank__idx` (`rank`) USING BTREE,
  ADD KEY `employees_salary_source__idx` (`salary_source`) USING BTREE,
  ADD KEY `employees_skills_laboratory__idx` (`skills_laboratory`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `file_categories`
--
ALTER TABLE `file_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major` (`major`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`group`,`option`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `registration_phases`
--
ALTER TABLE `registration_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`year`,`phase`);

--
-- Indexes for table `registration_quotas`
--
ALTER TABLE `registration_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`year`,`major_id`,`quota`),
  ADD KEY `registration_student_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`group`,`variable`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice__idx` (`first_choice`) USING BTREE,
  ADD KEY `students_second_choice__idx` (`second_choice`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE;

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_url` (`user_url`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_profile_id__idx` (`profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group` (`group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_categories`
--
ALTER TABLE `file_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registration_phases`
--
ALTER TABLE `registration_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `registration_quotas`
--
ALTER TABLE `registration_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
