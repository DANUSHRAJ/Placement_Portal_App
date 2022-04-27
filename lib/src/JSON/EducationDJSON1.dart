/*
    '10TH PERCENTAGE',
    '10TH BOARD OF STUDY',
    '10TH MEDIUM OF STUDY',
    '10TH YEAR OF PASSING',
    '10TH NAME OF SCHOOL',
    '10TH GRADUATING STATE',
    '12TH PERCENTAGE',
    '12TH BOARD OF STUDY',
    '12TH MEDIUM OF STUDY',
    '12TH YEAR OF PASSING',
    '12TH NAME OF SCHOOL',
    '12TH GRADUATING STATE',
    'DIPLOMA - SPECIALIZATION/BRANCH',
    'DIPLOMA PERCENTAGE',
    'DIPLOMA YEAR OF PASSING',
    'NAME OF THE INSTITUTE',
    'DIPLOMA GRADUATING STATE',
    'UG DEGREE (FOR PG STUDENTS)',
    'UG BRANCH (FOR PG STUDENTS)',
    'UG PERCENTAGE (FOR PG STUDENTS)',
    'UG CGPA (FOR PG STUDENTS)',
    'UG YEAR OF PASSING (FOR PG STUDENTS)',
    'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)',
    'UG - GRADUATING UNIVERSITY',
    'UG - GRADUATING STATE'
*/
class EducationDJSON {
  final String id;
  final String uregno;
  final String tp; //Tenth Percentage
  final String tbs; //Tenth Board of Study
  final String tms; //Tenth Medium of Study
  final String tyop; //Tenth Year of Passing
  final String tsn; //Tenth School Name
  final String tgs; //Tenth graduating State
  final String twp;
  final String twbs;
  final String twms;
  final String twyop;
  final String twsn;
  final String twgs;
  final String dspec;
  final String dp;
  final String dyop;
  final String dsn;
  final String dgs;
  final String ugdeg;
  final String ugbranch;
  final String ugp;
  final String ugcgpa;
  final String ugyop;
  final String ugclg;
  final String ugguniv;
  final String ugs;

  const EducationDJSON._(
      this.id,
      this.uregno,
      this.tp,
      this.tbs,
      this.tms,
      this.tyop,
      this.tsn,
      this.tgs,
      this.twp,
      this.twbs,
      this.twms,
      this.twyop,
      this.twsn,
      this.twgs,
      this.dspec,
      this.dp,
      this.dyop,
      this.dsn,
      this.dgs,
      this.ugdeg,
      this.ugbranch,
      this.ugp,
      this.ugcgpa,
      this.ugyop,
      this.ugclg,
      this.ugguniv,
      this.ugs);

  factory EducationDJSON.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final regno = json['regno'];
    final var1 = json['10TH PERCENTAGE'];
    final var2 = json['10TH BOARD OF STUDY'];
    final var3 = json['10TH MEDIUM OF STUDY'];
    final var4 = json['10TH YEAR OF PASSING'];
    final var5 = json['10TH NAME OF SCHOOL'];
    final var6 = json['10TH GRADUATING STATE'];
    final var7 = json['12TH PERCENTAGE'];
    final var8 = json['12TH BOARD OF STUDY'];
    final var9 = json['12TH MEDIUM OF STUDY'];
    final var10 = json['12TH YEAR OF PASSING'];
    final var11 = json['12TH NAME OF SCHOOL'];
    final var12 = json['12TH GRADUATING STATE'];
    final var13 = json['DIPLOMA - SPECIALIZATION/BRANCH'];
    final var14 = json['DIPLOMA PERCENTAGE'];
    final var15 = json['DIPLOMA YEAR OF PASSING'];
    final var16 = json['NAME OF THE INSTITUTE'];
    final var17 = json['DIPLOMA GRADUATING STATE'];
    final var18 = json['UG DEGREE (FOR PG STUDENTS)'];
    final var19 = json['UG BRANCH (FOR PG STUDENTS)'];
    final var20 = json['UG PERCENTAGE (FOR PG STUDENTS)'];
    final var21 = json['UG CGPA (FOR PG STUDENTS)'];
    final var22 = json['UG YEAR OF PASSING (FOR PG STUDENTS)'];
    final var23 = json['UG - COLLEGE OF STUDIES (FOR PG STUDENTS)'];
    final var24 = json['UG - GRADUATING UNIVERSITY'];
    final var25 = json['UG - GRADUATING STATE'];
    return EducationDJSON._(
        id,
        regno,
        var1,
        var2,
        var3,
        var4,
        var5,
        var6,
        var7,
        var8,
        var9,
        var10,
        var11,
        var12,
        var13,
        var14,
        var15,
        var16,
        var17,
        var18,
        var19,
        var20,
        var21,
        var22,
        var23,
        var24,
        var25);
  }
}
