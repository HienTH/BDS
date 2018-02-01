-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th2 02, 2018 lúc 02:26 AM
-- Phiên bản máy phục vụ: 5.7.20-0ubuntu0.17.10.1
-- Phiên bản PHP: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bds`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user', 7, 'add_user'),
(20, 'Can change user', 7, 'change_user'),
(21, 'Can delete user', 7, 'delete_user'),
(22, 'Can add typeservice', 8, 'add_typeservice'),
(23, 'Can change typeservice', 8, 'change_typeservice'),
(24, 'Can delete typeservice', 8, 'delete_typeservice'),
(25, 'Can add duan', 9, 'add_duan'),
(26, 'Can change duan', 9, 'change_duan'),
(27, 'Can delete duan', 9, 'delete_duan'),
(28, 'Can add servicenode', 10, 'add_servicenode'),
(29, 'Can change servicenode', 10, 'change_servicenode'),
(30, 'Can delete servicenode', 10, 'delete_servicenode'),
(31, 'Can add coin', 11, 'add_coin'),
(32, 'Can change coin', 11, 'change_coin'),
(33, 'Can delete coin', 11, 'delete_coin'),
(34, 'Can add phancong', 12, 'add_phancong'),
(35, 'Can change phancong', 12, 'change_phancong'),
(36, 'Can delete phancong', 12, 'delete_phancong'),
(37, 'Can add loaiduan', 13, 'add_loaiduan'),
(38, 'Can change loaiduan', 13, 'change_loaiduan'),
(39, 'Can delete loaiduan', 13, 'delete_loaiduan'),
(40, 'Can add duanquantam', 14, 'add_duanquantam'),
(41, 'Can change duanquantam', 14, 'change_duanquantam'),
(42, 'Can delete duanquantam', 14, 'delete_duanquantam'),
(43, 'Can add groupnode', 15, 'add_groupnode'),
(44, 'Can change groupnode', 15, 'change_groupnode'),
(45, 'Can delete groupnode', 15, 'delete_groupnode'),
(46, 'Can add tiendo', 16, 'add_tiendo'),
(47, 'Can change tiendo', 16, 'change_tiendo'),
(48, 'Can delete tiendo', 16, 'delete_tiendo'),
(49, 'Can add history', 17, 'add_history'),
(50, 'Can change history', 17, 'change_history'),
(51, 'Can delete history', 17, 'delete_history'),
(52, 'Can add typerealestate', 18, 'add_typerealestate'),
(53, 'Can change typerealestate', 18, 'change_typerealestate'),
(54, 'Can delete typerealestate', 18, 'delete_typerealestate'),
(55, 'Can add mod', 19, 'add_mod'),
(56, 'Can change mod', 19, 'change_mod'),
(57, 'Can delete mod', 19, 'delete_mod'),
(58, 'Can add realestatenode', 20, 'add_realestatenode'),
(59, 'Can change realestatenode', 20, 'change_realestatenode'),
(60, 'Can delete realestatenode', 20, 'delete_realestatenode'),
(61, 'Can add admin', 21, 'add_admin'),
(62, 'Can change admin', 21, 'change_admin'),
(63, 'Can delete admin', 21, 'delete_admin'),
(64, 'Can add phanhoi', 22, 'add_phanhoi'),
(65, 'Can change phanhoi', 22, 'change_phanhoi'),
(66, 'Can delete phanhoi', 22, 'delete_phanhoi'),
(67, 'Can add thongbaouser', 23, 'add_thongbaouser'),
(68, 'Can change thongbaouser', 23, 'change_thongbaouser'),
(69, 'Can delete thongbaouser', 23, 'delete_thongbaouser'),
(70, 'Can add thongbao', 24, 'add_thongbao'),
(71, 'Can change thongbao', 24, 'change_thongbao'),
(72, 'Can delete thongbao', 24, 'delete_thongbao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$u6RTjWdSVl4a$beT11Jn1hYStba9Sy/Xh9VMA+RRGhDXeaCNyQklAZfY=', '2018-01-25 15:59:42.041150', 1, 'hienhd', '', '', 'haduchienmtat32@gmail.com', 1, 1, '2018-01-25 15:59:05.146189');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_admin`
--

CREATE TABLE `companies_admin` (
  `id` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_admin`
--

INSERT INTO `companies_admin` (`id`, `username`, `password`, `name`, `rank`) VALUES
('admin1', 'trung', 'sha256$C1WPB4vR$dec2eb13ab1d728ca52b666d7c32b54fa548097ffd3586576a35f533a48223c7', 'Lê Trung', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_coin`
--

CREATE TABLE `companies_coin` (
  `id` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `typerealestate_id` varchar(20) DEFAULT NULL,
  `vip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_coin`
--

INSERT INTO `companies_coin` (`id`, `coin`, `rank`, `typerealestate_id`, `vip`) VALUES
(1, 10, 1, NULL, 0),
(2, 20, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_duan`
--

CREATE TABLE `companies_duan` (
  `id` varchar(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `address` longtext NOT NULL,
  `tinh` varchar(200) NOT NULL,
  `huyen` varchar(200) NOT NULL,
  `xa` varchar(200) NOT NULL,
  `details_address` longtext,
  `intro` longtext,
  `status` tinyint(1) NOT NULL,
  `pricefrom` double DEFAULT NULL,
  `infoduan` longtext,
  `tiendo` varchar(300) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `thumbs` longtext,
  `uutien` int(11) NOT NULL,
  `timecreate` datetime(6) NOT NULL,
  `timemodify` datetime(6) NOT NULL,
  `modname_id` varchar(20) DEFAULT NULL,
  `type_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_duan`
--

INSERT INTO `companies_duan` (`id`, `name`, `address`, `tinh`, `huyen`, `xa`, `details_address`, `intro`, `status`, `pricefrom`, `infoduan`, `tiendo`, `latitude`, `longitude`, `thumbs`, `uutien`, `timecreate`, `timemodify`, `modname_id`, `type_id`) VALUES
('0DB2E50A9D6A41FE', 'Khu căn hộ Vĩnh Lộc', 'Đường Hương lộ 80, xã Vĩnh Lộc A, Bình Chánh, Tp.HCM', 'Hồ Chí Minh', 'Bình Chánh', 'Vĩnh Lộc', NULL, 'Thông tin tổng quan dự án Khu căn hộ VĨnh Lộc thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu VĨNh Lộc, Hồ Chí Minḥ\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 10.8087320327759, 106.571517944336, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1'),
('152EB89AAE54442C', 'CT1 Trung Văn - Vinaconex 3', 'Đường Trung Văn, Xã Trung Văn, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Trung Văn', NULL, 'Thông tin tổng quan dự án CT1 Trung Văn - Vinaconex 3 hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị CT1 Trung Văn - Vinaconex 3Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9936695098877, 105.778076171875, 'http://nguyenhoangtrong.com/wp-content/uploads/2014/09/chung-cu-ct1-trung-van-vinaconex3-1.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan1'),
('2956060C61C140CA', 'HH1 Linh Đàm', 'Đường Linh Đường, Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, 'Thông tin tổng quan dự án HH1 Linh Đàm xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới HH1 Linh Đàm Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9647350311279, 105.826362609863, 'http://chungcuhh1linhdam.sanhathanh.com/uploads/News/chung-cu-hh1-linh-dam-1.png,http://tvigroup.vn/Content/Images/Project/122014/hh%20Linh%20Dam.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan1'),
('5BB00D5F0D9649E4', 'Khu đô thị mới Dương Nội', 'Đường Tố Hữu, Phường La Khê, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'La Khê', NULL, 'Thông tin tổng quan dự án Khu đô thị mới Dương Nội thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Dương Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9719924926758, 105.756340026855, 'http://www.canhogiadinhviet.com/upload/category/danh-gia-vi-tri-tien-ich-can-ho-the-cbd-premium-home-quan-2-1498666539.jpg,http://sanphuongdong.vn/webroot/img/images/khu-do-thi-duong-noi(1).jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod200', 'loaiduan1'),
('63AB0D377C1A409E', 'CT1 Trung Văn - Vinaconex 3', 'Đường Trung Văn, Xã Trung Văn, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Trung Văn', NULL, 'Thông tin tổng quan dự án CT1 Trung Văn - Vinaconex 3 hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị CT1 Trung Văn - Vinaconex 3Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9936695098877, 105.778076171875, 'http://nhadathanoivn.com/admin/webroot/upload/image/images/1988.jpg,http://2.bp.blogspot.com/-eU2CKL2dj4w/UyswnU_kHYI/AAAAAAAAB5k/2920HT6dbYI/s1600/chung-cu-ct1-trung-van-vinaconex3-tong-the.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan1'),
('8BDFDD510E0C4739', 'Gamuda tinh', 'Phố Yên Duyên, Phường Yên Sở, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai,', 'Yên Sở', NULL, 'Thông tin tổng quan dự án Gamuda tinhthức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Gamuda tinhnTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9698810577393, 105.871681213379, 'http://gamudacityvip.com/wp-content/uploads/2016/01/%5E47241A0CD7B3BF9BACB9F75A2A1658B6142A1475CFB4708E5F%5Epimgpsh_fullsize_distr-2.jpg,https://media.laodong.vn/Uploaded/hoangtragiang/2016_07_10/Fa_twoResidence_aerialView.resized_HPQQ.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan1'),
('B379F7C94DE640C7', 'Sky Park Residence', 'Đường Tôn Thất Thuyết, Phường Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng Hậu', NULL, 'Thông tin tổng quan dự án Sky Park Residence xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Sky Park Residence Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.0277194976807, 105.78589630127, 'http://chungcuskypark.net/wp-content/uploads/2017/02/chung-cu-sky-park-residene.png,http://nhadatxanhmienbac.com/wp-content/uploads/2017/12/du-an-chung-cu-golden-park-duong-dinh-nghe-so-2-pham-van-bach-01.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1'),
('B6A7CCE71E754B29', 'The Premier Hà Nội', 'Đường Tôn Thất Thuyết, Phường Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng Hậu', NULL, 'Thông tin tổng quan dự án The Premier Hà Nộithức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án The Premier Hà Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.0291118621826, 105.784629821777, 'https://static.bancong.vn/images/1184x466/projects/1184_466/2017/09/29/the_premier_2.jpg,https://media.sosanhnha.com/batdongsan/2017/03/23/1490205629-the-premier-ha-noi-tai-duong-ton-that-thuyet-phuong-dich-vong-hau-cau-giay-ha-no-i-picture3425.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1'),
('D7493DD5611C4E42', 'HH1 Linh Đàm', 'Đường Linh Đường, Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, 'Thông tin tổng quan dự án HH1 Linh Đàm xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới HH1 Linh Đàm Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9647350311279, 105.826362609863, NULL, 3, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1'),
('duan1', 'C7 Giảng Võ', 'Đường Trần Huy Liệu, Phường Giảng Võ, Ba Đình, Hà Nội', 'Hà Nội', 'Ba Đình', 'Giảng Võ', NULL, 'Thông tin tổng quan dự án C7 Giảng Võ\nNhà C7 Giảng Võ là tòa nhà đầu tiên được xây lại với phương thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.\n \n- Tên dự án: Chung cư C7 Giảng Võ\n- Vị trí dự án: Đường Trần Huy Liệu, phường Giảng Võ, quận Ba Đình, TP.Hà Nội.\n- Chủ đầu tư: Công ty CP tư vấn, đầu tư và phát triển nhà Hà Nội - HANDIC\n- Đơn vị thi công: Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36\n- Đơn vị tư vấn: Công ty cổ phần tư vấn xây dựng An Khánh\n- Tổng mức đầu tư: 91 tỷ đồng\n- Diện tích khu đất: 1660,7 m2\n- Diện tích xây dựng: 653,9 m2\n- Quy mô: 17 tầng với 1 tầng hầm\n- Diện tích đất sân vườn và cây xanh: 1000m2\n- Tổng mức đầu tư 91 Tỷ đồng', 1, 1.5, 'Tên dự án C7 Giảng Võ\nĐịa chỉĐường Trần Huy Liệu, Phường Giảng Võ, Ba Đình, Hà Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.027744, 105.822208, 'http://img.thuechungcuhn.com//2016/07/14/20160714164310-9ee5.jpg,http://cdn.home-designing.com/wp-content/uploads/2012/06/Modern-interior-grafitti-art.jpg,http://www.alanyahomes.net/wp-content/uploads/2017/01/small-apartment-design.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan1'),
('duan10', 'Vườn Lài Village\r\n', 'Đường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM\n', 'Hồ Chí Minh', 'Quận 12', 'An Phú', NULL, 'Thông tin dự án Vườn Lài Village\r\nVườn Lài Village nằm trên đường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM. Dự án được phân lô khoa học, đa dạng diện tích, tận dụng tối đa diện tích cây xanh và diện tích sử dụng. Đây hứa hẹn sẽ là nơi an cư và đầu tư lý tưởng cho khách hàng.\r\n- Tên dự án: Vườn Lài Village\r\n- Chủ đầu tư: Công ty CP BĐS Linkhouse\r\n- Tổng diện tích: 2,370.4m2\r\n- Diện tích xây dựng: 1,602.4m2\r\n- Tỷ lệ xây dựng: 67,6%\r\n- Các loại diện tích: 52m2, 54m2, 58m2, 61m2, 62m2, 63m2, 64m2, 65m2, 66m2, 67m2, 68m2, 70m2, 72m2, 85m2, 96m2...', 1, 3.3, 'Tên dự án Vườn Lài Village\r\nĐịa chỉĐường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM\r\nTổng diện tích2.370 m²\r\nDiện tích xây dựng1.602 m²\r\nLoại hình phát triểnBiệt thự liền kề', NULL, 10.863539, 106.690548, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan10'),
('duan11', 'HC Golden City\r\n', 'Tổ 10, phường Bồ Đề, Long Biên, Hà Nội\r\n', 'Hà Nội', 'Long Biên', 'Bồ Đề', NULL, 'Thông tin dự án HC Golden City\r\nHC Golden City (liền kề 319 Bồ Đề) thuộc tổ 10 phường Bồ Đề, quận Long Biên, Hà Nội. Dự án nằm ngay bên cạnh tuyến đường Nguyễn Văn Cừ, gần trung tâm Aeon, cách khu vực phố Cổ chưa tới 4km.\r\n- Tên dự án: HC Golden City\r\n- Chủ đầu tư: Công ty 319 Bộ Quốc phòng\r\n- Quy mô: Gồm gần 100 lô liền kề, biệt thự\r\n- Loại hình: Liền kề, Shophouse, căn hộ cao cấp, biệt thự cao cấp...', 1, 3, 'Tên dự án HC Golden City\r\nChủ đầu tưCông ty xây dựng 319 Bộ Quốc phòng\r\nĐịa chỉTổ 10, phường Bồ Đề, Long Biên, Hà Nội\r\nLoại hình phát triểnBiệt thự liền kề\r\nGiá bán70 triệu/m²\r\nQuy mô dự ánGần 100 lô liền kề, biệt thự', NULL, 21.037956, 105.872865, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan10'),
('duan2', 'Hà Nội Aqua Central', 'Số 44 Yên Phụ, phường Trúc Bạch, quận Ba Đình, Hà Nội', 'Hà Nội', 'Ba Đình', 'Trúc Bạch', NULL, 'Thông tin dự án Hà Nội Aqua Central\nHà Nội Aqua Central - 44 Yên Phụ là dự án chung cư cao 21 tầng với tổng cộng 238 căn hộ và penthouse. Các căn hộ tại dự án được lắp đặt đầy đủ nội thất gắn tường từ những thương hiệu nổi tiếng đến từ Hoa Kỳ, Nhật Bản và châu Âu với phong cách hài hòa, bố cục sang trọng, màu sắc trang nhã.\nChung cư 44 Yên Phụ được thiết kế vườn cảnh trong các căn hộ đem tới không gian tươi mát, gần gũi thiên nhiên, ngập tràn gió trời và ánh nắng, không gian sống vô cùng tinh tế thể hiện tích cách con người và văn hóa đặc trưng của Phố cổ Hà Nội.\n- Tên dự án: Hà Nội Aqua Central - chung cư 44 Yên Phụ\n- Loại hình: Tòa nhà hỗn hợp văn phòng, thương mại dịch vụ khách sạn và căn hộ thương mại cao cấp\n- Chủ đầu tư: Công ty CP Tháp nước Hà Nội\n- Đơn vị thi công: Sông Đà 207 và Long Giang\n- Tổng diện tích: 6.468m2\n- Mật độ xây dựng: 50.6%\n- Quy mô: Tòa nhà 21 tầng, trong đó:\n+ Tầng hầm: 3 tầng hầm, tổng diện tích 9894m2\n+ Tầng 1-3: Trung tâm thương mại\n+ Tầng 4 -20: Căn hộ thương mại (tầng 21A-21B: căn Penthouse)\n- Thời gian khởi công: 08/2016\n- Dự kiến hoàn thành: 10/2018', 1, 2, 'Tên dự án Hà Nội Aqua Central\nChủ đầu tưCông ty CP Tháp nước Hà Nội\nĐịa chỉSố 44 Yên Phụ, phường Trúc Bạch, quận Ba Đình, Hà Nội\nTổng diện tích6.468 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàTháng 10/2018\nGiá bán60 triệu/m²\nQuy mô dự ánTòa nhà 21 tầng nổi và 3 tầng hầm', NULL, 21.047574, 105.809298, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan1'),
('duan3', 'TRÚC BẠCH BUILDING', '141 Hoàng Hoa Thám, Phường Nghĩa Đô, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Nghĩa Đô', NULL, 'HAREC Building là một tòa nhà cho thuê văn phòng hạng B, được trang bị hệ thống cơ sở hạ tầng hiện đại và quản lý chuyên nghiệp. Với trang thiết bị đồng bộ, công nghệ thông tin hiện đại, nội thất đẹp tràn đầy ánh sáng tự nhiên, mỗi tầng rộng 735 m2 rất tiện lợi để làm văn phòng cho các công ty trong và ngoài nước.\nDự án là một trong những rất ít tòa nhà tại Hà Nội có 2 tầng hầm làm nơi để xe với hai cửa ra, vào riêng biệt. Tòa nhà 15 tầng với tổng diện tích thuê 9000m2 được trang bị đầy đủ tiện nghi, hệ thống báo khói, chữa cháy tự động, hệ thống camera hiện đại, điều hòa trung tâm, máy phát dự phòng và đảm bảo các quy định về an ninh, an toàn. Hệ thống giao thông nội bộ xung quanh tòa nhà tạo nên một không gian kiến trúc độc lập, trang nhã thuận tiện, đủ khả năng đáp ứng nhu cầu đa dạng về thuê văn phòng.\nNhững lợi thế cạnh tranh:\n- Quản lý bởi công ty nổi tiếng Quốc tế chuyên nghiệp SAVILLS\n- Địa thế tốt, vị trí thuận lợi, ở gần các ngân hàng lớn trung tâm thương mại, hội chợ\n- Giao thông thuận tiện, hai làn đường\n- Quang cảnh đẹp, môi trường tốt, không gian thoáng đãng\n- Giá thuê hấp dẫn\n- Dịch vụ chuyên nghiệp', 1, 2.5, 'Trúc Bạch Building\n141 Hoàng Hoa Thám, Phường Ngọc Hà, Ba Đình, Hà Nội\nGiá từ: Đang cập nhật\nChủ đầu tư: Công ty CP Đầu tư Trúc Bạch\nDiện tích: Đang cập nhật\nTiến độ: Đã hoàn thành', NULL, 21.048715, 105.839746, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan2'),
('duan4', 'ROSE GARDEN', 'Đống Đa, Hà Nội', 'Hà Nội', 'Đống Đa', 'Ngọc Khánh', NULL, 'Rose Garden Residences tọa lạc tại 170 Ngọc Khánh, phường Giảng Võ, Ba Đình, Hà Nội. Dự án là một khách sạn gồm các căn hộ tự phục vụ nằm cách Khu Phố Cổ ở TP. Hà Nội 10 phút lái xe, chỉ với 8 phút để đi đến Hồ Tây.', 1, 3, 'Tên dự án Rose Garden\nĐịa chỉ170 Ngọc Khánh, Phường Giảng Võ, Ba Đình, Hà Nội\nTổng diện tích2.650 m²\nLoại hình phát triểnCao ốc văn phòng\nBàn giao nhà2013\nQuy mô dự án1 block 17 tầng', NULL, 21.025043, 105.818785, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan2'),
('duan5', 'LePARC by Gamuda', 'Đường Pháp Vân, Phường Yên Sở, Hoàng Mai, Hà Nội', 'Hà Nội', 'Ba Đình', 'Phúc Xá', NULL, 'Thông tin dự án LePARC by Gamuda\nLePARC by Gamuda là 1 trong 4 dự án con của Gamuda City. Đây là khu bán lẻ đầu tiên do Gamuda Land đầu tư phát triển ở Việt Nam. Dự án sở hữu vị trí chiến lược cửa ngõ phía Nam Thủ đô, ngay sát đường cao tốc trên cao và đường vành đai 3, cách trung tâm TP. Hà Nội 10km về phía Nam.\nLà trái tim của Gamuda City, LePARC by Gamuda có cảnh quan xanh tươi, chỉ cách công viên Yên Sở với diện tích lớn tới 320 ha vài bước chân, nơi được coi là lá phổi xanh của thành phố. Từ dự án, cư dân dễ dàng kết nối với những khu vực lân cận của Hà Nội và những tỉnh phía Bắc.\n- Tên chính thức: LePARC by Gamuda\n- Loại hình: Tổ hợp khu vui chơi giải trí mua sắm và thư giãn trong không gian xanh của công viên Yên Sở\n- Chủ đầu tư: Gamuda Land Việt Nam\n- Đơn vị tư vấn bán hàng và tiếp thị độc quyền: CBRE (Việt Nam)\n- Tổng diện tích sử dụng: 8998m2\n- Thời hạn thuê: 5 năm\n- Số phòng: 214 đơn vị diện tích cho thuê\n- Diện tích đậu xe: 2000 xe\n- Thời gian hoạt động: Từ tháng 5/2016', 1, 3, 'Tên dự án LePARC by Gamuda\nChủ đầu tưCông ty CP Gamuda Land Việt Nam\nĐịa chỉĐường Pháp Vân, Phường Yên Sở, Hoàng Mai, Hà Nội\nDiện tích xây dựng8.998 m²\nLoại hình phát triểnTrung tâm thương mại\nBàn giao nhàQuý IV/2016\nGiá bán16.8 triệu/m²\nQuy mô dự ánTổ hợp khu vui chơi giải trí', NULL, 20.962948, 105.85385, NULL, 3, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod200', 'loaiduan3'),
('duan6', 'HDB Plaza', 'Xã Thanh Liệt, Thanh Trì, Hà Nội', 'Hà Nội', 'Thanh Trì', 'Thanh Liệt', NULL, 'Thông tin dự án HDB Plaza\r\nHDB Plaza nằm trên tuyến đường được xem là trung tâm thương mại và dịch vụ của huyện Thanh Trì, là cầu nối giao thông giữa Hà Đông với tuyến đường thuộc Quốc lộ 1A cũ. Dự án có vị trí vô cùng thuận lợi, dễ dàng kết nối với các vùng lân cận thông qua nhiều tuyến đường được quy hoạch mở rộng.\r\nVới đầy đủ các công năng như trung tâm thương mại, dịch vụ, văn phòng và căn hộ cao cấp, lại nằm trong khu vực có tốc độ đô thị hóa và sự tăng trưởng kinh tế rất nhanh của thành phố, HDB Plaza sẽ là một trong những địa điểm làm việc lý tưởng của nhiều doanh nghiệp.\r\nNằm trên diện tích 2 ha tại Hà Nội trên tuyến đường vành đai 3 của thành phố đang được đầu tư xây dựng với 3 toàn tháp cao trên 100m với đầy đủ các công năng như trung tâm thương mại, dịch vụ, văn phòng và căn hộ cao cấp. Đây là 1 dự án trọng điểm của Tập đoàn với tổng mức đầu tư hơn 1.500 tỷ đồng\r\n\r\n- Tên dự án: HDB Plaza\r\n- Chủ đầu tư: Công ty CP Tập đoàn HDB Việt Nam\r\n- Diện tích đất dự án: 20.479m2\r\n- Diện tích đất xây dựng: 8.800m2\r\n- Chiều cao: 30-33 Tầng, gồm 4 toàn tháp hiện đại', 1, 1.5, 'Tên dự án HDB Plaza\nChủ đầu tưCông ty CP Tập đoàn HDB Việt Nam\nĐịa chỉXã Thanh Liệt, Thanh Trì, Hà Nội\nTổng diện tích20.479 m²\nLoại hình phát triểnTrung tâm thương mại\nQuy mô dự ánDự án gồm 4 tòa tháp hiện đại, mỗi tòa cao 30 - 33 tầng', NULL, 21.016772, 105.823392, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod200', 'loaiduan3'),
('duan7', 'Thuần Nghệ Green City', 'Thuần Nghệ, Sơn Tây, Hà Nội', 'Hà Nội', 'Sơn Tây', 'Thuần Nghệ', NULL, 'Thông tin tổng quan dự án Thuần Nghệ Green City\r\nSở hữu vị trí đắc địa tại thị xã và được thiết kế theo phong cách tân cổ điển mang đến giá trị cao cho chủ nhân tương lai, Thuần Nghệ Green City được kỳ vọng sẽ trở thành khu đô thị đẳng cấp bậc nhât Sơn Tây. Dự án được đầu tư bởi Công ty CP Tập đoàn Xây dựng và Du lịch Bình Minh với quy mô 16 lô biệt thự và 231 lô liền kề.\r\n- Tên dự án: Khu đô thị nhà ở Thuần Nghệ  (Green City)\r\n- Chủ đầu tư: Công ty CP Tập đoàn Xây dựng và Du lịch Bình Minh\r\n- Mô hình: Khu đô thị phức hợp nhà ở kết hợp Trung tâm thương mại\r\n- Loại hình sản phẩm: Biệt thự đơn lập và liền kề\r\n- Vị trí: Thuần Nghệ, thị xã Sơn Tây, Hà Nội\r\n- Tổng diện tích dự án: 30.000m2\r\n- Tổng số sản phẩm: 247 lô\r\n- Biệt thự: gồm 16 lô (diện tích từ 250-400m2)\r\n- Liền kề: gồm 231 lô  (các loại diện tích: 75-85-90-102-120m2)\r\n- Giá bán 15.000.000 đồng/m2\r\n- Hình thức sở hữu: Vĩnh viễn', 1, 2.2, 'Tên dự án Thuần Nghệ Green City\r\nĐịa chỉThuần Nghệ, Sơn Tây, Hà Nội\r\nTổng diện tích300.000 m²\r\nLoại hình phát triểnKhu đô thị mới\r\nGiá bán15 triệu/m²\r\nQuy mô dự án247 lô đất nền', NULL, 21.136698, 105.509634, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan4'),
('duan8', 'T&T Tower\r\n', '120 Đường Định Công, Phường Định Công, Hoàng Mai, Hà Nội\r\n', 'Hà Nội', 'Hoàng Mai', 'Định Công', NULL, 'Thông tin tổng quan dự án T&T Tower \r\nT&T Tower là dự án được đầu tư bởi Liên danh Công ty CP Tập đoàn T&T và Công ty CP Dịch vụ Vận tải Đường sắt với quy mô 3 tầng hầm, 6 tầng đế, 21 tầng căn hộ. \r\nVới chủ đầu tư uy tín có bề dày kinh nghiệm và khẳng định được vị thế trong giới bất động sản, dự án căn hộ cao cấp T&T Tower chắc chắn sẽ là sự lựa chọn lý tưởng cho những khách hàng đang tìm kiếm không gian sống đẳng cấp cao với chất lượng tuyệt hảo.\r\nVới sự đồng nhất trong thiết kế, lối kiến trúc mở, các căn hộ tại dự án khiến chủ nhân hoàn toàn yên tâm về không gian sống cũng như việc vận dụng các yếu tố phong thuỷ vào bài trí, thiết kế mà vẫn giữ được sự sang trọng và đẳng cấp.\r\n- Tên dự án: T&T Tower 120 Định Công\r\n- Chủ đầu tư: Liên danh Công ty CP Tập đoàn T&T và Công ty CP Dịch vụ Vận tải Đường sắt\r\n- Tư vấn thiết kế: Công ty CP Đầu tư & Tư vấn Công nghệ Xây dựng Archivina\r\n- Vị trí: Số 120 Định Công, phường Định Công, quận Hoàng Mai, Hà Nội\r\n- Diện tích khu đất: 7.958m2 \r\n- Diện tích xây dựng: 6.163m2\r\n- Diện tích đất mở đường quy hoạch: 1.795m2\r\n- Mật độ xây dựng: 60%\r\n- Quy mô: 3 tầng hầm, 6 tầng đế, 21 tầng căn hộ\r\n- Số lượng sản phẩm: 40 lô biệt thự liền kề với diện tích 80-100m2 đất và 300 căn hộ \r\n- Quy mô dân số: 1.000 người\r\n- Thời gian bàn giao dự kiến: Tháng 10/2018', 1, 1.8, 'Tên dự án T&T Tower\r\nChủ đầu tưCông ty CP Tập đoàn T&T\r\nĐịa chỉ120 Đường Định Công, Phường Định Công, Hoàng Mai, Hà Nội\r\nTổng diện tích7.958 m²\r\nDiện tích xây dựng6.163 m²\r\nLoại hình phát triểnKhu phức hợp', NULL, 20.98367, 105.821986, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan5'),
('duan9', 'C.T Sphinx Golf Club & Residences\r\n', 'Quốc lộ 22, Tân Thông Hội, Huyện Củ Chi, TP.HCM', 'Hồ Chí Minh', 'Củ Chi', 'Tân Thông Hội', NULL, '\r\nC.T Sphinx Golf Club & Residences tọa lạc trên quốc lộ 22, gần Cầu An Hạ, nằm trong vùng đất di sản 18 thôn vườn trầu, giáp ranh giữa Hóc Môn và Củ Chi. C.T Sphinx có 3 mặt là sông nước trong xanh, trải dài dọc sông Thầy Cai, con sông nối liền sông Sài Gòn với sông Vàm Cỏ Đông. Chỉ mất 30 phút di chuyển bằng ca-nô. Quý khách sẽ đến với C.T Sphinx – Sân Golf tuyệt đẹp và những biệt thự phong cách thiết kế Châu Âu.\r\n \r\n- Dự án: C.T Sphinx - sân Golf Nhân sư và khu Villas\r\n- Vị trí: Quốc lộ 22, Tân Thông Hội, Huyện Củ Chi, Tp.HCM.\r\n- Chủ đầu tư : Công ty TNHH Phát triển GS Củ Chi ( Thành viên Tập đoàn C.T Group)\r\n- Tổng diện tích: 200 ha\r\n- Tổng vốn đầu tư: 42 Triệu USD\r\n- Loại hình: Sân golf, Biệt thự', 1, 2.4, 'Tên dự án C.T Sphinx Golf Club & Residences\r\nChủ đầu tưC.T Group\r\nĐịa chỉQuốc lộ 22, Tân Thông Hội, Huyện Củ Chi, TP.HCM\r\nTổng diện tích2.000.000 m²\r\nLoại hình phát triểnKhu nghỉ dưỡng, Sinh thái\r\nBàn giao nhàQuý II/2016\r\nQuy mô dự án200 căn biệt thự', NULL, 10.927066, 106.503961, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan7'),
('E2EBE889EF8549', 'Hà Nội Garden Villa (Hà Nội Garden City)', 'Phường Thạch Bàn, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thạch Bàn', NULL, 'Hà Nội Garden Villa Với trang thiết bị đồng bộ, công nghệ thông tin hiện đại, nội thất đẹp tràn đầy ánh sáng tự nhiên, mỗi tầng rộng 735 m2 rất tiện lợi để làm văn phòng cho các công ty trong và ngoài nước', 1, 2.5, 'Giá từ: Đang cập nhật Chủ đầu tư: Công ty CP Đầu tư Trúc Bạch', NULL, 21.0202102661133, 105.920616149902, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_duanquantam`
--

CREATE TABLE `companies_duanquantam` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `duan_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_duanquantam`
--

INSERT INTO `companies_duanquantam` (`id`, `status`, `duan_id`, `user_id`) VALUES
(1, 1, 'duan1', '51C09B04E8'),
(2, 0, 'duan2', 'user1'),
(3, 1, 'duan3', 'user1'),
(5, 1, 'duan10', 'user1'),
(9, 1, 'duan11', 'user1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_groupnode`
--

CREATE TABLE `companies_groupnode` (
  `id` varchar(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_history`
--

CREATE TABLE `companies_history` (
  `id` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `user` varchar(20) NOT NULL,
  `staff` varchar(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_history`
--

INSERT INTO `companies_history` (`id`, `coin`, `type`, `user`, `staff`, `date`, `status`) VALUES
(1, 20, 1, 'user1', 'mod2', '2017-12-18 13:55:12.000000', 1),
(2, 20, 1, 'user1', 'mod2', '2017-12-18 13:55:12.000000', 1),
(3, 20, 0, 'user1', 'mod2', '2017-12-18 13:55:12.000000', 1),
(4, 20, 0, 'user1', 'mod2', '2017-12-20 13:55:12.000000', 1),
(5, 20, 0, 'user1', 'mod2', '2017-12-21 13:55:12.000000', 1),
(6, 10, 1, 'user1', 'mod10', '2018-01-31 08:50:10.000000', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_loaiduan`
--

CREATE TABLE `companies_loaiduan` (
  `id` varchar(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_loaiduan`
--

INSERT INTO `companies_loaiduan` (`id`, `name`, `icon`) VALUES
('loaiduan1', 'Căn hộ, Chung cư', ''),
('loaiduan10', 'Biệt thự, liền kề, nhà vườn', ''),
('loaiduan2', 'Cao ốc văn phòng', ''),
('loaiduan3', 'Trung tâm thương mại', ''),
('loaiduan4', 'Khu đô thị mới', ''),
('loaiduan5', 'Khu phức hợp', ''),
('loaiduan6', 'Nhà ở xã hội', ''),
('loaiduan7', 'Khu nghỉ dưỡng, Sinh thái', ''),
('loaiduan8', 'Khu công nghiệp', ''),
('loaiduan9', 'Dự án khác', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_mod`
--

CREATE TABLE `companies_mod` (
  `id` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rank` tinyint(1) NOT NULL,
  `typemod` int(11) NOT NULL,
  `type_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_mod`
--

INSERT INTO `companies_mod` (`id`, `username`, `password`, `name`, `email`, `phone`, `birthday`, `status`, `sex`, `address`, `rank`, `typemod`, `type_id`) VALUES
('16B651', 'long', 'sha256$8Qf3MG0v$03c96a19509f10528846e8395fce24be3b515bec3845fa5aee26ce5dc1438202', 'Nguyễn Duy Long', 'long@gmail.com', '0988111828', '1995-09-19', 1, 0, 'Hà Nội', 0, 0, '920EC2'),
('920EC2', 'hien', 'sha256$hiv2DN8B$99bd2c5718ceca4a3855ab41b195ed1a5737942ab70f97e92c1647750d485533', 'Hà ĐỨc Hiến', 'hienhd@gmail.com', '0988111828', '1995-09-19', 1, 1, 'Hà Nội', 1, 0, NULL),
('C9BB1F', 'tu', 'sha256$ABrTncWD$07944bc23f433d1001f183acec947741d365cbbc00b45f231b6a4bbf1eae0bca', 'Nguyễn Minh TÚ', 'tunguyen@gmail.com', '0988111828', '1995-09-09', 1, 0, 'Hà Nội', 1, 1, NULL),
('mod10', 'hiep', 'sha256$foMAUhmk$3074640dbcd07a46f5f67085b04030900c59e3d6010f44ca5b18fef2c27ddfa1', 'Bạch Ngọc HIệp', 'hiepbach@gmail.com', '0918271271', '1995-01-01', 1, 1, 'Hà Nội', 0, 1, 'C9BB1F'),
('mod2', 'anh', 'sha256$4BBamosW$eaf9810fa140b828a7b2ea006155e39128f878b12b5c9c47d3a3b76530bcb56d', 'Phạm Ngọc Anh', 'ngocanh@gmail.com', '0988282727', '1995-01-01', 1, 1, 'Hà NỘi', 0, 1, 'C9BB1F'),
('mod200', 'hieu', 'sha256$Pr1gwmoT$2f9a15f653bff7b6948483cafff9ef44224121837b62ddca8991f94d98836ad0', 'Phạm Trọng Hiếu', 'phamhieu@gmail.com', '0918271271', '1995-01-01', 1, 1, 'Hà NỘi', 0, 0, '920EC2'),
('mod3', 'tuan', 'sha256$LWOIUcFs$7051509bf2e3f1f6add26a013d4e8161ef67c35a4f3ead7e1d5a5f6313029efc', 'Vũ Quốc Tuấn', 'tuanvu@gmail.com', '0991928382', '1995-01-01', 1, 1, 'Hà Nội', 0, 0, '920EC2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_phancong`
--

CREATE TABLE `companies_phancong` (
  `id` int(11) NOT NULL,
  `province` varchar(20) NOT NULL,
  `district` varchar(2000) NOT NULL,
  `timemodify` datetime(6) NOT NULL,
  `modname_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_phanhoi`
--

CREATE TABLE `companies_phanhoi` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `details` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_phanhoi`
--

INSERT INTO `companies_phanhoi` (`id`, `title`, `details`, `email`, `time`) VALUES
(1, 'Chat luong dich vu', 'Cách thức thanh toán của công ty', 'hien@gmail.com', '2018-01-31 07:16:14.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_realestatenode`
--

CREATE TABLE `companies_realestatenode` (
  `id` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `price` double NOT NULL,
  `pricem2` double NOT NULL,
  `area` double DEFAULT NULL,
  `tinh` varchar(200) NOT NULL,
  `huyen` varchar(200) NOT NULL,
  `xa` varchar(200) NOT NULL,
  `duong` varchar(200) NOT NULL,
  `details_address` longtext,
  `address` longtext NOT NULL,
  `huong` varchar(200) NOT NULL,
  `sophongngu` int(11) DEFAULT NULL,
  `tang` int(11) DEFAULT NULL,
  `sotang` int(11) DEFAULT NULL,
  `rongtien` double NOT NULL,
  `rongduong` double NOT NULL,
  `details` longtext,
  `status` tinyint(1) NOT NULL,
  `thumbs` longtext,
  `panorama_image` varchar(2000) DEFAULT NULL,
  `tenduan` longtext NOT NULL,
  `tenlienhe` varchar(200) NOT NULL,
  `diachi` varchar(2000) NOT NULL,
  `dienthoai` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `rank` int(11) NOT NULL,
  `timefrom` datetime(6) NOT NULL,
  `timeto` datetime(6) NOT NULL,
  `typenode` tinyint(1) NOT NULL,
  `vip` int(11) NOT NULL,
  `modname` varchar(200) DEFAULT NULL,
  `timecreate` datetime(6) NOT NULL,
  `timemodify` datetime(6) NOT NULL,
  `duanid_id` varchar(20) DEFAULT NULL,
  `modid_id` varchar(20) DEFAULT NULL,
  `type_id` varchar(20) NOT NULL,
  `userid_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_realestatenode`
--

INSERT INTO `companies_realestatenode` (`id`, `title`, `latitude`, `longitude`, `price`, `pricem2`, `area`, `tinh`, `huyen`, `xa`, `duong`, `details_address`, `address`, `huong`, `sophongngu`, `tang`, `sotang`, `rongtien`, `rongduong`, `details`, `status`, `thumbs`, `panorama_image`, `tenduan`, `tenlienhe`, `diachi`, `dienthoai`, `email`, `rank`, `timefrom`, `timeto`, `typenode`, `vip`, `modname`, `timecreate`, `timemodify`, `duanid_id`, `modid_id`, `type_id`, `userid_id`) VALUES
('42D57796F2', 'Bán nhà Riêng', 0, 0, -1, 0, 0, 'HN', 'Ba Đình', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 1, NULL, NULL, '', 'ha quoc', '', '01688955695', 'quoc@gmail.com', 1, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod3', 'typereal1', 'user1'),
('78FB350CC4', 'Cần mua nhà riêng', 0, 0, -1, 0, 0, 'HN', '7', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 0, NULL, NULL, '', 'ha+quoc+hung', '', '01688955695', 'hung%40gmail.com', 1, '2017-08-12 00:00:00.000000', '2017-10-12 00:00:00.000000', 0, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod10', 'typereal1', 'user1'),
('A74AE9E7F6E64A2', 'trvew', 21.0026988983154, 105.792427062988, 2, 0, 0, 'HN', 'Ba Đình', '', '', 'Trúc Bạch, Ba Đình, Hà Nội', '', '', 2, NULL, NULL, 0, 0, '', 1, NULL, NULL, '', 'ha quoc', '', '01688955695', 'quoc@gmail.com', 3, '2017-11-15 00:00:00.000000', '2018-02-07 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod200', 'typereal1', 'user1'),
('E44883FBEE', 'Cần thuê nhà', 0, 0, -1, 0, 0, 'HN', '7', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 1, NULL, NULL, '', 'ha+quoc+hung', '', '01688955695', 'hung%40gmail.com', 1, '2017-12-31 00:00:00.000000', '2018-02-23 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', '16B651', 'typereal1', 'user1'),
('node1', 'VINHOMES LIỄU GIAI METROPOLIS, MỘT SỐ CĂN ĐẸP CHÍNH CHỦ BÁN LẠI, CẬP NHẬT MỚI NHẤT NGÀY 16/11/2017', 21.031885, 105.813755, 2.4, 0, 70, 'Hà Nội', 'Ba Đình', 'Liễu Giai', 'Liễu Giai', NULL, 'Liễu Giai, Ba Đình, hà Nội', 'Tây', 2, NULL, NULL, 0, 0, 'Gia re cam ket', 1, 'http://img.thuechungcuhn.com//2016/07/14/20160714164310-9ee5.jpg,http://cdn.home-designing.com/wp-content/uploads/2012/06/Modern-interior-grafitti-art.jpg,http://www.alanyahomes.net/wp-content/uploads/2017/01/small-apartment-design.jpg', NULL, '', 'hung', 'Ha Noi', '09121231', 'haquochung@gmail.com', 2, '2017-08-12 00:00:00.000000', '2017-08-30 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan1', 'mod2', 'typereal1', 'user1'),
('node2', 'BÁN SUẤT MUA CĂN HỘ B6 GIẢNG VÕ, GIÁ 49TR/M2, CHỌN CĂN TẦNG ĐẸP 75-80-95-127M2. LH: 0984289885', 21.027666, 105.824105, 0.7, 0, 900, 'Hồ Chí Minh', 'Bình Chánh', 'Bình Lợi', '2C', NULL, 'Bình Lợi, Bình Chánh, Hồ Chí Minh', 'Đông', 2, NULL, NULL, 0, 0, 'Gia re cam ket', 1, NULL, NULL, '', 'hien', 'Ha Noi', '09101231', 'haduchien@gmail.com', 1, '2017-08-12 00:00:00.000000', '2017-08-20 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod3', 'typereal2', 'user2'),
('node3', 'CĐT Tháp nước bán suất ngoại giao Hà Nội Aqua Central, liên hệ CĐT: 09492158988\n', 21.046274, 105.844371, 0.7, 0, 80.03, 'Hà Nội', 'Ba Đình', 'Trúc Bạch', 'Yên Phụ', NULL, 'Trúc Bạch, Ba Đình, Hà Nội', 'Nam', 3, NULL, NULL, 0, 0, 'Gia re cam ket', 1, NULL, NULL, '', 'hien', 'Ha Noi', '09101231', 'haduchien@gmail.com', 2, '2017-08-12 00:00:00.000000', '2017-08-20 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan4', 'mod3', 'typereal7', 'user2'),
('node5', 'PHÒNG KINH DOANH GOLDEN FIELD MỸ ĐÌNH, MỞ BÁN ĐỢT CUỐI, GIÁ TỪ 29TR/M2, TẶNG GÓI NỘI THẤT 60TR\n', 21.030084, 105.76747, 3.5, 0, 135.01, 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình', '', NULL, 'Mỹ Đình, Nam Từ Liêm, Hà Nội', 'Đông', 4, NULL, NULL, 0, 0, 'Gia re cam ket', 1, NULL, NULL, '', 'hung', 'Ha Noi', '09121231', 'haquochung@gmail.com', 1, '2017-08-12 00:00:00.000000', '2017-08-20 00:00:00.000000', 0, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod2', 'typereal7', 'user1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_servicenode`
--

CREATE TABLE `companies_servicenode` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` longtext,
  `details` longtext,
  `group` varchar(200) NOT NULL,
  `modname` varchar(200) DEFAULT NULL,
  `timecreate` datetime(6) NOT NULL,
  `timemodify` datetime(6) NOT NULL,
  `type_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_servicenode`
--

INSERT INTO `companies_servicenode` (`id`, `name`, `latitude`, `longitude`, `address`, `details`, `group`, `modname`, `timecreate`, `timemodify`, `type_id`) VALUES
(1, 'NHA Bo To', 10.9143286, 106.7134236, NULL, 'Hay', 'Xa Hoi', NULL, '2017-12-27 11:22:20.439538', '2017-12-31 18:59:06.000000', 'typeservice2'),
(2, 'Sieu thi Vin', 13.12, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice2'),
(3, 'Sieu thi Land', 13.12, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice2'),
(4, 'Truong Tieu Hoc XXY', 13.12, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice3'),
(5, 'Truong Hoc VQT', 121, 13.001, NULL, 'Hay', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice1'),
(6, 'Truong Hoc TVT', 121, 13.001, NULL, 'Hay', 'Xa Hoi', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice1'),
(7, 'Truong Hoc TVT', 121, 13.001, NULL, 'Hay', 'Xa Hoi', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_thongbao`
--

CREATE TABLE `companies_thongbao` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `details` longtext NOT NULL,
  `time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_thongbao`
--

INSERT INTO `companies_thongbao` (`id`, `title`, `details`, `time`) VALUES
(1, 'Cho các người dùng mới', 'CHao mung ban den voi mappy', '2018-02-01 12:45:01.000000'),
(2, 'Khuyến mai xuân 2018', 'Khuyến mại nhân dịp xuân.', '2018-02-01 13:40:54.000000'),
(3, 'Hướng dẫn nạp tiền', 'Sau đây la huong dẫn than toán tại mappy.com.vn', '2018-02-01 13:41:30.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_thongbaouser`
--

CREATE TABLE `companies_thongbaouser` (
  `id` int(11) NOT NULL,
  `modname` longtext,
  `user` longtext,
  `details` longtext,
  `time` datetime(6) NOT NULL,
  `thongbao_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_thongbaouser`
--

INSERT INTO `companies_thongbaouser` (`id`, `modname`, `user`, `details`, `time`, `thongbao_id`) VALUES
(2, 'mod10', 'user1', 'CHao mung ban den voi mappy', '2018-02-01 13:23:38.000000', NULL),
(3, 'mod10', 'user2', 'CHao mung ban den voi mappy', '2018-02-01 13:23:44.000000', NULL),
(4, 'mod10', 'user2', 'CHao mung ban den voi mappy', '2018-02-01 13:38:48.000000', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_tiendo`
--

CREATE TABLE `companies_tiendo` (
  `id` int(11) NOT NULL,
  `duanid` varchar(20) NOT NULL,
  `thumbs` longtext,
  `details` longtext,
  `time` datetime(6) NOT NULL,
  `timemodify` datetime(6) NOT NULL,
  `modname_id` varchar(20) DEFAULT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_tiendo`
--

INSERT INTO `companies_tiendo` (`id`, `duanid`, `thumbs`, `details`, `time`, `timemodify`, `modname_id`, `title`) VALUES
(1, 'duan1', 'https://lh4.googleusercontent.com/-0voGSd3R7a8/WjuJpEQsuLI/AAAAAAAAFMg/4cTKdHzmDm0gKJS82YBMZq3YLQ-dURGcgCLcBGAs/s1600/tien-do-du-an-dong-sai-gon-17.jpg', 'Dự án đang hoàn thiện giai đoạn I', '2017-12-21 00:00:00.000000', '2018-01-26 00:00:00.000000', 'mod10', 'Tiến hành giai đoạn I'),
(2, 'duan10', 'https://lh4.googleusercontent.com/-Br4KLXd6drk/WjqCf8Li_oI/AAAAAAAAFJw/qJJyxvPSI6QqHHCpZlzLul-8saE3VJiTwCLcBGAs/s1600/tien-do-can-ho-viva-riverside-12.jpg', 'Dự án đang trong giai đoạn hoàn thiện', '2018-01-17 00:00:00.000000', '2018-01-26 00:00:00.000000', 'mod10', 'Hòan thiện'),
(3, 'duan10', 'https://lh4.googleusercontent.com/-OHoHmHbfoDY/WjqCgsbYmOI/AAAAAAAAFJ4/YBLt8L40lZIbWuG82Zt1PCH3IVTxp7L9gCLcBGAs/s1600/tien-do-can-ho-viva-riverside-14.jpg', 'Dự án trong giai đoạn II', '2018-01-19 00:00:00.000000', '2018-01-26 00:00:00.000000', 'mod10', 'Hoàn thành giai đoạn II'),
(4, 'duan1', 'https://vinhomes-quan9.info/wp-content/uploads/2016/08/vinhomes-quan-9-1-1.jpg', 'Được dự kiến hoàn thành', '2018-01-23 00:00:00.000000', '2018-01-30 00:00:00.000000', 'mod2', 'Quý 1-2018'),
(5, 'duan1', 'http://vinhometancang.co/wp-content/uploads/2016/03/MB-P4.jpg', 'Nhanh nnhanh', '2018-01-25 00:00:00.000000', '2018-01-30 00:00:00.000000', 'mod2', 'Tiep theo trong quy 1 2018'),
(6, 'duan1', 'http://vinhomesriversidelongbien.vn/wp-content/uploads/sites/107/2016/09/phoi-canh-vinhome-riverside-the-harmony-tieu-khu-nguyet-que.jpg', 'Giơsi thiệu về tiến độ hiện tại', '2018-01-27 00:00:00.000000', '2018-01-30 00:00:00.000000', 'mod2', 'hoàn thành cơ bản giai đoạn 1 quý 1 năm 2018');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_typerealestate`
--

CREATE TABLE `companies_typerealestate` (
  `id` varchar(20) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_typerealestate`
--

INSERT INTO `companies_typerealestate` (`id`, `details`, `icon`, `type`) VALUES
('typereal1', 'Bán căn hộ chung cư', '', 1),
('typereal10', 'Bán loại bất động sản khác', '', 1),
('typereal11', 'Cho thuê căn hộ chung cư', '', 0),
('typereal12', 'Cho thuê nhà riêng', '', 0),
('typereal13', 'Cho thuê nhà mặt phố', '', 0),
('typereal14', 'Cho thuê nhà trọ, phòng trọ', '', 0),
('typereal15', 'Cho thuê văn phòng', '', 0),
('typereal16', 'Cho thuê cửa hàng, ki ốt', '', 0),
('typereal17', 'Cho thuê kho, nhà xưởng, đất', '', 0),
('typereal18', 'Cho thuê loại bất động sản khác', '', 0),
('typereal2', 'Bán nhà riêng', '', 1),
('typereal3', 'Bán nhà biệt thự, liền kề', '', 1),
('typereal4', 'Bán nhà mặt phố', '', 1),
('typereal5', 'Bán đất nền dự án', '', 1),
('typereal6', 'Bán đất', '', 1),
('typereal7', 'Bán trang trại, khu nghỉ dưỡng', '', 1),
('typereal8', 'Bán kho, nhà xưởng', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_typeservice`
--

CREATE TABLE `companies_typeservice` (
  `id` varchar(20) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_typeservice`
--

INSERT INTO `companies_typeservice` (`id`, `icon`, `name`) VALUES
('typeservice1', 'icon1', 'Trường học'),
('typeservice10', 'icon10', 'Làm đẹp, spa'),
('typeservice11', 'icon11', 'ATM, Ngân hàng'),
('typeservice12', 'icon12', 'Các công ty dịch vụ'),
('typeservice13', 'icon13', 'Các tiện ích khác'),
('typeservice2', 'icon2', 'Bến xe, trạm xe'),
('typeservice3', 'icon3', 'Công trình công cộng'),
('typeservice4', 'icon4', 'Cơ sở y tế'),
('typeservice5', 'icon5', 'Nhà hàng'),
('typeservice6', 'icon6', 'Cơ quan hành chính'),
('typeservice7', 'icon7', 'Khách sạn'),
('typeservice8', 'icon8', 'TT thể thao, giải trí'),
('typeservice9', 'icon9', 'Địa điểm mua sắm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_user`
--

CREATE TABLE `companies_user` (
  `id` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `coin` varchar(50) NOT NULL,
  `avatar` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_user`
--

INSERT INTO `companies_user` (`id`, `username`, `password`, `name`, `email`, `phone`, `address`, `company`, `sex`, `birthday`, `coin`, `avatar`, `status`, `rank`) VALUES
('3988E43301', 'doanh', 'sha256$J9Rku9SO$6e899175ad2284d0dac0ffb77a65de4920fe39ff016b3bfbac2b6da08f9b04a4', 'phan trong doanh~', 'phandoanh@gmail.com', '01688955295', 'Binh Dinh', 'BHome', 1, '1995-09-09', '60', '', 1, 1),
('408C96A7B6', 'tuan', 'sha256$RT57V8Oq$48029272632e3cf7748dead8e189155da4541bd7a263d8837f9d474e93d02d2a', 'vu quoc tuan', 'vuquoctuan@gmail.com', '0928111828', 'Hà Nội', 'BHome', 1, '1995-09-09', '0', '', 1, 1),
('51C09B04E8', 'duy', 'sha256$VW7XYtTA$797bcb104fb129dc88bc1c383a20b2abe7faa8600034ef6ca3f09290d0fb378d', 'phan trong doanh', 'phanduy@gmail.com', '01688955295', 'Gia Lai', 'BHome', 1, '1995-09-09', '0', '', 1, 1),
('B892FB32E4', 'hiep', 'sha256$akeLWn1h$3c3a1ecc900f935c53d9000c0ab231e833f3685f5a1acbdc123c627d328b4aaa', 'bach hiep', 'bachngochiep@gmail.com', '0917217271', 'Hà Nội', 'BHomes', 1, '1995-01-01', '0', '', 1, 1),
('user1', 'hung', 'sha256$Numwnh9z$9d2f6ab1fabf5d7809ecdf6cc6ce1ee54b809af51f32f2a28afdcf37926b458f', 'ha quoc hung', 'hung@gmail.com', '01688955695', 'Binh Dinh', 'BHome', 1, '1995-09-09', '130', '', 1, 1),
('user2', 'hieu', 'sha256$g8GnR9TM$476103667706ac165ae3d2d2c197eb0b10040e93bafd21f0181f97d8a2205b80', 'pham trong hieu', 'phamtronghieu@gmail.com', '0988111828', '', 'BHome', 1, '1995-09-09', '50', '', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(21, 'companies', 'admin'),
(11, 'companies', 'coin'),
(9, 'companies', 'duan'),
(14, 'companies', 'duanquantam'),
(15, 'companies', 'groupnode'),
(17, 'companies', 'history'),
(13, 'companies', 'loaiduan'),
(19, 'companies', 'mod'),
(12, 'companies', 'phancong'),
(22, 'companies', 'phanhoi'),
(20, 'companies', 'realestatenode'),
(10, 'companies', 'servicenode'),
(24, 'companies', 'thongbao'),
(23, 'companies', 'thongbaouser'),
(16, 'companies', 'tiendo'),
(18, 'companies', 'typerealestate'),
(8, 'companies', 'typeservice'),
(7, 'companies', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-01-25 15:58:27.061995'),
(2, 'auth', '0001_initial', '2018-01-25 15:58:27.493891'),
(3, 'admin', '0001_initial', '2018-01-25 15:58:27.599864'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-01-25 15:58:27.620387'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-01-25 15:58:27.702067'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-01-25 15:58:27.766857'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-01-25 15:58:27.814690'),
(8, 'auth', '0004_alter_user_username_opts', '2018-01-25 15:58:27.827784'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-01-25 15:58:27.870939'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-01-25 15:58:27.874492'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-01-25 15:58:27.892365'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-01-25 15:58:27.941316'),
(13, 'sessions', '0001_initial', '2018-01-25 15:58:27.978891'),
(14, 'companies', '0001_initial', '2018-01-25 16:43:55.004361'),
(15, 'companies', '0002_duanquantam', '2018-01-25 16:43:55.116484'),
(16, 'companies', '0003_duanquantam_timemodify', '2018-01-25 16:43:55.168917'),
(17, 'companies', '0004_coin_vip', '2018-01-26 03:04:02.346145'),
(18, 'companies', '0005_auto_20180126_0753', '2018-01-26 07:53:49.929807'),
(19, 'companies', '0006_auto_20180126_0754', '2018-01-26 07:54:43.067074'),
(20, 'companies', '0007_auto_20180126_1606', '2018-01-26 16:06:26.704961'),
(21, 'companies', '0008_tiendo_title', '2018-01-26 18:01:19.445642'),
(22, 'companies', '0009_phanhoi', '2018-01-31 07:05:39.861914'),
(23, 'companies', '0010_history_status', '2018-01-31 07:35:32.779326'),
(24, 'companies', '0011_auto_20180201_1138', '2018-02-01 11:38:48.074155');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('mz55lrb6pu8j3kdh320sdry2vmkhjmi6', 'NzYwODQ3OGJjOTNmYzE0MmQ3ZWZhMjZkNmI1MWZlYzQ2OWFjZTk4Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3M2U3ZTlkNDVhY2QxYWI2N2UxYTkwMWRlNmU4YmU1YTc4ZWUwZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-02-08 15:59:42.046610');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `companies_admin`
--
ALTER TABLE `companies_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `companies_coin`
--
ALTER TABLE `companies_coin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_coin_typerealestate_id_17c00bcf_fk_companies` (`typerealestate_id`);

--
-- Chỉ mục cho bảng `companies_duan`
--
ALTER TABLE `companies_duan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_duan_modname_id_7fac3467_fk_companies_mod_id` (`modname_id`),
  ADD KEY `companies_duan_type_id_104198f9_fk_companies_loaiduan_id` (`type_id`);

--
-- Chỉ mục cho bảng `companies_duanquantam`
--
ALTER TABLE `companies_duanquantam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_duanquantam_duan_id_9d8291a3_fk_companies_duan_id` (`duan_id`),
  ADD KEY `companies_duanquantam_user_id_a5495168_fk_companies_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `companies_groupnode`
--
ALTER TABLE `companies_groupnode`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_history`
--
ALTER TABLE `companies_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_loaiduan`
--
ALTER TABLE `companies_loaiduan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_mod`
--
ALTER TABLE `companies_mod`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `companies_mod_type_id_cbbbe5da_fk_companies_mod_id` (`type_id`);

--
-- Chỉ mục cho bảng `companies_phancong`
--
ALTER TABLE `companies_phancong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_phancong_modname_id_63b6a13e_fk_companies_mod_id` (`modname_id`);

--
-- Chỉ mục cho bảng `companies_phanhoi`
--
ALTER TABLE `companies_phanhoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_realestatenode`
--
ALTER TABLE `companies_realestatenode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_realestatenode_duanid_id_3c0ab73b_fk_companies_duan_id` (`duanid_id`),
  ADD KEY `companies_realestatenode_modid_id_f2bd9d4b_fk_companies_mod_id` (`modid_id`),
  ADD KEY `companies_realestate_type_id_e47930e3_fk_companies` (`type_id`),
  ADD KEY `companies_realestatenode_userid_id_4296d794_fk_companies_user_id` (`userid_id`);

--
-- Chỉ mục cho bảng `companies_servicenode`
--
ALTER TABLE `companies_servicenode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_servicenod_type_id_1f4f944f_fk_companies` (`type_id`);

--
-- Chỉ mục cho bảng `companies_thongbao`
--
ALTER TABLE `companies_thongbao`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_thongbaouser`
--
ALTER TABLE `companies_thongbaouser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_thongbaous_thongbao_id_cd92a720_fk_companies` (`thongbao_id`);

--
-- Chỉ mục cho bảng `companies_tiendo`
--
ALTER TABLE `companies_tiendo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_tiendo_modname_id_5a30b399_fk_companies_mod_id` (`modname_id`);

--
-- Chỉ mục cho bảng `companies_typerealestate`
--
ALTER TABLE `companies_typerealestate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_typeservice`
--
ALTER TABLE `companies_typeservice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `companies_user`
--
ALTER TABLE `companies_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `companies_coin`
--
ALTER TABLE `companies_coin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `companies_duanquantam`
--
ALTER TABLE `companies_duanquantam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT cho bảng `companies_history`
--
ALTER TABLE `companies_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `companies_phancong`
--
ALTER TABLE `companies_phancong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `companies_phanhoi`
--
ALTER TABLE `companies_phanhoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `companies_servicenode`
--
ALTER TABLE `companies_servicenode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `companies_thongbao`
--
ALTER TABLE `companies_thongbao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `companies_thongbaouser`
--
ALTER TABLE `companies_thongbaouser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT cho bảng `companies_tiendo`
--
ALTER TABLE `companies_tiendo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `companies_coin`
--
ALTER TABLE `companies_coin`
  ADD CONSTRAINT `companies_coin_typerealestate_id_17c00bcf_fk_companies` FOREIGN KEY (`typerealestate_id`) REFERENCES `companies_typerealestate` (`id`);

--
-- Các ràng buộc cho bảng `companies_duan`
--
ALTER TABLE `companies_duan`
  ADD CONSTRAINT `companies_duan_modname_id_7fac3467_fk_companies_mod_id` FOREIGN KEY (`modname_id`) REFERENCES `companies_mod` (`id`),
  ADD CONSTRAINT `companies_duan_type_id_104198f9_fk_companies_loaiduan_id` FOREIGN KEY (`type_id`) REFERENCES `companies_loaiduan` (`id`);

--
-- Các ràng buộc cho bảng `companies_duanquantam`
--
ALTER TABLE `companies_duanquantam`
  ADD CONSTRAINT `companies_duanquantam_duan_id_9d8291a3_fk_companies_duan_id` FOREIGN KEY (`duan_id`) REFERENCES `companies_duan` (`id`),
  ADD CONSTRAINT `companies_duanquantam_user_id_a5495168_fk_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `companies_user` (`id`);

--
-- Các ràng buộc cho bảng `companies_mod`
--
ALTER TABLE `companies_mod`
  ADD CONSTRAINT `companies_mod_type_id_cbbbe5da_fk_companies_mod_id` FOREIGN KEY (`type_id`) REFERENCES `companies_mod` (`id`);

--
-- Các ràng buộc cho bảng `companies_phancong`
--
ALTER TABLE `companies_phancong`
  ADD CONSTRAINT `companies_phancong_modname_id_63b6a13e_fk_companies_mod_id` FOREIGN KEY (`modname_id`) REFERENCES `companies_mod` (`id`);

--
-- Các ràng buộc cho bảng `companies_realestatenode`
--
ALTER TABLE `companies_realestatenode`
  ADD CONSTRAINT `companies_realestate_type_id_e47930e3_fk_companies` FOREIGN KEY (`type_id`) REFERENCES `companies_typerealestate` (`id`),
  ADD CONSTRAINT `companies_realestatenode_duanid_id_3c0ab73b_fk_companies_duan_id` FOREIGN KEY (`duanid_id`) REFERENCES `companies_duan` (`id`),
  ADD CONSTRAINT `companies_realestatenode_modid_id_f2bd9d4b_fk_companies_mod_id` FOREIGN KEY (`modid_id`) REFERENCES `companies_mod` (`id`),
  ADD CONSTRAINT `companies_realestatenode_userid_id_4296d794_fk_companies_user_id` FOREIGN KEY (`userid_id`) REFERENCES `companies_user` (`id`);

--
-- Các ràng buộc cho bảng `companies_servicenode`
--
ALTER TABLE `companies_servicenode`
  ADD CONSTRAINT `companies_servicenod_type_id_1f4f944f_fk_companies` FOREIGN KEY (`type_id`) REFERENCES `companies_typeservice` (`id`);

--
-- Các ràng buộc cho bảng `companies_thongbaouser`
--
ALTER TABLE `companies_thongbaouser`
  ADD CONSTRAINT `companies_thongbaous_thongbao_id_cd92a720_fk_companies` FOREIGN KEY (`thongbao_id`) REFERENCES `companies_thongbao` (`id`);

--
-- Các ràng buộc cho bảng `companies_tiendo`
--
ALTER TABLE `companies_tiendo`
  ADD CONSTRAINT `companies_tiendo_modname_id_5a30b399_fk_companies_mod_id` FOREIGN KEY (`modname_id`) REFERENCES `companies_mod` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
