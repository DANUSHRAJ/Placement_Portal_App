/*
'UNIVERSITY REG NO',
'ROLL NO',
'NAME OF THE CANDIDATE',
'FIRST NAME',
'LAST NAME',
'DATE OF BIRTH (DD/MM/YY)',
'DATE OF BIRTH (MM/DD/YY)',
'DATE OF BIRTH (YYYY-MM-DD)',
'YEAR OF ADMISSION'
    'TITILE',
    'GENDER',
    'COLLEGE',
    'DEPARTMENT',
    'SECTION',
    'HOSTEL/DAYSCHOLOAR'
*/
class GenealDJSON {
  final String id;
  final String uregno;
  final String rollno;
  final String name;
  final String fname;
  final String lname;
  final String dob1;
  final String dob2;
  final String dob3;
  final String yoa;
  final String batch;
  final String title;
  final String gender;
  final String college;
  final String dept;
  final String sec;
  final String hd;

  const GenealDJSON._(this.id, this.uregno, this.rollno, this.name, this.fname, this.lname, this.dob1, this.dob2, this.dob3, this.yoa, this.batch, this.title, this.gender, this.college, this.dept, this.sec, this.hd,
      );

  factory GenealDJSON.fromJson(Map json) {
    final String id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final String regno = json['regno'];
    final String rollno = json['ROLL NO'];
    final String name = json['NAME OF THE CANDIDATE'];
    final String fname = json['FIRST NAME'];
    final String lname = json['LAST NAME'];
    final String dob1 = json['DATE OF BIRTH (DD/MM/YY)'];
    final String dob2 = json['DATE OF BIRTH (MM/DD/YY)'];
    final String dob3 = json['DATE OF BIRTH (YYYY-MM-DD)'];
    final String yoa = json['YEAR OF ADMISSION'];
    final String batch = json['BATCH'];
    final String title = json['TITLE'];
    final String gender = json['GENDER'];
    final String college = json['COLLEGE'];
    final String dept = json['DEPARTMENT'];
    final String sec = json['SECTION'];
    final String hd = json['HD'];
    return GenealDJSON._(id, regno, rollno, name, fname, lname, dob1, dob2, dob3, yoa, batch, title, gender, college, dept, sec, hd);
  }
}
