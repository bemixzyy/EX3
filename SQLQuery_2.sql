-- sử dụng cơ sở dữ liệu AdventureWorks
USE AdventureWorks2019
GO

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15

-- khai báo biến
GO
DECLARE @deptID INT -- khai báo biến cục bộ tên là deptID kiểu int
SELECT @deptID=12 -- gán giá trị cho biến bằng 12
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
                    WHERE DepartmentID >= @deptID
GO

USE Northwnd
GO

SELECT * FROM Categories
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE -- hiển thị thông tin của biến toàn cục @@LANGUAGE, trả lại thông tin ngôn ngữ sử dụng trong sql server
SELECT @@VERSION -- hiển thị thông tin của biến toàn cục @@VERSION, trả lại thông tin về phiên bản sql server

GO

-- lấy tổng tất cả giá trị các bản ghi trường StandardCost thuộc bảng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory 
SELECT AVG(StandardCost) FROM Production.ProductCostHistory -- tính giá trị trung bình
SELECT MAX(StandardCost) FROM Production.ProductCostHistory -- lấy ra giá trị lớn nhất

SELECT COUNT(*) AS TotalRecords FROM Production.ProductPhoto -- đếm tổng số bản ghi trong bảng ProductPhoto
SELECT GETDATE() -- lấy ra ngày giờ hệ thống
SELECT DATEPART(hh,GETDATE()) -- lấy ra giờ hệ thống
SELECT CONVERT(varChar(50), GETDATE(), 103) -- định dạng ngày dùng hàm CONVERT
SELECT DB_ID('AdventureWorks') --lấy ra định danh của cơ sở dữ liệu

-- tạo cơ sở dữ liệu
CREATE DATABASE EXAMPLE3

USE EXAMPLE3

-- TẠO bảng trong cơ sở dữ liệu
CREATE TABLE Contacts
(MailID VARCHAR(20),
Name NTEXT,
TelephoneNumber INT)

-- thêm 1 cột vào bảng đã có 
ALTER TABLE Contacts ADD Address NVARCHAR(50)

-- thêm dữ liệu vào bảng contact
INSERT INTO Contacts values ('xeko@gmail.com' , N'Nguyen Van A' ,9898998,N'Ha Noi')
INSERT INTO Contacts values ('lynk@gmail.com' , N'Nguyen Thi B' ,4329234,N'Ha Noi')
INSERT INTO Contacts values ('tranvanC@gmail.com' , N'Tran Van C' ,905243524,N'Ha Noi')
INSERT INTO Contacts values ('vand@gmail.com' , N'Trinh Van D' ,4563576,N'Ha Noi')

-- lấy tca bản ghi trong bảng
SELECT * FROM Contacts

-- xóa bản ghi
DELETE FROM Contacts WHERE MailID='tranvanC@yahoo.com'

-- sửa bản ghi
UPDATE Contacts SET Name=N'Nguyen Viet Anh' WHERE MailID='vand@gmail.com'

CREATE LOGIN example3 WITH PASSWORD='acBx12@m' -- tạo login acc để test grant
CREATE USER example3 FROM LOGIN example3 -- tạo user từ login acc vừa tạo

--hủy bỏ tca các quyền của user example3 trên bảng Contacts
REVOKE ALL ON Contacts FROM example3 

-- gán quyền select cho example3 trên bảng contacts
GRANT SELECT ON Contacts TO example3