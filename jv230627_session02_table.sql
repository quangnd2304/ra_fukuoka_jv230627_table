-- 1. Tạo cơ sở dữ liệu có tên JV230627_DB
/*
	Chú ý:
		Trong CSDL không phân biệt hoa thường
*/
create database jv230627_db;
-- 2. Xóa cơ sở dữ liệu jv230627_db
drop database jv230627_db;
-- 3. Sử dụng database jv230627_db để thực hiện các thao tác khác
use jv230627_db;
-- 4. Lấy năm tháng ngày của hệ thống
select curdate();
-- 5. Lấy giờ phút giây của hệ thống
select curtime();
-- 6. Lấy năm - tháng - ngày giờ - phút - giây của hệ thống
select now();
/*
	7. Tạo bảng danh mục sản phẩm gồm các trường: 
		- mã danh mục - int: Khóa chính, tự tăng
		- tên danh mục - varchar(100): not null và duy nhất
        - độ ưu tiên danh mục - int: not null
        - trạng thái danh mục - bit: giá trị mặc định là 0
    CREATE TABLE [TableName](
		[ColumnName] [Datatype] [contraints],
    )
    primarykey = not null + unique
*/
create table categories(
	-- khai báo các cột trong bảng
    categories_id int primary key auto_increment,
    categories_name varchar(100) not null unique,
    priority int not null,
    categories_status bit default(0)
);
/*
	8. Tạo bảng Sản phẩm gồm các thông tin sau:
    - Mã sản phẩm - char(5): khóa chính
    - Tên sản phẩm - varchar(50): not null và duy nhất
    - Giá - float: not null và có giá trị lớn hơn 0
    - Mô tả sản phẩm - text
    - Mã danh mục - int: khóa ngoại của bảng categories
    - Trạng thái - bit : mặc định là 0
*/
create table product(
	product_id char(5) primary key,
    product_name varchar(50) not null unique,
    price float not null check(price>0),
    descriptions text,
    categories_id int,
    foreign key(categories_id) references categories(categories_id),
    product_status bit default(0)
);
-- 9. Xóa bảng product
drop table product;
-- 10. Xóa bảng categories
drop table categories;
-- 11. Thêm 1 cột title có kiểu dữ liệu varchar(100) vào product
alter table product
	add column title varchar(100);
-- 12. Xóa cột title trong bảng product
alter table product
	drop column title;
-- 13. Sửa tên cột descriptions thành product_descriptions
alter table product
	rename column descriptions to product_descriptions;
-- 14. Đổi kiểu dữ liệu của cột product_name thành varchar(150)
alter table product
	modify column product_name varchar(150);
-- 15. Thêm cột nhà sản xuất varchar(100) vào bảng product
alter table product
	add column manufacturer varchar(100);
-- 16. Thêm rằng buộc unique cho cột nhà sản xuất
alter table product
	add unique(manufacturer);

