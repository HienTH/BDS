-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 07, 2018 lúc 02:18 PM
-- Phiên bản máy phục vụ: 5.7.22-0ubuntu0.16.04.1
-- Phiên bản PHP: 7.0.30-0ubuntu0.16.04.1

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
(72, 'Can delete thongbao', 24, 'delete_thongbao'),
(73, 'Can add messagenode', 25, 'add_messagenode'),
(74, 'Can change messagenode', 25, 'change_messagenode'),
(75, 'Can delete messagenode', 25, 'delete_messagenode'),
(76, 'Can add message', 26, 'add_message'),
(77, 'Can change message', 26, 'change_message'),
(78, 'Can delete message', 26, 'delete_message');

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
(1, 'pbkdf2_sha256$36000$u6RTjWdSVl4a$beT11Jn1hYStba9Sy/Xh9VMA+RRGhDXeaCNyQklAZfY=', '2018-06-07 09:11:23.242324', 1, 'hienhd', '', '', 'haduchienmtat32@gmail.com', 1, 1, '2018-01-25 15:59:05.146189');

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
  `type_id` varchar(20) NOT NULL,
  `anh360` longtext,
  `panorama_image` longtext,
  `video` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_duan`
--

INSERT INTO `companies_duan` (`id`, `name`, `address`, `tinh`, `huyen`, `xa`, `details_address`, `intro`, `status`, `pricefrom`, `infoduan`, `tiendo`, `latitude`, `longitude`, `thumbs`, `uutien`, `timecreate`, `timemodify`, `modname_id`, `type_id`, `anh360`, `panorama_image`, `video`) VALUES
('023EC39B0C96477D', 'Liền kề 622 Minh Khai', 'Đường Minh Khai, Phường Minh Khai, Hai Bà Trưng, Hà Nội', 'Hà Nội', 'Hai Bà Trưng', 'Minh Khai', NULL, 'Liền kề 622 Minh Khai là khu nhà ở xã hội cao cấp được đầu tư bởi Công ty cổ phần đầu tư phát triển nhà Hà Nội số 5 và Công ty cổ phần bánh kẹo Hải Châu. Nằm tại vị trí đắc địa ngay chân cầu Vĩnh Tuy. Dự án hứa hẹn là tâm điểm 2016 khu vực Minh Khai.', 1, 2, 'Liền kề 622 Minh Khai là khu nhà ở xã hội cao cấp được đầu tư bởi Công ty cổ phần đầu tư phát triển nhà Hà Nội số 5 và Công ty cổ phần bánh kẹo Hải Châu. Nằm tại vị trí đắc địa ngay chân cầu Vĩnh Tuy. Dự án hứa hẹn là tâm điểm 2016 khu vực Minh Khai.', NULL, 20.9990749359131, 105.87060546875, 'https://file4.batdongsan.com.vn/resize/110x110/2016/01/09/lGk9zKqg/20160109153700-a14d.jpg', 0, '2018-02-03 02:42:36.000000', '2018-02-03 02:42:36.000000', 'mod2', 'loaiduan10', NULL, NULL, NULL),
('0382F9091B6744C1', 'Vinhomes Gardenia', 'Đường Hàm Nghi, Thị trấn Cầu Diễn, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Cầu Diễn', NULL, '', 1, 0, '', NULL, 21.0365676879883, 105.760482788086, 'https://file4.batdongsan.com.vn/resize/110x110/2015/12/09/0I4XNtd4/20151209135958-fbb1.jpg', 0, '2018-02-04 05:38:25.000000', '2018-02-04 05:38:25.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('06B992E193BB4CA2', 'Chung cư Đại Thanh', 'Đường Phan Trọng Tuệ, Xã Tả Thanh Oai, Thanh Trì, Hà Nội', 'Hà Nội', 'Thanh Trì', 'Tả Thanh Oai', NULL, '', 1, 0, '', NULL, 20.9575748443604, 105.806900024414, 'https://file4.batdongsan.com.vn/resize/110x110/2016/04/01/0I4XNtd4/20160401101540-584f.jpg', 0, '2018-02-04 05:40:41.000000', '2018-02-04 05:40:41.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('0841E9D6B4424375', 'Diamond Flower Tower', 'Phố Hoàng Đạo Thúy, Phường Nhân Chính, Thanh Xuân, Hà Nội', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', NULL, '', 1, 0, '', NULL, 21.005578994751, 105.803749084473, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825164148-5048.jpg', 0, '2018-02-04 05:31:02.000000', '2018-02-04 05:31:02.000000', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('098CEC487C804D52', 'N04A Ngoại Giao Đoàn', 'Phường Xuân Tảo, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Tảo', NULL, '', 1, 0, '', NULL, 21.0661869049072, 105.801162719727, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825152009-2d83.jpg', 0, '2018-02-04 05:38:05.000000', '2018-02-04 05:38:05.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('0B5BF58B74D04D9A', 'Mandarin Garden 2', 'Số 493 đường Trương Định, phường Tân Mai, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Tân Mai', NULL, '', 1, 0, '', NULL, 20.9838600158691, 105.846603393555, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825155035-b7b0.jpg', 0, '2018-02-04 05:32:18.000000', '2018-02-04 05:32:18.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('0CF7507FB18D46EB', 'VP7 Linh Đàm', 'Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, '', 1, 0, '', NULL, 20.9653205871582, 105.838165283203, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/17/0I4XNtd4/20160317153651-ee76.jpg', 0, '2018-02-04 05:35:21.000000', '2018-02-04 05:35:21.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('0DB2E50A9D6A41FE', 'Khu căn hộ Vĩnh Lộc', 'Đường Hương lộ 80, xã Vĩnh Lộc A, Bình Chánh, Tp.HCM', 'Hồ Chí Minh', 'Bình Chánh', 'Vĩnh Lộc', NULL, 'Thông tin tổng quan dự án Khu căn hộ VĨnh Lộc thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 1.8, 'Tên dự án Khu VĨNh Lộc, Hồ Chí Minḥ\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 10.8087320327759, 106.571517944336, NULL, 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1', NULL, NULL, NULL),
('13F1A5150B564EA4', 'Khu đô thị Mỹ Phước 4', 'Thới Hòa, Bến Cát, Bình Dương', 'Bình Dương', 'Bến Cát', 'Thới Hòa', NULL, '', 1, 0, '', NULL, 11.0895547866821, 106.607803344727, 'https://file1.batdongsan.com.vn/thumb110x110.329753.jpg', 0, '2018-02-04 04:49:34.000000', '2018-02-04 04:49:34.000000', 'mod2', 'loaiduan4', NULL, NULL, NULL),
('152EB89AAE54442C', 'CT1 Trung Văn - Vinaconex 3', 'Đường Trung Văn, Xã Trung Văn, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Trung Văn', NULL, 'Thông tin tổng quan dự án CT1 Trung Văn - Vinaconex 3 hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị CT1 Trung Văn - Vinaconex 3Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9936695098877, 105.778076171875, 'http://nguyenhoangtrong.com/wp-content/uploads/2014/09/chung-cu-ct1-trung-van-vinaconex3-1.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('186A254E7F4F4AAD', 'IT Park', 'Phường Phúc Đồng, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Phúc Đồng', NULL, '', 1, 1, '', NULL, 21.0407333374023, 105.896560668945, 'https://file4.batdongsan.com.vn/resize/110x110/2016/07/07/0I4XNtd4/20160707162504-6f16.jpg', 0, '2018-02-04 04:40:56.000000', '2018-02-04 04:40:56.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('1B4674D691884B9C', 'Ellipse Tower (City View)', 'Phố Trần Phú, Phường Văn Quán, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Văn Quán', NULL, '', 1, 0, '', NULL, 20.9774532318115, 105.783920288086, 'https://file1.batdongsan.com.vn/thumb110x110.357150.jpg', 0, '2018-02-04 05:35:29.000000', '2018-02-04 05:35:29.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('23806BE9586F42A3', 'Dream Land Plaza', 'Số 1 Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội.', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng Hậu', NULL, 'Chung cư Dream Land Bonanza  là tổ hợp chung cư cao cấp đáng sống bậc nhất giữa lòng thủ đô Hà Nội, với 450 căn hộ hạng sang ẩn mình giữa màu xanh thiên nhiên ngút ngàn.Dự án được quy hoạch trên tổng diện tích 4.331m2, với mật độ xây dựng 41%, gồm 2 tòa chung cư cao 30 tầng chung 5 tầng khối đế, 3 tầng hầm để xe hiện đại và thông thoáng.', 1, 1.5, 'Đến với Dream Land Bonanza, bất cứ ai khi bước chân qua cổng đều cùng cảm nhận sự khác biệt: những con đường uốn mình mềm mại, duyên dáng dưới những rặng cây xanh mướt, những bậc thềm lát đá mát lạnh dưới ánh đèn lung linh huyền ảo, những khóm hoa tươi thắm đua nhau khoe sắc bốn mùa, những khu vườn nên thơ đưa bạn trở về kí ức trẻ thơ…Những gam màu tươi sáng hòa quyện cùng kiến trúc độc đáo, tinh tế đã mang đến vẻ đẹp hiện đại, phóng khoáng nhưng không kém phần sang trọng cho Dream Land Duy Tân.', NULL, 21.0313606262207, 105.780097961426, 'https://file4.batdongsan.com.vn/resize/110x110/2017/08/28/0I4XNtd4/20170828105930-6e6d.jpg', 0, '2018-02-03 02:49:07.000000', '2018-02-03 02:49:07.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('2472F864509D4057', 'Mandarin Garden', 'Đường Hoàng Minh Giám, Phường Trung Hòa, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Trung Hòa', NULL, 'Mandarin Garden gồm 4 tòa tháp cao 25 – 29 tầng, chia thành 4 khu A, B, C & D tại lô đất NO3 thuộc khu đô thị Đông Nam đường Trần Duy Hưng, Cầu Giấy, Hà Nội. Dự án đã hoàn thiện và bàn giao căn hộ cho các hộ gia đình, hiện còn những căn hộ trống diện tích từ 114 – 172m2 với thiêt kế 2-3 phòng ngủ vẫn đang được bán và  cho thuê cho tất cả các khách hàng có nhu cầu.', 1, 0, 'Mandarin Garden gồm 4 tòa tháp cao 25 – 29 tầng, chia thành 4 khu A, B, C & D tại lô đất NO3 thuộc khu đô thị Đông Nam đường Trần Duy Hưng, Cầu Giấy, Hà Nội. Dự án đã hoàn thiện và bàn giao căn hộ cho các hộ gia đình, hiện còn những căn hộ trống diện tích từ 114 – 172m2 với thiêt kế 2-3 phòng ngủ vẫn đang được bán và  cho thuê cho tất cả các khách hàng có nhu cầu.', NULL, 21.0044841766357, 105.798629760742, 'https://file1.batdongsan.com.vn/thumb110x110.113823.jpg', 0, '2018-02-04 05:40:32.000000', '2018-02-04 05:40:32.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('2956060C61C140CA', 'HH1 Linh Đàm', 'Đường Linh Đường, Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, 'Thông tin tổng quan dự án HH1 Linh Đàm xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới HH1 Linh Đàm Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9647350311279, 105.826362609863, 'http://chungcuhh1linhdam.sanhathanh.com/uploads/News/chung-cu-hh1-linh-dam-1.png,http://tvigroup.vn/Content/Images/Project/122014/hh%20Linh%20Dam.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('2C0882DB57B74B4E', 'Galaxy Bình An', 'Phường Cát Lái, quận 2, Tp.HCM', 'Hồ Chí Minh', 'Quận 2', 'Cát Lái', NULL, '', 1, 0, '', NULL, 10.7708263397217, 106.78539276123, 'https://file4.batdongsan.com.vn/resize/110x110/2017/12/14/0I4XNtd4/20171214095326-1070.jpg', 0, '2018-02-04 05:34:36.000000', '2018-02-04 05:34:36.000000', 'mod10', 'loaiduan9', NULL, NULL, NULL),
('2C56D7D391BF4FEF', 'Vinata Tower', 'Số 289 Khuất Duy Tiến, phường Trung Hòa, quận Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Trung Hòa', NULL, '', 1, 0, '', NULL, 20.9965934753418, 105.798934936523, 'https://file4.batdongsan.com.vn/resize/110x110/2015/10/05/0I4XNtd4/20151005163718-7c0b.jpg', 0, '2018-02-04 05:40:05.000000', '2018-02-04 05:40:05.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('2D171DC74542429A', 'Sky Han River', 'Phường Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng', 'Đà Nẵng', 'Ngũ Hành Sơn', 'Khuê Mỹ', NULL, '', 1, 0, '', NULL, 16.0295543670654, 108.242935180664, 'https://file4.batdongsan.com.vn/resize/110x110/2015/09/10/0I4XNtd4/20150910083438-8328.jpg', 0, '2018-02-04 05:33:52.000000', '2018-02-04 05:33:52.000000', 'mod3', 'loaiduan9', NULL, NULL, NULL),
('2E7F66131F434989', 'Central Coast Đà Nẵng', 'Đường Võ Nguyên Giáp, phường Phước Mỹ, Sơn Trà, Đà Nẵng', 'Đà Nẵng', 'Sơn Trà', 'Phước Mỹ', NULL, '', 1, 0, '', NULL, 16.0775966644287, 108.245506286621, 'https://file4.batdongsan.com.vn/resize/110x110/2016/06/28/0I4XNtd4/20160628144204-6b2e.jpg', 0, '2018-02-04 05:34:09.000000', '2018-02-04 05:34:09.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('3113451A71EE47C9', 'Vinhomes Riverside', 'Phường Việt Hưng, Quận Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Việt Hưng', NULL, '', 1, 1.7, '', NULL, 21.0460948944092, 105.915542602539, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825170216-8163.jpg', 0, '2018-02-04 04:38:01.000000', '2018-02-04 04:38:01.000000', 'mod3', 'loaiduan10', NULL, NULL, NULL),
('3445ECCDB0A442E5', 'Him Lam Thạch Bàn 2', 'Ngõ 191 Thạch Bàn, Phường Thạch Bàn, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thạch Bàn', NULL, '', 1, 0, '', NULL, 21.0240325927734, 105.910354614258, 'https://file4.batdongsan.com.vn/resize/110x110/2016/01/22/0I4XNtd4/20160122104153-86a6.jpg', 0, '2018-02-04 05:37:22.000000', '2018-02-04 05:37:22.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('3807B1EA6CE04DF2', 'Newhouse Xa La', 'Phường Phúc La, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Phúc La', NULL, '', 1, 0, '', NULL, 20.9602222442627, 105.792922973633, 'https://file4.batdongsan.com.vn/resize/110x110/2016/01/05/0I4XNtd4/20160105104134-53e9.jpg', 0, '2018-02-04 05:35:02.000000', '2018-02-04 05:35:02.000000', 'mod10', 'loaiduan5', NULL, NULL, NULL),
('39CA226D15D647F9', 'Mulberry Lane', 'Khu đất Cổ Ngựa, Khu ĐTM Mỗ Lao, Phường Mỗ Lao, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Mỗ Lao', NULL, '', 1, 0, '', NULL, 20.9865188598633, 105.786399841309, 'https://file4.batdongsan.com.vn/resize/110x110/2016/04/28/0I4XNtd4/20160428132945-f244.jpg', 0, '2018-02-04 04:48:08.000000', '2018-02-04 04:48:08.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('3BECD33BDD534C7D', 'Khu đô thị Mỹ Phước 3', 'Xã Thới Hòa, Bến Cát, Bình Dương', 'Bình Dương', 'Bến Cát', 'Thới Hòa', NULL, '', 1, 0, '', NULL, 11.0965175628662, 106.632972717285, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/27/eGYiO6Tq/20160827093141-bdbd.jpg', 0, '2018-02-04 04:44:45.000000', '2018-02-04 04:44:45.000000', 'mod2', 'loaiduan4', NULL, NULL, NULL),
('3D73600F46B846A8', 'Golden Park Tower', '2 Đường Phạm Văn Bạch, Phường Yên Hòa, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Yên Hòa', NULL, '', 1, 0, '', NULL, 21.0240802764893, 105.78963470459, 'https://file4.batdongsan.com.vn/resize/110x110/2017/12/14/hmcVYWuR/20171214085754-5d02.jpg', 0, '2018-02-04 05:34:44.000000', '2018-02-04 05:34:44.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('3E2390A05DC74838', 'FLC Landmark Tower', 'Đường Lê Đức Thọ, Phường Mỹ Đình 2, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình 2', NULL, '', 1, 0, '', NULL, 21.0340766906738, 105.770355224609, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825144945-5d21.jpg', 0, '2018-02-04 05:40:15.000000', '2018-02-04 05:40:15.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('40C9A1BD7BA94506', 'FLC Star Tower', 'Số 418 đường Quang Trung, phường Quang Trung, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Quang Trung', NULL, '', 1, 0, '', NULL, 20.9625549316406, 105.765251159668, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826135100-8b44.jpg', 0, '2018-02-04 05:32:09.000000', '2018-02-04 05:32:09.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('4316C4B6B09543E3', 'Khu đô thị Duyên Thái', 'Xã Duyên Thái, Thường Tín, Hà Nội', 'Hà Nội', 'Thường Tín', 'Duyên Thái', NULL, '', 1, 0, '', NULL, 20.8986759185791, 105.867195129395, 'https://file4.batdongsan.com.vn/resize/110x110/2016/01/22/lGk9zKqg/20160122155144-1925.jpg', 0, '2018-02-04 05:32:01.000000', '2018-02-04 05:32:01.000000', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('475BDD4C02F64B2C', 'N03-T2 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0650177001953, 105.798934936523, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/08/0I4XNtd4/20160308085426-6bbd.jpg', 0, '2018-02-04 05:33:31.000000', '2018-02-04 05:33:31.000000', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('4944832ECA3549D7', 'Sunshine Palace', 'Ngõ 13 Lĩnh Nam, Phường Mai Động, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Mai Động', NULL, '', 1, 0, '', NULL, 20.9901828765869, 105.868659973145, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825165330-eba6.jpg', 0, '2018-02-04 05:30:40.000000', '2018-02-04 05:30:40.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('50B6EEEB03B44440', 'Star Tower (Tòa tháp Ngôi Sao)', 'Đường Dương Đình Nghệ, Phường Yên Hòa, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Yên Hòa', NULL, 'CHUNG CƯ 283 KHƯƠNG TRUNG – STAR TOWER NGÃ TƯ SỞ GIÁ CHỈ 24 TRIỆU / M2', 1, 1, 'GIỚI THIỆU CHUNG CƯ 283 KHƯƠNG TRUNG Chung cư 283 Khương Trung mang đến cho khách hàng một lựa chọn vô cùng hợp lý trong phân khúc chung cư giá rẻ tại trung tâm Hà Nội. Chỉ với 23.8 triệu / m2 giá gốc chủ đầu tư, quả thực không một dự án nào có thể so sánh được với Star Tower – chung cư 283 Khương Trung về giá. Đứng trên góc độ giá cả, đây chính là chung cư rẻ nhất Hà Nội. Một dự án tầm trung, có đầy đủ các tiện ích hiện đại như bể bơi bốn mùa, siêu thị, trung tâm thương mại, nhà trẻ, sân vườn, gym, spa…mà chỉ 1.8 tỷ / căn 73.5 m2 quả thực khó tin. Do đó, quý khách đã có lời ngay từ khi ký hợp đồng mua căn hộ Chung cư 283 Khương Trung.', NULL, 21.0249767303467, 105.791229248047, 'https://file1.batdongsan.com.vn/thumb110x110.114263.jpg', 0, '2018-02-03 02:36:23.000000', '2018-02-03 02:36:23.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('5569481F61A14086', 'Khu đô thị mới Văn Phú', 'Đường Lê Trọng Tấn, Phường Phú La, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Phú La', NULL, '', 1, 0, '', NULL, 20.9582824707031, 105.767196655273, 'https://file4.batdongsan.com.vn/resize/110x110/2016/06/09/0I4XNtd4/20160609101356-df26.jpg', 0, '2018-02-04 05:38:15.000000', '2018-02-04 05:38:15.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('570592FD32A94085', 'VP6 Linh Đàm', 'Bán đảo Linh Đàm - Khu đô thị Linh Đàm, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', '', NULL, '', 1, 0, '', NULL, 20.9671459197998, 105.833137512207, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826115902-854c.jpg', 0, '2018-02-04 05:37:38.000000', '2018-02-04 05:37:38.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('581BCA14CD884930', 'HPC Landmark 105', 'Phường La Khê, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'La Khê', NULL, 'HPC LANDMARK 105 tọa lạc ngay mặt tiền tuyến đường Tố Hữu (Lê Văn Lương kéo dài), nằm trong tổng thể dự án Khu đô thị mới Văn Khê mở rộng (Usilk City). Được xây dựng trên diện tích khuôn viên hơn 9,2 ha, với quy mô 9 tòa gồm 13 block cao từ 25 đến 50 tầng, Usilk City được ví như một thành phố thu nhỏ đa chức năng, phong cách và hiện đại.', 1, 2.3, 'HPC LANDMARK 105 tọa lạc ngay mặt tiền tuyến đường Tố Hữu (Lê Văn Lương kéo dài), nằm trong tổng thể dự án Khu đô thị mới Văn Khê mở rộng (Usilk City). Được xây dựng trên diện tích khuôn viên hơn 9,2 ha, với quy mô 9 tòa gồm 13 block cao từ 25 đến 50 tầng, Usilk City được ví như một thành phố thu nhỏ đa chức năng, phong cách và hiện đại.', NULL, 20.9736671447754, 105.758712768555, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/19/0I4XNtd4/20160319093916-e02a.jpg', 0, '2018-02-03 03:00:03.000000', '2018-02-03 03:00:03.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('59146EE0A4D448BE', 'Thành phố Giao Lưu', 'Đường Phạm Văn Đồng, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', '', NULL, '', 1, 0, '', NULL, 21.0509147644043, 105.778205871582, 'https://file1.batdongsan.com.vn/thumb110x110.315422.jpg', 0, '2018-02-04 05:35:13.000000', '2018-02-04 05:35:13.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('5BB00D5F0D9649E4', 'Khu đô thị mới Dương Nội', 'Đường Tố Hữu, Phường La Khê, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'La Khê', NULL, 'Thông tin tổng quan dự án Khu đô thị mới Dương Nội thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Dương Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9719924926758, 105.756340026855, 'http://www.canhogiadinhviet.com/upload/category/danh-gia-vi-tri-tien-ich-can-ho-the-cbd-premium-home-quan-2-1498666539.jpg,http://sanphuongdong.vn/webroot/img/images/khu-do-thi-duong-noi(1).jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod200', 'loaiduan1', NULL, NULL, NULL),
('5C418A5237D24DC5', 'Tam Đa BCR', '197 Đường Tam Đa, Phường Trường Thạnh, Quận 9, Hồ Chí Minh', 'Hồ Chí Minh', 'Quận 9', 'Trường Thạnh', NULL, 'Khu Du Lịch The BCR tọa lạc tại 191 đường Tam Đa, P.Trường Thạnh, Quận 9, chỉ cách trung tâm TP. Hồ Chí Minh khoảng 45 phút đi xe, là khu du lịch nghỉ dưỡng, vui chơi giải trí dành cho những ai yêu thích thiên nhiên sông nước, thể dục thể thao vận động ngoài trời.', 1, 2, 'Khu Du Lịch The BCR tọa lạc tại 191 đường Tam Đa, P.Trường Thạnh, Quận 9, chỉ cách trung tâm TP. Hồ Chí Minh khoảng 45 phút đi xe, là khu du lịch nghỉ dưỡng, vui chơi giải trí dành cho những ai yêu thích thiên nhiên sông nước, thể dục thể thao vận động ngoài trời như: bắn súng sơn, bắn súng nước, bắn trái cây, bắn cung, bắn đạn chì, hồ bơi sát sông, nhà hàng sát sông, chèo thuyền kayak, bắt cá tay không, khu mini golf, nông trại thực nghiệm, smashdown, zord ball, tennis, câu cá, phòng hội nghị, phòng nghỉ Bungalow, cắm trại, khu shopping, khu vui chơi thiếu nhi ngoài trời,…', NULL, 10.7993011474609, 106.840263366699, 'https://file4.batdongsan.com.vn/resize/110x110/2017/12/18/hmcVYWuR/20171218082515-9df6.jpg', 0, '2018-02-03 02:56:11.000000', '2018-02-03 02:56:11.000000', 'mod10', 'loaiduan9', NULL, NULL, NULL),
('60EE7AAE30EB4A84', 'N03 -T8 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.064998626709, 105.800285339355, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/10/0I4XNtd4/20160310144053-ca44.jpg', 0, '2018-02-04 05:33:12.000000', '2018-02-04 05:33:12.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('636BF55B44C64014', 'Khu đô thị Kim Văn - Kim Lũ (Golden Silk)', 'Đường Nghiêm Xuân Yêm, Phường Đại Kim, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Đại Kim', NULL, 'Dự án Khu đô thị mới Kim Văn Kim Lũ - Golden Silk nằm ở vị trí giáp cửa ngõ phía Tây Nam Thành phố, trên đường Vành đai 3, cách nút giao Khuất Duy Tiến và Nguyễn Trãi hơn 1 km. Dự án có tổng mức đầu tư trên 3.000 tỷ đồng, được triển khai thực hiện từ Quý IV/2010 đến năm 2015 và xây dựng đồng bộ hạ tầng kỹ thuật theo quy hoạch chi tiết tỷ lệ 1/500.', 1, 0, 'Dự án Khu đô thị mới Kim Văn Kim Lũ - Golden Silk nằm ở vị trí giáp cửa ngõ phía Tây Nam Thành phố, trên đường Vành đai 3, cách nút giao Khuất Duy Tiến và Nguyễn Trãi hơn 1 km. Dự án có tổng mức đầu tư trên 3.000 tỷ đồng, được triển khai thực hiện từ Quý IV/2010 đến năm 2015 và xây dựng đồng bộ hạ tầng kỹ thuật theo quy hoạch chi tiết tỷ lệ 1/500.', NULL, 20.9732913970947, 105.820007324219, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/04/0I4XNtd4/20160304093133-3c28.jpg', 0, '2018-02-04 05:40:24.000000', '2018-02-04 05:40:24.000000', 'mod3', 'loaiduan4', NULL, NULL, NULL),
('64E0E336308B4C2F', 'Quang Trung Diamond', 'Đường Quang Trung, Phường Hiệp Phú, Quận 9, Hồ Chí Minh', 'Hồ Chí Minh', 'Quận 9', 'Hiệp Phú', NULL, '', 1, 0, '', NULL, 10.839282989502, 106.773284912109, 'https://file4.batdongsan.com.vn/resize/110x110/2017/12/13/hmcVYWuR/20171213152620-b45c.jpg', 0, '2018-02-04 05:35:39.000000', '2018-02-04 05:35:39.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('6814869A9A964276', 'Rice Home Sông Hồng', 'Đường Gia Quất, Phường Thượng Thanh, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thượng Thanh', NULL, 'Dự án Rice Home Sông Hồng (hay còn gọi là Rice City Sông Hồng) do Công ty CP BIC Việt Nam làm chủ đầu tư, tọa lạc tại cửa ngõ phía Đông Hà Nội, được phát triển theo một mô hình cảnh quan và kiến trúc và độc đáo của tiểu khu Adiva tại khu đô thị Desa Park City, Thủ đô Kuala Lumpur, Malaysia.', 1, 3.5, 'Dự án Rice Home Sông Hồng (hay còn gọi là Rice City Sông Hồng) do Công ty CP BIC Việt Nam làm chủ đầu tư, tọa lạc tại cửa ngõ phía Đông Hà Nội, được phát triển theo một mô hình cảnh quan và kiến trúc và độc đáo của tiểu khu Adiva tại khu đô thị Desa Park City, Thủ đô Kuala Lumpur, Malaysia', NULL, 21.0538291931152, 105.877616882324, 'https://file4.batdongsan.com.vn/resize/110x110/2015/11/23/0I4XNtd4/20151123160806-dd23.jpg', 0, '2018-02-03 02:58:48.000000', '2018-02-03 02:58:48.000000', 'mod2', 'loaiduan4', NULL, NULL, NULL),
('753DDE4730B942DE', 'Xuân Phương Tasco', 'Xã Xuân Phương, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Xuân Phương', NULL, '', 1, 0, '', NULL, 21.0253524780273, 105.741302490234, 'https://file4.batdongsan.com.vn/resize/110x110/2015/09/25/0I4XNtd4/20150925140642-3dcc.jpg', 0, '2018-02-04 05:30:31.000000', '2018-02-04 05:30:31.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('768A4E3112DB43A9', 'N03-T3&T4 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0644302368164, 105.79842376709, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/10/0I4XNtd4/20160310094315-e647.jpg', 0, '2018-02-04 05:32:49.000000', '2018-02-04 05:32:49.000000', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('7978A3A2C46C4D77', 'Chung cư 622 Minh Khai', 'Số 622 đường Minh Khai, phường Minh Khai, quận Hai Bà Trưng, Hà Nội', 'Hà Nội', 'Hai Bà Trưng', 'Minh Khai', NULL, '', 1, 0, '', NULL, 20.998010635376, 105.868362426758, 'https://file4.batdongsan.com.vn/resize/110x110/2016/09/10/0I4XNtd4/20160910112907-6ff9.jpg', 0, '2018-02-04 05:32:40.000000', '2018-02-04 05:32:40.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('7B3B8430C95A4818', 'CC1 Hà Đô Parkside', 'Phường Dịch Vọng, quận Cầu Giấy, TP. Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', NULL, '', 1, 0, '', NULL, 21.0347061157227, 105.792343139648, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825164534-cce5.jpg', 0, '2018-02-04 05:30:50.000000', '2018-02-04 05:30:50.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('7E987B4CAB51420F', 'Smart Center House', 'Đường Võ Chí Công, Phường Hòa Quý, Ngũ Hành Sơn, Đà Nẵng', 'Đà Nẵng', 'Ngũ Hành Sơn', 'Hòa Quý', NULL, '', 1, 0, '', NULL, 16.000804901123, 108.232749938965, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/RigI3kCz/20160825143755-86e5.jpg', 0, '2018-02-04 05:34:00.000000', '2018-02-04 05:34:00.000000', 'mod3', 'loaiduan4', NULL, NULL, NULL),
('7FCADF68EC4242C9', 'Khu đô thị Văn Khê', 'Văn Khê, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'Văn Khê', NULL, 'Dự án Khu nhà ở đô thị chung cư Văn Khê nằm trên đường Láng Hạ – Thanh Xuân kéo dài, cách trung tâm hội nghị Quốc gia khoảng 3km, nằm cách trung tâm TP. Hà Đông khoảng 1km về phía Tây, thuộc địa phận xã Văn Khê. Vị trí của dự án phía Bắc giáp với đường Ngô Thì Nhậm kéo dài, phía Tây giáp với đường vành đai TP. Hà Đông rộng 36m, phía Đông giáp đường 24m, phía Nam giáp với khu dân cư và khu tập thể Chùa Ngòi và đường Ngô Quyền.', 1, 1.5, 'Dự án Khu nhà ở đô thị chung cư Văn Khê nằm trên đường Láng Hạ – Thanh Xuân kéo dài, cách trung tâm hội nghị Quốc gia khoảng 3km, nằm cách trung tâm TP. Hà Đông khoảng 1km về phía Tây, thuộc địa phận xã Văn Khê. Vị trí của dự án phía Bắc giáp với đường Ngô Thì Nhậm kéo dài, phía Tây giáp với đường vành đai TP. Hà Đông rộng 36m, phía Đông giáp đường 24m, phía Nam giáp với khu dân cư và khu tập thể Chùa Ngòi và đường Ngô Quyền.', NULL, 20.9745693206787, 105.76432800293, 'https://file1.batdongsan.com.vn/thumb110x110.113374.jpg', 1, '2018-02-03 02:32:14.000000', '2018-02-03 02:32:14.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('8033608E7E184EBC', 'Vinhomes Sky Lake', 'Đường Phạm Hùng, xã Mễ Trì, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mễ Trì', NULL, '', 1, 0, '', NULL, 21.0190830230713, 105.781730651855, 'https://file4.batdongsan.com.vn/resize/110x110/2016/12/21/0I4XNtd4/20161221110019-f513.jpg', 0, '2018-02-04 05:38:35.000000', '2018-02-04 05:38:35.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('84F8F07AA60A4833', 'Lâm Viên Villas', 'Xã Đặng Xá, Gia Lâm, Hà Nội', 'Hà Nội', 'Gia Lâm', 'Đặng Xá', NULL, 'Khu đô thị Đặng Xá có tổng diện tích 69.6ha, chia làm 2 giai đoạn, giai đoạn 1 có diện tích 30.6 ha khởi công tháng 7/2003 đến nay đã hoàn thành đầu tư xong 180.000m2 sàn nhà ở và hệ thống hạ tầng kỹ thuật, hạ tầng xã hội như trường học, nhà trẻ, khu vui chơi thể thao, công viên, bãi xe, bể bơi, siêu thị...', 1, 1.5, 'Khu đô thị Đặng Xá có tổng diện tích 69.6ha, chia làm 2 giai đoạn, giai đoạn 1 có diện tích 30.6 ha khởi công tháng 7/2003 đến nay đã hoàn thành đầu tư xong 180.000m2 sàn nhà ở và hệ thống hạ tầng kỹ thuật, hạ tầng xã hội như trường học, nhà trẻ, khu vui chơi thể thao, công viên, bãi xe, bể bơi, siêu thị...', NULL, 21.0193996429443, 105.949851989746, 'https://file4.batdongsan.com.vn/resize/110x110/2015/02/11/JGcIp0rf/20150211150707-fc33.jpg', 0, '2018-02-03 02:38:21.000000', '2018-02-03 02:38:21.000000', 'mod2', 'loaiduan10', NULL, NULL, NULL),
('8606FDC9FF1D4779', 'N03-T5 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0641841888428, 105.799163818359, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/10/0I4XNtd4/20160310105134-d9cd.jpg', 0, '2018-02-04 05:33:02.000000', '2018-02-04 05:33:02.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('8AC21A2C79434132', 'Premier Village Đà Nẵng', 'Đường Võ Nguyên Giáp, Phường Mỹ An, Ngũ Hành Sơn, Đà Nẵng', 'Đà Nẵng', 'Ngũ Hành Sơn', 'Mỹ An', NULL, '', 1, 0, '', NULL, 16.0435066223145, 108.248374938965, 'https://file4.batdongsan.com.vn/resize/110x110/2015/08/04/0I4XNtd4/20150804103628-0a8b.jpg', 0, '2018-02-04 05:39:29.000000', '2018-02-04 05:39:29.000000', 'mod10', 'loaiduan7', NULL, NULL, NULL),
('8B5D9CED39CA448A', 'Five Star Mỹ Đình', 'Đường Đình Thôn, Phường Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình 1', NULL, '', 1, 0, '', NULL, 21.0186290740967, 105.775596618652, 'https://file4.batdongsan.com.vn/resize/110x110/2015/12/01/hmcVYWuR/20151201133317-cedd.jpg', 0, '2018-02-04 05:38:58.000000', '2018-02-04 05:38:58.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('8BDFDD510E0C4739', 'Gamuda City', 'Phố Yên Duyên, Phường Yên Sở, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai,', 'Yên Sở', NULL, 'Thông tin tổng quan dự án Gamuda tinhthức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Gamuda tinhnTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 20.9698810577393, 105.871681213379, 'http://gamudacityvip.com/wp-content/uploads/2016/01/%5E47241A0CD7B3BF9BACB9F75A2A1658B6142A1475CFB4708E5F%5Epimgpsh_fullsize_distr-2.jpg,https://media.laodong.vn/Uploaded/hoangtragiang/2016_07_10/Fa_twoResidence_aerialView.resized_HPQQ.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('8C9BCDA6B2164C3A', 'HaDo Centrosa Garden', 'Số 200 đường 3/2, phường 12, quận 10, Tp.HCM', 'Hồ Chí Minh', 'Quận 10', 'Phường 12', NULL, '', 1, 0, '', NULL, 10.7762517929077, 106.679267883301, 'https://file4.batdongsan.com.vn/resize/110x110/2016/02/26/0I4XNtd4/20160226095133-de60.jpg', 0, '2018-02-04 05:35:47.000000', '2018-02-04 05:35:47.000000', 'mod10', 'loaiduan5', NULL, NULL, NULL),
('8CD5489A8F854430', 'Chung cư D2 Giảng Võ', 'Phố Giảng Võ, Ba Đình, Hà Nội', 'Hà Nội', 'Ba Đình', 'Giảng Võ', NULL, '', 1, 0, '', NULL, 21.025936126709, 105.822189331055, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/02/RigI3kCz/20160802163404-e199.jpg', 0, '2018-02-04 05:31:37.000000', '2018-02-04 05:31:37.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('900BDB76B5154BD0', 'Evelyne Gardens - Parktinh Hà Nội', 'Phố Lê Trọng Tấn, phường La Khê, Hà Đông, Hà Nội', 'Hà Nội', 'Hà Đông', 'La Khê', NULL, '', 1, 1, '', NULL, 20.964075088501, 105.756164550781, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/17/0I4XNtd4/20160317082611-a770.jpg', 0, '2018-02-04 04:41:38.000000', '2018-02-04 04:41:38.000000', 'mod3', 'loaiduan4', NULL, NULL, NULL),
('96511F69E2D84137', 'Star city Lê Văn Lương', 'Lô đất 4.1-CC, Đường Lê Văn Lương, Phường Nhân Chính, Thanh Xuân, Hà Nội', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', NULL, '', 1, 0, '', NULL, 21.0061817169189, 105.806427001953, 'https://file4.batdongsan.com.vn/resize/110x110/2016/06/15/0I4XNtd4/20160615151649-8ee1.jpg', 0, '2018-02-04 05:37:30.000000', '2018-02-04 05:37:30.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('96BE692325674F8C', 'Rice tinh Sông Hồng', 'Lô đất A1-05, phố Gia Quất, phường Thượng Thanh, quận Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thượng Thanh', NULL, '', 1, 0, '', NULL, 21.0543251037598, 105.877807617188, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826143012-670a.jpg', 0, '2018-02-04 04:47:33.000000', '2018-02-04 04:47:33.000000', 'mod10', 'loaiduan5', NULL, NULL, NULL),
('98AED020214440A7', 'Rainbow Linh Đàm', 'KĐT Tây Nam Linh Đàm, Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, '', 1, 0, '', NULL, 20.9638843536377, 105.824165344238, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826141616-8785.jpg', 0, '2018-02-04 05:31:13.000000', '2018-02-04 05:31:13.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('99BE5C1828C74509', 'Hải Đăng Tower', 'Ngõ 29 đường Láng Hạ, Đống Đa, Hà Nội', 'Hà Nội', 'Đống Đa', '', NULL, '', 1, 1, '', NULL, 21.0205879211426, 105.818046569824, 'https://file4.batdongsan.com.vn/resize/110x110/2016/04/08/0I4XNtd4/20160408105531-9a9d.jpg', 0, '2018-02-04 04:39:46.000000', '2018-02-04 04:39:46.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('9F4B3BF391D54A13', 'N01-T6 Ngoại Giao Đoàn', 'Phường Xuân Tảo, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Tảo', NULL, 'Với địa thế đẹp, khu du lịch The BCR trung bình đón hơn 200.000 lượt khách mỗi năm, sức chứa nhà hàng khoảng 3.000 khách cùng lúc với các món ăn đậm đà hương vị Việt Nam, phù hợp với nhóm gia đình, thanh thiếu niên, trẻ em, các công ty tổ chức team building, sinh nhật, liên hoan, cưới hỏi, hội nghị, hội thảo, hội thao … trong không gian xanh mát, sạch sẽ.', 1, 3, 'Với địa thế đẹp, khu du lịch The BCR trung bình đón hơn 200.000 lượt khách mỗi năm, sức chứa nhà hàng khoảng 3.000 khách cùng lúc với các món ăn đậm đà hương vị Việt Nam, phù hợp với nhóm gia đình, thanh thiếu niên, trẻ em, các công ty tổ chức team building, sinh nhật, liên hoan, cưới hỏi, hội nghị, hội thảo, hội thao … trong không gian xanh mát, sạch sẽ.', NULL, 21.0637378692627, 105.79704284668, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/04/0I4XNtd4/20160304172031-ff6c.jpg', 0, '2018-02-03 02:56:20.000000', '2018-02-03 02:56:20.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('A01D025B32404555', 'CT1 Thạch Bàn', 'Phường Thạch Bàn, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thạch Bàn', NULL, '', 1, 0, '', NULL, 21.0195560455322, 105.907272338867, 'https://file4.batdongsan.com.vn/resize/110x110/2016/06/29/0I4XNtd4/20160629083923-f376.jpg', 0, '2018-02-04 05:34:53.000000', '2018-02-04 05:34:53.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('A137C61EED8B4DE1', 'Handico Tower', 'Đường Phạm Hùng, Xã Mễ Trì, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mễ Trì', NULL, '', 1, 0, '', NULL, 21.0166149139404, 105.781608581543, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826113407-bc4a.jpg', 0, '2018-02-04 05:39:38.000000', '2018-02-04 05:39:38.000000', 'mod3', 'loaiduan2', NULL, NULL, NULL),
('A258F47757B241E5', 'Khu chức năng đô thị Ao Sào', 'Phường Thịnh Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Thịnh Liệt', NULL, 'Phường Thịnh Liệt, Hoàng Mai, HN (Nằm giữa khu Hồ Đền Lừ và Quận ủy Hoàng Mai)– Phía Nam giáp sông Sét và Công viên Yên Sở– Phía Tây giáp  Giáp Tứ, Thịnh Liệt– Phía Đông và Bắc giáp Khu đô thị mới Tây Bắc Hồ Yên Sở.', 1, 1.8, 'Phường Thịnh Liệt, Hoàng Mai, HN (Nằm giữa khu Hồ Đền Lừ và Quận ủy Hoàng Mai)– Phía Nam giáp sông Sét và Công viên Yên Sở– Phía Tây giáp  Giáp Tứ, Thịnh Liệt– Phía Đông và Bắc giáp Khu đô thị mới Tây Bắc Hồ Yên Sở.', NULL, 20.9755954742432, 105.85230255127, 'https://file4.batdongsan.com.vn/resize/110x110/2016/11/19/0I4XNtd4/20161119084559-675d.jpg', 2, '2018-02-03 02:59:54.000000', '2018-02-03 02:59:54.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('A46ED7F71F8949DF', 'Mỹ Đình Pearl', 'Xã Mễ Trì, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mễ Trì', NULL, '', 1, 0, '', NULL, 21.0068492889404, 105.769317626953, 'https://file1.batdongsan.com.vn/thumb110x110.114307.jpg', 0, '2018-02-04 05:37:12.000000', '2018-02-04 05:37:12.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('AE1B4AC93E2C4AF2', 'N01-T7 Ngoại Giao Đoàn', 'Phường Xuân Tảo, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Tảo', NULL, '', 1, 0, '', NULL, 21.0635757446289, 105.795310974121, 'https://file4.batdongsan.com.vn/resize/110x110/2016/05/05/0I4XNtd4/20160505152951-fce2.jpg', 0, '2018-02-04 05:39:20.000000', '2018-02-04 05:39:20.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('B199D16DCF7541A4', 'Xuân Phương Residence', 'Phường Phương Canh, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Phương Canh', NULL, '', 1, 0, '', NULL, 21.0327262878418, 105.753746032715, 'https://file4.batdongsan.com.vn/resize/110x110/2015/12/31/lGk9zKqg/20151231155022-099d.jpg', 0, '2018-02-04 05:37:47.000000', '2018-02-04 05:37:47.000000', 'mod10', 'loaiduan2', NULL, NULL, NULL),
('B379F7C94DE640C7', 'Sky Park Residence', 'Đường Tôn Thất Thuyết, Phường Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng Hậu', NULL, 'Thông tin tổng quan dự án Sky Park Residence xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 0, 'Tên dự án Khu đô thị mới Sky Park Residence Tổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.0277194976807, 105.78589630127, 'http://chungcuskypark.net/wp-content/uploads/2017/02/chung-cu-sky-park-residene.png,http://nhadatxanhmienbac.com/wp-content/uploads/2017/12/du-an-chung-cu-golden-park-duong-dinh-nghe-so-2-pham-van-bach-01.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1', NULL, NULL, NULL),
('B6A7CCE71E754B29', 'The Premier Hà Nội', 'Đường Tôn Thất Thuyết, Phường Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng Hậu', NULL, 'Thông tin tổng quan dự án The Premier Hà Nộithức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.', 1, 1, 'Tên dự án The Premier Hà Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.0291118621826, 105.784629821777, 'https://static.bancong.vn/images/1184x466/projects/1184_466/2017/09/29/the_premier_2.jpg,https://media.sosanhnha.com/batdongsan/2017/03/23/1490205629-the-premier-ha-noi-tai-duong-ton-that-thuyet-phuong-dich-vong-hau-cau-giay-ha-no-i-picture3425.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan1', NULL, NULL, NULL),
('B70671045C6D4095', 'Khu Ngoại Giao Đoàn', 'Đường Xuân Đỉnh, Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0658397674561, 105.798149108887, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/01/0I4XNtd4/20160301135644-1c5f.jpg', 0, '2018-02-04 05:37:58.000000', '2018-02-04 05:37:58.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('C2BFD7FF00234E21', 'Golden Palace', 'Đường Mễ Trì, Xã Mễ Trì, Nam Từ Liêm, Hà Nội', 'Hà Nội', 'Nam Từ Liêm', 'Mễ Trì', NULL, '', 1, 0, '', NULL, 21.0119361877441, 105.774993896484, 'https://file1.batdongsan.com.vn/thumb110x110.113918.jpg', 0, '2018-02-04 05:39:54.000000', '2018-02-04 05:39:54.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('C7204AA19FB54725', 'HH3 Linh Đàm', 'Đường Linh Đường, Phường Hoàng Liệt, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Hoàng Liệt', NULL, '', 1, 0, '', NULL, 20.9635982513428, 105.828033447266, 'https://file1.batdongsan.com.vn/thumb110x110.434823.jpg', 0, '2018-02-04 05:39:45.000000', '2018-02-04 05:39:45.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('CFA100A1596A46FF', 'Ecohome 2', 'Phường Đông Ngạc, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', '', NULL, '', 1, 0, '', NULL, 21.0837936401367, 105.784469604492, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825160747-49a6.jpg', 0, '2018-02-04 05:31:29.000000', '2018-02-04 05:31:29.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('CFA898325F084C79', 'N02-T3 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0661106109619, 105.798057556152, 'https://file4.batdongsan.com.vn/resize/110x110/2016/03/07/0I4XNtd4/20160307102257-9919.jpg', 0, '2018-02-04 05:32:30.000000', '2018-02-04 05:32:30.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('D1BA2B46F0D144C5', 'Thành Phố Mới Bình Dương', 'Đường Lê Lợi, Phường Phú Mỹ, Thủ Dầu Một, Bình Dương', 'Bình Dương', 'Thủ Dầu Một', 'Phú Mỹ', NULL, '', 1, 0, '', NULL, 11.0563879013062, 106.681449890137, 'https://file1.batdongsan.com.vn/thumb110x110.113794.jpg', 0, '2018-02-04 04:48:59.000000', '2018-02-04 04:48:59.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('D5C6F1A915B541CB', 'Sun Grand City', 'Số 69B Thụy Khuê, Phường Thụy Khuê, Tây Hồ, Hà Nội', 'Hà Nội', 'Tây Hồ', 'Thụy Khuê', NULL, '', 1, 0, '', NULL, 21.0411720275879, 105.825096130371, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/26/eGYiO6Tq/20160826134428-b581.jpg', 0, '2018-02-04 05:33:21.000000', '2018-02-04 05:33:21.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('D8A14C46BECD4CBF', 'Cham Oasis Nha Trang', 'Phường Ngọc Hiệp, Nha Trang, Khánh Hòa', 'Khánh Hòa', 'Nha Trang', 'Ngọc Hiệp', NULL, '', 1, 0, '', NULL, 12.2656164169312, 109.190414428711, 'https://file4.batdongsan.com.vn/resize/110x110/2015/06/26/JGcIp0rf/20150626084039-78e5.jpg', 0, '2018-02-04 04:42:30.000000', '2018-02-04 04:42:30.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('DCA6B99F3B3741CC', 'Lộc Ninh Singashine', 'Đường Quốc lộ 6, Thị trấn Chúc Sơn, Chương Mỹ, Hà Nội', 'Hà Nội', 'Chương Mỹ', 'Chúc Sơn', NULL, '', 1, 0, '', NULL, 20.9264602661133, 105.712829589844, 'https://file1.batdongsan.com.vn/thumb110x110.403166.jpg', 0, '2018-02-04 05:39:08.000000', '2018-02-04 05:39:08.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('duan1', 'C7 Giảng Võ', 'Đường Trần Huy Liệu, Phường Giảng Võ, Ba Đình, Hà Nội', 'Hà Nội', 'Ba Đình', 'Giảng Võ', NULL, 'Thông tin tổng quan dự án C7 Giảng Võ\nNhà C7 Giảng Võ là tòa nhà đầu tiên được xây lại với phương thức xã hội hóa nhà ở để thay thế cho những nhà tập thể cũ đã xuống cấp ở khu vực Giảng Võ. \nDự án nằm trong chuỗi hợp tác giữa Công ty CP Tư vấn Handic - Đầu tư và phát triển nhà Hà Nội với Công ty CP Đầu tư và Sản xuất Việt Hàn. Trong khi đó, Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36 thi công, Công ty cổ phần tư vấn xây dựng An Khánh chịu trách nhiệm tư vấn giám sát.\n \n- Tên dự án: Chung cư C7 Giảng Võ\n- Vị trí dự án: Đường Trần Huy Liệu, phường Giảng Võ, quận Ba Đình, TP.Hà Nội.\n- Chủ đầu tư: Công ty CP tư vấn, đầu tư và phát triển nhà Hà Nội - HANDIC\n- Đơn vị thi công: Công ty TNHH Nhà nước một thành viên đầu tư xây lắp thương mại 36\n- Đơn vị tư vấn: Công ty cổ phần tư vấn xây dựng An Khánh\n- Tổng mức đầu tư: 91 tỷ đồng\n- Diện tích khu đất: 1660,7 m2\n- Diện tích xây dựng: 653,9 m2\n- Quy mô: 17 tầng với 1 tầng hầm\n- Diện tích đất sân vườn và cây xanh: 1000m2\n- Tổng mức đầu tư 91 Tỷ đồng', 1, 1.5, 'Tên dự án C7 Giảng Võ\nĐịa chỉĐường Trần Huy Liệu, Phường Giảng Võ, Ba Đình, Hà Nội\nTổng diện tích1.661 m²\nDiện tích xây dựng654 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàQuý I/2011\nQuy mô dự án17 tầng với 1 tầng hầm', NULL, 21.027744, 105.822208, 'http://img.thuechungcuhn.com//2016/07/14/20160714164310-9ee5.jpg,http://cdn.home-designing.com/wp-content/uploads/2012/06/Modern-interior-grafitti-art.jpg,http://www.alanyahomes.net/wp-content/uploads/2017/01/small-apartment-design.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan1', NULL, NULL, NULL),
('duan10', 'Vườn Lài Village\r\n', 'Đường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM\n', 'Hồ Chí Minh', 'Quận 12', 'An Phú', NULL, 'Thông tin dự án Vườn Lài Village\r\nVườn Lài Village nằm trên đường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM. Dự án được phân lô khoa học, đa dạng diện tích, tận dụng tối đa diện tích cây xanh và diện tích sử dụng. Đây hứa hẹn sẽ là nơi an cư và đầu tư lý tưởng cho khách hàng.\r\n- Tên dự án: Vườn Lài Village\r\n- Chủ đầu tư: Công ty CP BĐS Linkhouse\r\n- Tổng diện tích: 2,370.4m2\r\n- Diện tích xây dựng: 1,602.4m2\r\n- Tỷ lệ xây dựng: 67,6%\r\n- Các loại diện tích: 52m2, 54m2, 58m2, 61m2, 62m2, 63m2, 64m2, 65m2, 66m2, 67m2, 68m2, 70m2, 72m2, 85m2, 96m2...', 1, 3.3, 'Tên dự án Vườn Lài Village\r\nĐịa chỉĐường Vườn Lài, phường An Phú Đông, quận 12, Tp.HCM\r\nTổng diện tích2.370 m²\r\nDiện tích xây dựng1.602 m²\r\nLoại hình phát triểnBiệt thự liền kề', NULL, 10.863539, 106.690548, 'http://phuongarcland.com/upload/news/34703856.JPG', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan10', NULL, NULL, NULL),
('duan11', 'HC Golden City\r\n', 'Tổ 10, phường Bồ Đề, Long Biên, Hà Nội\r\n', 'Hà Nội', 'Long Biên', 'Bồ Đề', NULL, 'Thông tin dự án HC Golden City\r\nHC Golden City (liền kề 319 Bồ Đề) thuộc tổ 10 phường Bồ Đề, quận Long Biên, Hà Nội. Dự án nằm ngay bên cạnh tuyến đường Nguyễn Văn Cừ, gần trung tâm Aeon, cách khu vực phố Cổ chưa tới 4km.\r\n- Tên dự án: HC Golden City\r\n- Chủ đầu tư: Công ty 319 Bộ Quốc phòng\r\n- Quy mô: Gồm gần 100 lô liền kề, biệt thự\r\n- Loại hình: Liền kề, Shophouse, căn hộ cao cấp, biệt thự cao cấp...', 1, 3, 'Tên dự án HC Golden City\r\nChủ đầu tưCông ty xây dựng 319 Bộ Quốc phòng\r\nĐịa chỉTổ 10, phường Bồ Đề, Long Biên, Hà Nội\r\nLoại hình phát triểnBiệt thự liền kề\r\nGiá bán70 triệu/m²\r\nQuy mô dự ánGần 100 lô liền kề, biệt thự', NULL, 21.037956, 105.872865, 'http://hcgoldencity.com/wp-content/uploads/2017/05/shophouse-1.png', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan10', NULL, NULL, NULL),
('duan2', 'Hà Nội Aqua Central', 'Số 44 Yên Phụ, phường Trúc Bạch, quận Ba Đình, Hà Nội', 'Hà Nội', 'Ba Đình', 'Trúc Bạch', NULL, 'Thông tin dự án Hà Nội Aqua Central\nHà Nội Aqua Central - 44 Yên Phụ là dự án chung cư cao 21 tầng với tổng cộng 238 căn hộ và penthouse. Các căn hộ tại dự án được lắp đặt đầy đủ nội thất gắn tường từ những thương hiệu nổi tiếng đến từ Hoa Kỳ, Nhật Bản và châu Âu với phong cách hài hòa, bố cục sang trọng, màu sắc trang nhã.\nChung cư 44 Yên Phụ được thiết kế vườn cảnh trong các căn hộ đem tới không gian tươi mát, gần gũi thiên nhiên, ngập tràn gió trời và ánh nắng, không gian sống vô cùng tinh tế thể hiện tích cách con người và văn hóa đặc trưng của Phố cổ Hà Nội.\n- Tên dự án: Hà Nội Aqua Central - chung cư 44 Yên Phụ\n- Loại hình: Tòa nhà hỗn hợp văn phòng, thương mại dịch vụ khách sạn và căn hộ thương mại cao cấp\n- Chủ đầu tư: Công ty CP Tháp nước Hà Nội\n- Đơn vị thi công: Sông Đà 207 và Long Giang\n- Tổng diện tích: 6.468m2\n- Mật độ xây dựng: 50.6%\n- Quy mô: Tòa nhà 21 tầng, trong đó:\n+ Tầng hầm: 3 tầng hầm, tổng diện tích 9894m2\n+ Tầng 1-3: Trung tâm thương mại\n+ Tầng 4 -20: Căn hộ thương mại (tầng 21A-21B: căn Penthouse)\n- Thời gian khởi công: 08/2016\n- Dự kiến hoàn thành: 10/2018', 1, 2, 'Tên dự án Hà Nội Aqua Central\nChủ đầu tưCông ty CP Tháp nước Hà Nội\nĐịa chỉSố 44 Yên Phụ, phường Trúc Bạch, quận Ba Đình, Hà Nội\nTổng diện tích6.468 m²\nLoại hình phát triểnCăn hộ, Chung cư\nBàn giao nhàTháng 10/2018\nGiá bán60 triệu/m²\nQuy mô dự ánTòa nhà 21 tầng nổi và 3 tầng hầm', NULL, 21.047574, 105.809298, 'http://hanoiaquacentral.com/wp-content/uploads/2016/03/Hanoi-Aqua-Central.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan1', NULL, NULL, NULL);
INSERT INTO `companies_duan` (`id`, `name`, `address`, `tinh`, `huyen`, `xa`, `details_address`, `intro`, `status`, `pricefrom`, `infoduan`, `tiendo`, `latitude`, `longitude`, `thumbs`, `uutien`, `timecreate`, `timemodify`, `modname_id`, `type_id`, `anh360`, `panorama_image`, `video`) VALUES
('duan3', 'TRÚC BẠCH BUILDING', '141 Hoàng Hoa Thám, Phường Nghĩa Đô, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Nghĩa Đô', NULL, 'HAREC Building là một tòa nhà cho thuê văn phòng hạng B, được trang bị hệ thống cơ sở hạ tầng hiện đại và quản lý chuyên nghiệp. Với trang thiết bị đồng bộ, công nghệ thông tin hiện đại, nội thất đẹp tràn đầy ánh sáng tự nhiên, mỗi tầng rộng 735 m2 rất tiện lợi để làm văn phòng cho các công ty trong và ngoài nước.\nDự án là một trong những rất ít tòa nhà tại Hà Nội có 2 tầng hầm làm nơi để xe với hai cửa ra, vào riêng biệt. Tòa nhà 15 tầng với tổng diện tích thuê 9000m2 được trang bị đầy đủ tiện nghi, hệ thống báo khói, chữa cháy tự động, hệ thống camera hiện đại, điều hòa trung tâm, máy phát dự phòng và đảm bảo các quy định về an ninh, an toàn. Hệ thống giao thông nội bộ xung quanh tòa nhà tạo nên một không gian kiến trúc độc lập, trang nhã thuận tiện, đủ khả năng đáp ứng nhu cầu đa dạng về thuê văn phòng.\nNhững lợi thế cạnh tranh:\n- Quản lý bởi công ty nổi tiếng Quốc tế chuyên nghiệp SAVILLS\n- Địa thế tốt, vị trí thuận lợi, ở gần các ngân hàng lớn trung tâm thương mại, hội chợ\n- Giao thông thuận tiện, hai làn đường\n- Quang cảnh đẹp, môi trường tốt, không gian thoáng đãng\n- Giá thuê hấp dẫn\n- Dịch vụ chuyên nghiệp', 1, 2.5, 'Trúc Bạch Building\n141 Hoàng Hoa Thám, Phường Ngọc Hà, Ba Đình, Hà Nội\nGiá từ: Đang cập nhật\nChủ đầu tư: Công ty CP Đầu tư Trúc Bạch\nDiện tích: Đang cập nhật\nTiến độ: Đã hoàn thành', NULL, 21.048715, 105.839746, 'http://media.sosanhnha.com/batdongsan/2017/03/23/1490209823-toa-nha-249a-thuy-khue-tai-249a-thuy-khue-phuong-thuy-khue-tay-ho-ha-no-i-picture5960.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan2', NULL, NULL, NULL),
('duan4', 'ROSE GARDEN', 'Đống Đa, Hà Nội', 'Hà Nội', 'Đống Đa', 'Ngọc Khánh', NULL, 'Rose Garden Residences tọa lạc tại 170 Ngọc Khánh, phường Giảng Võ, Ba Đình, Hà Nội. Dự án là một khách sạn gồm các căn hộ tự phục vụ nằm cách Khu Phố Cổ ở TP. Hà Nội 10 phút lái xe, chỉ với 8 phút để đi đến Hồ Tây.', 1, 3, 'Tên dự án Rose Garden\nĐịa chỉ170 Ngọc Khánh, Phường Giảng Võ, Ba Đình, Hà Nội\nTổng diện tích2.650 m²\nLoại hình phát triểnCao ốc văn phòng\nBàn giao nhà2013\nQuy mô dự án1 block 17 tầng', NULL, 21.025043, 105.818785, 'http://www.hanoiproperty.com/imgs/pic/170524093742_Rose-Garden-Ngoc-Khanh.jpg,https://static4.mytour.vn/resources/pictures/hotels/7/large_nco1400943091_khu-can-ho-cao-cap-rose-garden.jpg,http://nhadathot.vn/uploads/classifieds/images/cao-cap-tai-rose-garden-170-ha-noi_1444245491.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod10', 'loaiduan2', NULL, NULL, NULL),
('duan6', 'HDB Plaza', 'Xã Thanh Liệt, Thanh Trì, Hà Nội', 'Hà Nội', 'Thanh Trì', 'Thanh Liệt', NULL, 'Thông tin dự án HDB Plaza\r\nHDB Plaza nằm trên tuyến đường được xem là trung tâm thương mại và dịch vụ của huyện Thanh Trì, là cầu nối giao thông giữa Hà Đông với tuyến đường thuộc Quốc lộ 1A cũ. Dự án có vị trí vô cùng thuận lợi, dễ dàng kết nối với các vùng lân cận thông qua nhiều tuyến đường được quy hoạch mở rộng.\r\nVới đầy đủ các công năng như trung tâm thương mại, dịch vụ, văn phòng và căn hộ cao cấp, lại nằm trong khu vực có tốc độ đô thị hóa và sự tăng trưởng kinh tế rất nhanh của thành phố, HDB Plaza sẽ là một trong những địa điểm làm việc lý tưởng của nhiều doanh nghiệp.\r\nNằm trên diện tích 2 ha tại Hà Nội trên tuyến đường vành đai 3 của thành phố đang được đầu tư xây dựng với 3 toàn tháp cao trên 100m với đầy đủ các công năng như trung tâm thương mại, dịch vụ, văn phòng và căn hộ cao cấp. Đây là 1 dự án trọng điểm của Tập đoàn với tổng mức đầu tư hơn 1.500 tỷ đồng\r\n\r\n- Tên dự án: HDB Plaza\r\n- Chủ đầu tư: Công ty CP Tập đoàn HDB Việt Nam\r\n- Diện tích đất dự án: 20.479m2\r\n- Diện tích đất xây dựng: 8.800m2\r\n- Chiều cao: 30-33 Tầng, gồm 4 toàn tháp hiện đại', 1, 1.5, 'Tên dự án HDB Plaza\nChủ đầu tưCông ty CP Tập đoàn HDB Việt Nam\nĐịa chỉXã Thanh Liệt, Thanh Trì, Hà Nội\nTổng diện tích20.479 m²\nLoại hình phát triểnTrung tâm thương mại\nQuy mô dự ánDự án gồm 4 tòa tháp hiện đại, mỗi tòa cao 30 - 33 tầng', NULL, 21.016772, 105.823392, 'https://file4.batdongsan.com.vn/resize/640x430/2017/05/16/0I4XNtd4/20170516152449-a23d.jpg,http://www.worldarchitecturenews.com/news_images/27019_3.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod200', 'loaiduan3', NULL, NULL, NULL),
('duan7', 'Thuần Nghệ Green City', 'Thuần Nghệ, Sơn Tây, Hà Nội', 'Hà Nội', 'Sơn Tây', 'Thuần Nghệ', NULL, 'Thông tin tổng quan dự án Thuần Nghệ Green City\r\nSở hữu vị trí đắc địa tại thị xã và được thiết kế theo phong cách tân cổ điển mang đến giá trị cao cho chủ nhân tương lai, Thuần Nghệ Green City được kỳ vọng sẽ trở thành khu đô thị đẳng cấp bậc nhât Sơn Tây. Dự án được đầu tư bởi Công ty CP Tập đoàn Xây dựng và Du lịch Bình Minh với quy mô 16 lô biệt thự và 231 lô liền kề.\r\n- Tên dự án: Khu đô thị nhà ở Thuần Nghệ  (Green City)\r\n- Chủ đầu tư: Công ty CP Tập đoàn Xây dựng và Du lịch Bình Minh\r\n- Mô hình: Khu đô thị phức hợp nhà ở kết hợp Trung tâm thương mại\r\n- Loại hình sản phẩm: Biệt thự đơn lập và liền kề\r\n- Vị trí: Thuần Nghệ, thị xã Sơn Tây, Hà Nội\r\n- Tổng diện tích dự án: 30.000m2\r\n- Tổng số sản phẩm: 247 lô\r\n- Biệt thự: gồm 16 lô (diện tích từ 250-400m2)\r\n- Liền kề: gồm 231 lô  (các loại diện tích: 75-85-90-102-120m2)\r\n- Giá bán 15.000.000 đồng/m2\r\n- Hình thức sở hữu: Vĩnh viễn', 1, 2.2, 'Tên dự án Thuần Nghệ Green City\r\nĐịa chỉThuần Nghệ, Sơn Tây, Hà Nội\r\nTổng diện tích300.000 m²\r\nLoại hình phát triểnKhu đô thị mới\r\nGiá bán15 triệu/m²\r\nQuy mô dự án247 lô đất nền', NULL, 21.136698, 105.509634, 'http://truongphucland.vn/Portals/0/images/20170601-TONGHOP-05.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan4', NULL, NULL, NULL),
('duan8', 'T&T Tower\r\n', '120 Đường Định Công, Phường Định Công, Hoàng Mai, Hà Nội\r\n', 'Hà Nội', 'Hoàng Mai', 'Định Công', NULL, 'Thông tin tổng quan dự án T&T Tower \r\nT&T Tower là dự án được đầu tư bởi Liên danh Công ty CP Tập đoàn T&T và Công ty CP Dịch vụ Vận tải Đường sắt với quy mô 3 tầng hầm, 6 tầng đế, 21 tầng căn hộ. \r\nVới chủ đầu tư uy tín có bề dày kinh nghiệm và khẳng định được vị thế trong giới bất động sản, dự án căn hộ cao cấp T&T Tower chắc chắn sẽ là sự lựa chọn lý tưởng cho những khách hàng đang tìm kiếm không gian sống đẳng cấp cao với chất lượng tuyệt hảo.\r\nVới sự đồng nhất trong thiết kế, lối kiến trúc mở, các căn hộ tại dự án khiến chủ nhân hoàn toàn yên tâm về không gian sống cũng như việc vận dụng các yếu tố phong thuỷ vào bài trí, thiết kế mà vẫn giữ được sự sang trọng và đẳng cấp.\r\n- Tên dự án: T&T Tower 120 Định Công\r\n- Chủ đầu tư: Liên danh Công ty CP Tập đoàn T&T và Công ty CP Dịch vụ Vận tải Đường sắt\r\n- Tư vấn thiết kế: Công ty CP Đầu tư & Tư vấn Công nghệ Xây dựng Archivina\r\n- Vị trí: Số 120 Định Công, phường Định Công, quận Hoàng Mai, Hà Nội\r\n- Diện tích khu đất: 7.958m2 \r\n- Diện tích xây dựng: 6.163m2\r\n- Diện tích đất mở đường quy hoạch: 1.795m2\r\n- Mật độ xây dựng: 60%\r\n- Quy mô: 3 tầng hầm, 6 tầng đế, 21 tầng căn hộ\r\n- Số lượng sản phẩm: 40 lô biệt thự liền kề với diện tích 80-100m2 đất và 300 căn hộ \r\n- Quy mô dân số: 1.000 người\r\n- Thời gian bàn giao dự kiến: Tháng 10/2018', 1, 1.8, 'Tên dự án T&T Tower\r\nChủ đầu tưCông ty CP Tập đoàn T&T\r\nĐịa chỉ120 Đường Định Công, Phường Định Công, Hoàng Mai, Hà Nội\r\nTổng diện tích7.958 m²\r\nDiện tích xây dựng6.163 m²\r\nLoại hình phát triểnKhu phức hợp', NULL, 20.98367, 105.821986, 'http://twintowerdanang.com/wp-content/uploads/2017/12/phoi-canh-tt-da-nang-twin-towers.jpg,https://d11857ktjx1ktk.cloudfront.net/upload_image/18ae83bf6e1bd760b614e3ccada14a860219a85e12.jpg', 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod3', 'loaiduan5', NULL, NULL, NULL),
('duan9', 'C.T Sphinx Golf Club & Residences\r\n', 'Quốc lộ 22, Tân Thông Hội, Huyện Củ Chi, TP.HCM', 'Hồ Chí Minh', 'Củ Chi', 'Tân Thông Hội', NULL, '\r\nC.T Sphinx Golf Club & Residences tọa lạc trên quốc lộ 22, gần Cầu An Hạ, nằm trong vùng đất di sản 18 thôn vườn trầu, giáp ranh giữa Hóc Môn và Củ Chi. C.T Sphinx có 3 mặt là sông nước trong xanh, trải dài dọc sông Thầy Cai, con sông nối liền sông Sài Gòn với sông Vàm Cỏ Đông. Chỉ mất 30 phút di chuyển bằng ca-nô. Quý khách sẽ đến với C.T Sphinx – Sân Golf tuyệt đẹp và những biệt thự phong cách thiết kế Châu Âu.\r\n \r\n- Dự án: C.T Sphinx - sân Golf Nhân sư và khu Villas\r\n- Vị trí: Quốc lộ 22, Tân Thông Hội, Huyện Củ Chi, Tp.HCM.\r\n- Chủ đầu tư : Công ty TNHH Phát triển GS Củ Chi ( Thành viên Tập đoàn C.T Group)\r\n- Tổng diện tích: 200 ha\r\n- Tổng vốn đầu tư: 42 Triệu USD\r\n- Loại hình: Sân golf, Biệt thự', 1, 2.4, 'Tên dự án C.T Sphinx Golf Club & Residences\r\nChủ đầu tưC.T Group\r\nĐịa chỉQuốc lộ 22, Tân Thông Hội, Huyện Củ Chi, TP.HCM\r\nTổng diện tích2.000.000 m²\r\nLoại hình phát triểnKhu nghỉ dưỡng, Sinh thái\r\nBàn giao nhàQuý II/2016\r\nQuy mô dự án200 căn biệt thự', NULL, 10.927066, 106.503961, NULL, 2, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', 'mod2', 'loaiduan7', NULL, NULL, NULL),
('E2EBE889EF8549', 'Hà Nội Garden Villa (Hà Nội Garden City)', 'Phường Thạch Bàn, Long Biên, Hà Nội', 'Hà Nội', 'Long Biên', 'Thạch Bàn', NULL, 'Hà Nội Garden Villa Với trang thiết bị đồng bộ, công nghệ thông tin hiện đại, nội thất đẹp tràn đầy ánh sáng tự nhiên, mỗi tầng rộng 735 m2 rất tiện lợi để làm văn phòng cho các công ty trong và ngoài nước', 1, 2.5, 'Giá từ: Đang cập nhật Chủ đầu tư: Công ty CP Đầu tư Trúc Bạch', NULL, 21.0202102661133, 105.920616149902, 'http://vinhome.in/wp-content/uploads/2017/06/hanoi-garden-city-2.jpg,http://kimvietland.com/uploads/images/hanoigardencity-8.jpg', 1, '2017-12-24 03:53:03.893541', '2017-12-24 03:53:03.996581', '16B651', 'loaiduan2', NULL, NULL, NULL),
('E37D92C88E39420A', 'Ecohome 1', 'Phố Kẻ Vẽ, Xã Đông Ngạc, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Đông Ngạc', NULL, '', 1, 0, '', NULL, 21.0863246917725, 105.782318115234, 'https://file1.batdongsan.com.vn/thumb110x110.509390.jpg', 0, '2018-02-04 05:31:53.000000', '2018-02-04 05:31:53.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('E41CFA24FF324823', 'D’. Palais De Louis - Nguyễn Văn Huyên', 'Đường Nguyễn Văn Huyên, Phường Quan Hoa, Cầu Giấy, Hà Nội', 'Hà Nội', 'Cầu Giấy', 'Quan Hoa', NULL, '', 1, 0, '', NULL, 21.0366611480713, 105.798049926758, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825150745-b146.jpg', 0, '2018-02-04 05:38:49.000000', '2018-02-04 05:38:49.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('E88FD135AB8249ED', 'An Bình City', 'Phường Cổ Nhuế 1, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Cổ Nhuế 1', NULL, ' Chung cư An Bình City tọa lạc tại vị trí đắc địa và đẹp nhất của thu đô Hà Nội. Với phía Tây – giáp hồ điều hòa rộng 15ha. Phía Nam – giáp Bộ Công An đảm bảo an ninh tuyệt đối. Phía Đông – giáp showroom ô tô Mazda gần các trục đường chính, giao thông thuận tiện cho việc đi lại. Phía Bắc – giáp khu biệt thự TT4.', 1, 0, ' Chung cư An Bình City tọa lạc tại vị trí đắc địa và đẹp nhất của thu đô Hà Nội. Với phía Tây – giáp hồ điều hòa rộng 15ha. Phía Nam – giáp Bộ Công An đảm bảo an ninh tuyệt đối. Phía Đông – giáp showroom ô tô Mazda gần các trục đường chính, giao thông thuận tiện cho việc đi lại. Phía Bắc – giáp khu biệt thự TT4.', NULL, 21.0495662689209, 105.778594970703, 'https://file4.batdongsan.com.vn/resize/110x110/2016/04/04/0I4XNtd4/20160404084509-244c.jpg', 0, '2018-02-04 05:31:21.000000', '2018-02-04 05:31:21.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('EA1DC54792DF4177', 'Tứ Hiệp Plaza', 'Xã Tứ Hiệp, Thanh Trì, Hà Nội', 'Hà Nội', 'Thanh Trì', 'Tứ Hiệp', NULL, '', 1, 0, '', NULL, 20.9525890350342, 105.851852416992, 'https://file4.batdongsan.com.vn/resize/110x110/2016/08/25/us6Zzrro/20160825154301-ae0f.jpg', 0, '2018-02-04 05:33:43.000000', '2018-02-04 05:33:43.000000', 'mod10', 'loaiduan1', NULL, NULL, NULL),
('ED6069FBE8044EE7', 'BRG Park Residence', 'Lô 4.1 Lê Văn Lương, phường Nhân Chính, Thanh Xuân, Hà Nội', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', NULL, '', 1, 2, '', NULL, 21.0052757263184, 105.805503845215, 'https://file4.batdongsan.com.vn/resize/110x110/2016/06/10/0I4XNtd4/20160610145142-ca25.jpg', 0, '2018-02-04 04:38:58.000000', '2018-02-04 04:38:58.000000', 'mod10', 'loaiduan4', NULL, NULL, NULL),
('F12636E466C74DAD', 'N02-T1 Ngoại Giao Đoàn', 'Xã Xuân Đỉnh, Bắc Từ Liêm, Hà Nội', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', NULL, '', 1, 0, '', NULL, 21.0661659240723, 105.798118591309, 'https://file4.batdongsan.com.vn/resize/110x110/2016/09/09/us6Zzrro/20160909105218-b487.jpg', 0, '2018-02-04 05:31:45.000000', '2018-02-04 05:31:45.000000', 'mod3', 'loaiduan1', NULL, NULL, NULL),
('F4DE526AEF4C411E', 'LePARC by Gamuda', 'Đường Pháp Vân, Phường Yên Sở, Hoàng Mai, Hà Nội', 'Hà Nội', 'Hoàng Mai', 'Yên Sở', NULL, 'Tọa lạc tại cửa ngõ phía Nam Hà Nội, Le Parc by Gamuda là một điểm đến vui chơi – giải trí – mua sắm mới dành cho gia đình, bạn bè và khách du lịch vào dịp cuối tuần hay các ngày nghỉ lễ.', 1, 2, 'Được xây dựng bởi tập đoàn Gamuda Land Việt Nam, 6 khu Shop House tại Le Parc by Gamuda đều mang theo mình 6 chủ đề riêng biệt với nhiều phong cách đẹp độc lạ: Cool japan, Truly Vietnam, Cowboy Town, Hallyu, You only live once, The Cup.', NULL, 20.9698886871338, 105.872627258301, 'https://file4.batdongsan.com.vn/resize/110x110/2016/05/18/0I4XNtd4/20160518100206-0ed8.jpg', 0, '2018-02-03 02:47:15.000000', '2018-02-03 02:47:15.000000', 'mod10', 'loaiduan3', NULL, NULL, NULL);

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
-- Cấu trúc bảng cho bảng `companies_message`
--

CREATE TABLE `companies_message` (
  `id` int(11) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `details` longtext,
  `converid_id` int(11) NOT NULL,
  `recipient_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_message`
--

INSERT INTO `companies_message` (`id`, `datetime`, `details`, `converid_id`, `recipient_id`, `user_id`) VALUES
(1, '2018-06-06 00:00:00.000000', 'Xin chao ban', 1, 'user1', 'user2'),
(2, '2018-06-07 00:00:00.000000', 'Chao', 1, 'user2', 'user1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies_messagenode`
--

CREATE TABLE `companies_messagenode` (
  `id` int(11) NOT NULL,
  `node_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_messagenode`
--

INSERT INTO `companies_messagenode` (`id`, `node_id`, `user_id`) VALUES
(1, 'node1', 'user2');

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

--
-- Đang đổ dữ liệu cho bảng `companies_phancong`
--

INSERT INTO `companies_phancong` (`id`, `province`, `district`, `timemodify`, `modname_id`) VALUES
(1, 'BD', '', '2018-02-01 00:00:00.000000', '16B651'),
(2, 'SG', '', '2018-02-01 00:00:00.000000', '16B651'),
(3, 'DDN', '', '2018-02-01 00:00:00.000000', '16B651'),
(4, 'KH ', '', '2018-02-01 00:00:00.000000', '16B651'),
(5, 'DNA', '', '2018-02-04 00:00:00.000000', '16B651'),
(6, 'HN', '1,2,3,4,5,6,7,8,9', '2018-02-01 00:00:00.000000', 'mod2'),
(7, 'HN', '10,11,12,13,14,15,16,17,18,19', '2018-02-01 00:00:00.000000', 'mod3'),
(8, 'HN', '20,21,22,23,2425,26,27,28,29,718', '2018-02-01 00:00:00.000000', 'mod10');

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
  `rongtien` double DEFAULT NULL,
  `rongduong` double DEFAULT NULL,
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
  `userid_id` varchar(20) DEFAULT NULL,
  `video` longtext,
  `anh360` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_realestatenode`
--

INSERT INTO `companies_realestatenode` (`id`, `title`, `latitude`, `longitude`, `price`, `pricem2`, `area`, `tinh`, `huyen`, `xa`, `duong`, `details_address`, `address`, `huong`, `sophongngu`, `tang`, `sotang`, `rongtien`, `rongduong`, `details`, `status`, `thumbs`, `panorama_image`, `tenduan`, `tenlienhe`, `diachi`, `dienthoai`, `email`, `rank`, `timefrom`, `timeto`, `typenode`, `vip`, `modname`, `timecreate`, `timemodify`, `duanid_id`, `modid_id`, `type_id`, `userid_id`, `video`, `anh360`) VALUES
('42D57796F2', 'Bán nhà Riêng', 0, 0, -1, 0, 0, 'HN', 'Ba Đình', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 1, 'http://noithattrevietnam.com/uploaded/Kien-thuc-nha-dep/thiet-ke-noi-that-can-ho-chung-cu-cao-cap/34-can-ho/22-thiet-ke-noi-that-can-ho-chung-cu-cao-cap-The-Lancaster.jpg,http://www.acong.vn/images/news/noi_that_chung_cu/2014_starcity1308/starcity_pk01.jpg', NULL, '', 'Lê Văn Sơn', 'Thanh Xuân, Hà Nội', '01688955695', 'quoc@gmail.com', 1, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod3', 'typereal1', 'user1', NULL, NULL),
('78FB350CC4', 'Cần mua nhà riêng', 0, 0, -1, 0, 0, 'HN', '7', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 1, 'http://noithattinhte.vn/images/news/Thiet-ke-noi-that-chung-cu-cao-cap-rc_(2).jpeg,http://vtkong.net/wp-content/uploads/2016/07/thiet-ke-noi-that-can-ho-chung-cu-NETNTCC10.jpg', NULL, '', 'Phạm Đức Huy', 'Thanh Xuân, Hà Nội', '01688955695', 'hung%40gmail.com', 1, '2018-02-01 00:00:00.000000', '2018-03-01 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod10', 'typereal1', 'user1', NULL, NULL),
('E44883FBEE', 'Cần thuê nhà', 0, 0, -1, 0, 0, 'HN', '7', '', '', '', '', '', 0, NULL, NULL, 0, 0, '', 1, 'http://noithattinhte.vn/a/Noi_that_chung_cu_cao_cao_Thap_Hoa_Kim_Cuong.jpg', NULL, '', 'Hà QUốc Hưng', 'Thanh Xuân, Hà Nội', '01688955695', 'hung%40gmail.com', 1, '2018-02-04 00:00:00.000000', '2018-02-23 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', '16B651', 'typereal1', 'user1', NULL, NULL),
('node1', 'VINHOMES LIỄU GIAI METROPOLIS, MỘT SỐ CĂN ĐẸP CHÍNH CHỦ BÁN LẠI, CẬP NHẬT MỚI NHẤT NGÀY 16/11/2017', 21.031885, 105.813755, 2.4, 0, 70, 'Hà Nội', 'Ba Đình', 'Liễu Giai', 'Liễu Giai', NULL, 'Liễu Giai, Ba Đình, hà Nội', 'Tây', 2, NULL, NULL, 0, 0, 'Gia re cam ket', 1, 'http://img.thuechungcuhn.com//2016/07/14/20160714164310-9ee5.jpg,http://cdn.home-designing.com/wp-content/uploads/2012/06/Modern-interior-grafitti-art.jpg,http://www.alanyahomes.net/wp-content/uploads/2017/01/small-apartment-design.jpg,http://www.acong.vn/images/news/noi_that_chung_cu/2014_starcity1308/starcity_pk01.jpg', NULL, '', 'Lê Văn Đại', 'Hà Đông, Hà Nội', '0912123187', 'haquochung@gmail.com', 2, '2018-02-01 00:00:00.000000', '2018-02-16 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan1', 'mod2', 'typereal1', 'user1', NULL, NULL),
('node2', 'BÁN SUẤT MUA CĂN HỘ B6 GIẢNG VÕ, GIÁ 49TR/M2, CHỌN CĂN TẦNG ĐẸP 75-80-95-127M2. LH: 0984289885', 21.0340766906738, 105.770355224609, 0.7, 0, 900, 'Hồ Chí Minh', 'Bình Chánh', 'Bình Lợi', '2C', NULL, 'Bình Lợi, Bình Chánh, Hồ Chí Minh', 'Đông', 2, NULL, NULL, 0, 0, 'Gia re cam ket', 1, 'https://cdn.freshome.com/wp-content/uploads/2014/02/apartment-design2.jpg,http://www.acong.vn/images/news/noi_that_chung_cu/2014_starcity1308/starcity_pk01.jpg', NULL, '', 'Trần Thanh Trung', 'Thanh Xuân, Hà Nội', '0910123195', 'haduchien@gmail.com', 1, '2018-02-02 00:00:00.000000', '2017-08-10 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod3', 'typereal2', 'user2', NULL, NULL),
('node3', 'CĐT Tháp nước bán suất ngoại giao Hà Nội Aqua Central, liên hệ CĐT: 09492158988\n', 21.046274, 105.844371, 0.7, 0, 80.03, 'Hà Nội', 'Ba Đình', 'Trúc Bạch', 'Yên Phụ', NULL, 'Trúc Bạch, Ba Đình, Hà Nội', 'Nam', 3, NULL, NULL, 0, 0, 'Gia re cam ket', 1, 'https://noithatlongthanh.vn/upload/images/thiet-ke-noi-that-chung-cu-cao-cap-2016.jpg,http://vtkong.net/wp-content/uploads/2016/07/thiet-ke-noi-that-can-ho-chung-cu-NETNTCC10.jpg', NULL, '', 'Phạm Văn Cảnh', 'Thanh Xuân, Hà Nội', '0910097654', 'haduchien@gmail.com', 2, '2018-01-02 00:00:00.000000', '2018-02-09 00:00:00.000000', 1, 0, NULL, '2017-08-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan4', 'mod3', 'typereal7', 'user2', NULL, NULL),
('node5', 'PHÒNG KINH DOANH GOLDEN FIELD MỸ ĐÌNH, MỞ BÁN ĐỢT CUỐI, GIÁ TỪ 29TR/M2, TẶNG GÓI NỘI THẤT 60TR\n', 21.030084, 105.76747, 3.5, 0, 135.01, 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình', '', NULL, 'Mỹ Đình, Nam Từ Liêm, Hà Nội', 'Đông', 4, NULL, NULL, 0, 0, 'Gia re cam ket', 1, 'http://solution.com.vn/upload_images/images/thiet-ke-noi-that-chung-cu-sky-light-002(1).jpg,http://vtkong.net/wp-content/uploads/2016/07/thiet-ke-noi-that-can-ho-chung-cu-NETNTCC10.jpg', NULL, '', 'Trần Kiên', 'Thường Tín, Hà Nội', '0912129189', 'haquochung@gmail.com', 1, '2018-01-31 00:00:00.000000', '2018-02-15 00:00:00.000000', 1, 0, NULL, '2017-09-12 00:00:00.000000', '2017-10-14 00:00:00.000000', 'duan2', 'mod2', 'typereal7', 'user1', NULL, NULL);

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
(2, 'Sieu thi Vin', 20.999411, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice2'),
(3, 'Sieu thi Land', 13.12, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice2'),
(4, 'Truong Tieu Hoc XXY', 13.12, 52.001, NULL, '', 'Chug cu cao cap', NULL, '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice3'),
(5, 'Mua sắm tiện lợi', 20.999411, 105.870594, 'Minh Khai, Hai Bà Trưng, Hà Nội', 'Hay', 'Chug cu cao cap', 'mod2', '2017-12-27 11:22:20.439538', '2017-12-27 11:22:20.504559', 'typeservice1'),
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
(3, 'mod10', 'user2', 'Hướng dẫn thanh toán của mappy tại đây', '2018-02-01 13:23:44.000000', NULL),
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
  `avatar` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `rank` int(11) NOT NULL,
  `details` longtext NOT NULL,
  `social` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `companies_user`
--

INSERT INTO `companies_user` (`id`, `username`, `password`, `name`, `email`, `phone`, `address`, `company`, `sex`, `birthday`, `coin`, `avatar`, `status`, `rank`, `details`, `social`) VALUES
('3988E43301', 'doanh', 'sha256$J9Rku9SO$6e899175ad2284d0dac0ffb77a65de4920fe39ff016b3bfbac2b6da08f9b04a4', 'phan trong doanh~', 'phandoanh@gmail.com', '01688955295', 'Binh Dinh', 'BHome', 1, '1995-09-09', '60', 'https://file4.batdongsan.com.vn/resize/200x200/2017/12/28/JGcIp0rf/20171228150952-0d87.jpg', 1, 1, 'Là một nhà môi giới chuyên nghiệp, tôi luôn xác định lâu dài và đồng hành cùng khách hàng, lấy chữ tín làm phương châm hoạt động, tôi cam kết trung thực và đem lại lợi ích tốt nhất cho khách của mình. Với DATABASE khách hàng rất lớn tôi tin sẽ phục vụ khách hàng và TẠO RA GIÁ TRỊ GIA TĂNG TỐT NHẤT CHO QUÝ KHÁCH HÀNG CỦA CHÚNG TÔI. Khu vực môi giới MUA, BÁN VÀ CHO THUÊ tốt nhất: CÁC PHƯỜNG THẢO ĐIỀN, AN PHÚ, AN KHÁNH, BÌNH AN THUỘC QUẬN 2, TP HCM - Loại BDS môi giới nhiều nhất: Bán villa, biệt thự Bán nhà PHỐ Bán đất / đất nền dự án Dịch vụ tìm nhà cho người nước ngoài thuê nhà', ''),
('408C96A7B6', 'tuan', 'sha256$RT57V8Oq$48029272632e3cf7748dead8e189155da4541bd7a263d8837f9d474e93d02d2a', 'vu quoc tuan', 'vuquoctuan@gmail.com', '0928111828', 'Hà Nội', 'BHome', 1, '1995-09-09', '300', '', 1, 1, 'Là một nhà môi giới chuyên nghiệp có uy tín. Tôi luôn cố gắng để đem đến cho khách hàng dịch vụ tốt nhất và BDS uy tín. Tôi mong muốn có cơ hội được hợp tác với tất cả các khách hàng. Hãy đến với tôi để có những dịch vụ và BDS tốt và thành công nhất. * Khu vực môi giới tốt nhất: Gò Vấp - Q12 - Tân Bình và các quận trong Thành phố Hồ Chí Minh * Loại BDS môi giới nhiều nhất: - Bán villa, biệt thự - Bán nhà riêng - Bán nhà mặt phố', ''),
('51C09B04E8', 'duy', 'sha256$VW7XYtTA$797bcb104fb129dc88bc1c383a20b2abe7faa8600034ef6ca3f09290d0fb378d', 'phan trong doanh', 'phanduy@gmail.com', '01688955295', 'Gia Lai', 'BHome', 1, '1995-09-09', '0', '', 1, 1, '- Nhà Môi Giới tự giới thiệu: Trong thời gian vừa qua tôi luôn cố gắng để đem đến cho khách hàng dịch vụ tốt nhất và bất động sản uy tín. Mong muốn có cơ hội được hợp tác với tất cả các khách hàng.Hãy đến với tôi để có những giao dịch bất động sản thành công nhất. - Khu vực môi giới tốt nhất: Gò Vấp , Tân Bình và các quận trong thành phố hồ Chí Minh - Loại BDS môi giới nhiều nhất: + Bán villa, biệt thự + Bán nhà riêng + Bán nhà mặt phố', ''),
('B892FB32E4', 'hiep', 'sha256$akeLWn1h$3c3a1ecc900f935c53d9000c0ab231e833f3685f5a1acbdc123c627d328b4aaa', 'bach hiep', 'bachngochiep@gmail.com', '0917217271', 'Hà Nội', 'BHomes', 1, '1995-01-01', '0', 'http://mappy.com.vn/media/profile/2018/2/6/B892FB32E4.png', 1, 10, 'Là một nhà môi giới chuyên nghiệp có uy tín. Tôi luôn cố gắng để đem đến cho khách hàng dịch vụ tốt nhất và BDS uy tín. Tôi mong muốn có cơ hội được hợp tác với tất cả các khách hàng. Hãy đến với tôi để có những dịch vụ và BDS tốt và thành công nhất.  Kinh nghiệm:  Có kinh nghiệm nhiều năm trong lĩnh vực môi giới BDS về các lĩnh vực: + Bán nhà riêng + Bán nhà mặt tiền + Bán nhà biệt thự liền kề + Bán đất', ''),
('user1', 'hung', 'sha256$Numwnh9z$9d2f6ab1fabf5d7809ecdf6cc6ce1ee54b809af51f32f2a28afdcf37926b458f', 'ha quoc hung', 'hung@gmail.com', '01688955695', 'Binh Dinh', 'BHome', 1, '1995-09-09', '130', 'https://file4.batdongsan.com.vn/resize/200x200/2017/12/28/JGcIp0rf/20171228150952-0d87.jpg', 1, 1, ' Là một chuyên viên môi giới, Tôi luôn đặt ra mục tiêu nghề nghiệp của mình đó là: Uy tín, Nhanh gọn, Có trách nhiệm. Với lâu năm kinh nghiệm, Tôi luôn tư vấn cho quý khách hàng những thông tin chính xác đầy đủ nhất. Để những bất động sản sẽ được giao dịch thuận lợi, tư vấn quý khách theo cách phù hợp nhất để có được giao dịch thành công. Tất cả giao dịch được ghi trên giấy tờ, hợp đồng minh bạch đảm bảo quyền lợi công bằng cho hai bên.  Bất cứ khi nào có nhu cầu tìm hiểu về bất động sản và các thông tin liên qua, hãy liên hệ với Tôi để nhận được những thông tin chính xác và đầy đủ nhất. Rất vui về sự hợp tác.  Khu vực môi giới tốt nhất:  Quận Tân Bình - Quận Tân phú-Quân Gò Vấp - và các quận trong Thành phố hồ Chí Minh  Loại BDS môi giới nhiều nhất:  - Bán villa, biệt thự  - Bán nhà riêng  - Bán nhà mặt phố  Khu vực Nguyễn văn Trường môi giới:  - Nhà mặt phố, Nhà riêng - Q.Tân Bình  - Nhà mặt phố, Nhà riêng - Q.Gò vấp  - Nhà mặt phố, Nhà riêng - Quận Tân phú  - Bán villa - biệt thự liền kề', ''),
('user2', 'hieu', 'sha256$g8GnR9TM$476103667706ac165ae3d2d2c197eb0b10040e93bafd21f0181f97d8a2205b80', 'pham trong hieu', 'tunguyenhsgs@gmail.com', '0988111828', '', 'BHome', 1, '1995-09-09', '50', '', 1, 1, ' http://nhadatgiabao.vn cam kết luôn làm hài lòng Quý khách hàng bởi sự TẬN TÂM, CHUYÊN NGHIỆP, NỖ LỰC, NHIỆT HUYẾT và HIỆU QUẢ khi lựa chọn chúng tôi là đối tác TIN CẬY và BỀN VỮNG.  Tôi đã tạo dựng uy tín với rất nhiều khách hàng lớn nhỏ, với chuyên môn và uy tín chắc chắn sẽ đem đến dịch vụ tốt nhất với sản phẩm tốt nhất tới khách hàng.  Hãy trải nghiệm dịch vụ của chúng tôi.  Kinh nghiệm: Vừa là trung gian, vừa là chủ đầu tư, đã có trên 10 năm trong ngành đầu tư vấn bất động sản Khu vực môi giới tốt nhất: Gò Vấp, Tân Bình Lĩnh vực môi giới nhiều nhất: Bán nhà riêng, Bán nhà mặt phố', '');

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
(26, 'companies', 'message'),
(25, 'companies', 'messagenode'),
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
(24, 'companies', '0011_auto_20180201_1138', '2018-02-01 11:38:48.074155'),
(25, 'companies', '0012_user_details', '2018-02-02 14:23:04.360880'),
(26, 'companies', '0013_auto_20180204_1329', '2018-02-04 13:29:30.428558'),
(27, 'companies', '0014_auto_20180205_1337', '2018-02-05 13:37:11.556946'),
(28, 'companies', '0015_auto_20180205_1353', '2018-02-05 13:53:20.009370'),
(29, 'companies', '0016_auto_20180205_1356', '2018-02-05 13:57:00.483019'),
(30, 'companies', '0017_auto_20180205_1540', '2018-02-05 15:40:11.548539'),
(31, 'companies', '0018_auto_20180205_1651', '2018-02-05 16:51:26.066110'),
(32, 'companies', '0019_realestatenode_video', '2018-02-06 14:10:02.384017'),
(33, 'companies', '0020_auto_20180208_1605', '2018-02-08 16:05:46.047077'),
(34, 'companies', '0021_auto_20180313_2140', '2018-06-07 09:09:04.752093'),
(35, 'companies', '0022_auto_20180502_2326', '2018-06-07 09:09:05.099522'),
(36, 'companies', '0023_auto_20180502_2335', '2018-06-07 09:09:05.284262'),
(37, 'companies', '0024_auto_20180502_2347', '2018-06-07 09:09:05.551710'),
(38, 'companies', '0025_auto_20180503_1315', '2018-06-07 09:09:05.616422'),
(39, 'companies', '0026_remove_messagenode_datetime', '2018-06-07 09:09:05.663556'),
(40, 'companies', '0027_auto_20180503_1409', '2018-06-07 09:09:05.817179'),
(41, 'companies', '0028_auto_20180503_1409', '2018-06-07 09:09:05.971507'),
(42, 'companies', '0029_auto_20180503_1411', '2018-06-07 09:09:06.035138'),
(43, 'companies', '0030_auto_20180503_1429', '2018-06-07 09:09:06.144540'),
(44, 'companies', '0031_auto_20180508_2338', '2018-06-07 09:09:06.208784'),
(45, 'companies', '0032_auto_20180607_0908', '2018-06-07 09:09:06.231414');

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
('ap3teilzrde6ol4c2xo5yihw30on9380', 'NzYwODQ3OGJjOTNmYzE0MmQ3ZWZhMjZkNmI1MWZlYzQ2OWFjZTk4Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3M2U3ZTlkNDVhY2QxYWI2N2UxYTkwMWRlNmU4YmU1YTc4ZWUwZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-06-21 09:11:23.246537'),
('mz55lrb6pu8j3kdh320sdry2vmkhjmi6', 'NzYwODQ3OGJjOTNmYzE0MmQ3ZWZhMjZkNmI1MWZlYzQ2OWFjZTk4Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3M2U3ZTlkNDVhY2QxYWI2N2UxYTkwMWRlNmU4YmU1YTc4ZWUwZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-02-08 15:59:42.046610'),
('wj86k70bfh3omxxod6w0ftbbvg3m75ll', 'NzYwODQ3OGJjOTNmYzE0MmQ3ZWZhMjZkNmI1MWZlYzQ2OWFjZTk4Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3M2U3ZTlkNDVhY2QxYWI2N2UxYTkwMWRlNmU4YmU1YTc4ZWUwZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-02-16 09:59:10.149259');

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
-- Chỉ mục cho bảng `companies_message`
--
ALTER TABLE `companies_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_message_converid_id_2ac05242_fk_companies` (`converid_id`),
  ADD KEY `companies_message_recipient_id_3dc29c15_fk_companies_user_id` (`recipient_id`),
  ADD KEY `companies_message_user_id_d140822d_fk_companies_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `companies_messagenode`
--
ALTER TABLE `companies_messagenode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_messagenode_node_id_6433550c` (`node_id`),
  ADD KEY `companies_messagenode_user_id_28f35fb2` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
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
-- AUTO_INCREMENT cho bảng `companies_message`
--
ALTER TABLE `companies_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `companies_messagenode`
--
ALTER TABLE `companies_messagenode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `companies_phancong`
--
ALTER TABLE `companies_phancong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
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
-- Các ràng buộc cho bảng `companies_message`
--
ALTER TABLE `companies_message`
  ADD CONSTRAINT `companies_message_converid_id_2ac05242_fk_companies` FOREIGN KEY (`converid_id`) REFERENCES `companies_messagenode` (`id`),
  ADD CONSTRAINT `companies_message_recipient_id_3dc29c15_fk_companies_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `companies_user` (`id`),
  ADD CONSTRAINT `companies_message_user_id_d140822d_fk_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `companies_user` (`id`);

--
-- Các ràng buộc cho bảng `companies_messagenode`
--
ALTER TABLE `companies_messagenode`
  ADD CONSTRAINT `companies_messagenod_node_id_6433550c_fk_companies` FOREIGN KEY (`node_id`) REFERENCES `companies_realestatenode` (`id`),
  ADD CONSTRAINT `companies_messagenode_user_id_28f35fb2_fk_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `companies_user` (`id`);

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
