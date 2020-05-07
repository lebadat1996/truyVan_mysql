use Practical;
update Subjects
set Status = 0
-- Cập nhật trạng thái của lớp học (bảng subject) là 0 nếu môn học đó chưa có sinh viên dự thi.
where SubID not in (select  SubID from Mark);
select * from Subjects;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’.
select * from student
where StudentName like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where  month(StartDate) >= '12' ;
-- Hiển thị giá trị lớn nhất của credit trong bảng subject.
select max(credit) from Subjects;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from Subjects
where credit = (select max(credit) from Subjects);
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subjects
where credit > 3 and credit < 5;
-- Hiển thị các thông tin bao gồm: classid, className, studentname, Address từ hai bảng Class, student
select class.classid,className,StudentName,Address from class
 join student on class.classID =student.classID; 
-- Hiển thị các thông tin môn học chưa có sinh viên dự thi.
select * from Subjects
where SubID not in (select SubID from Mark);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from Subjects
join Mark on Subjects.SubID = Mark.SubID
where mark = (select max(Mark) from Mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình tương ứng.
select student.StudentID , student.StudentName,student.Address,student.Phone,student.Status,student.ClassID
,Mark.Mark from student
inner join Mark on student.StudentID = Mark.studentID;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần (gợi ý: sử dụng hàm rank)
select student.StudentID , student.StudentName,student.Address,student.Phone,student.Status,student.ClassID
,Mark.Mark from student
inner join Mark on student.StudentID = Mark.studentID
order by  Mark asc;
-- Hiển thị các thông tin sinh viên và điểm trung bình,
-- chỉ đưa ra các sinh viên có điểm trung bình lớn hơn 10.
select student.StudentID , student.StudentName,student.Address,student.Phone,student.Status,student.ClassID
,Mark.Mark from student
inner join Mark on student.StudentID = Mark.studentID
where Mark > 10;
-- Hiển thị các thông tin: StudentName, SubName, Mark.
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName,sub.SubName,m.Mark from student as s 
join Mark as m on s.studentID = m.StudentID
join Subjects as sub on m.SubID=sub.SubID
order by Mark desc; 
-- Xóa tất cả các lớp có trạng thái là 0.
delete  from class
where status = 0 ; 
select * from class;
-- Xóa tất cả các môn học chưa có sinh viên dự thi.
delete from Subjects
where SubID not in (select SubID  from Mark);
select * from Subjects
where SubID  not in (select SubID from Mark);
-- Xóa bỏ cột ExamTimes trên bảng Mark.
alter table class
change Status Class_Status bit;
-- Đổi tên bảng Mark thành SubjectTest.
Rename table Mark to SubjectTest;
-- 