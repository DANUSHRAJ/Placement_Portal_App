// 'SEM1 GPA',
//     'SEM2 GPA',
//     'SEM3 GPA',
//     'SEM4 GPA',
//     'SEM5 GPA',
//     'SEM6 GPA',
//     'SEM7 GPA',
//     'SEM8 GPA',
//     'OVERALL CGPA',
//     'NO OF ARREARS SEM 1',
//     'NO OF ARREARS SEM 2',
//     'NO OF ARREARS SEM 3',
//     'NO OF ARREARS SEM 4',
//     'NO OF ARREARS SEM 5',
//     'NO OF ARREARS SEM 6',
//     'NO OF ARREARS SEM 7',
//     'NO OF ARREARS SEM 8',
//     'TOTAL NO OF STANDING ARREARS',
//     'HISTORY OF ARREARS [Y/N]',
//     'if yes how many',

class CurrentDJSON {
  final String id;
  final String uregno;
  final String gpa1;
  final String gpa2;
  final String gpa3;
  final String gpa4;
  final String gpa5;
  final String gpa6;
  final String gpa7;
  final String gpa8;
  final String ogpa;
  final String are1;
  final String are2;
  final String are3;
  final String are4;
  final String are5;
  final String are6;
  final String are7;
  final String are8;
  final String tare;
  final String areYN;
  final String areno;

  const CurrentDJSON._(
      this.id,
      this.uregno,
      this.gpa1,
      this.gpa2,
      this.gpa3,
      this.gpa4,
      this.gpa5,
      this.gpa6,
      this.gpa7,
      this.gpa8,
      this.ogpa,
      this.are1,
      this.are2,
      this.are3,
      this.are4,
      this.are5,
      this.are6,
      this.are7,
      this.are8,
      this.tare,
      this.areYN,
      this.areno);

  factory CurrentDJSON.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final regno = json['regno'];
    final var1 = json['SEM1 GPA'];
    final var2 = json['SEM2 GPA'];
    final var3 = json['SEM3 GPA'];
    final var4 = json['SEM4 GPA'];
    final var5 = json['SEM5 GPA'];
    final var6 = json['SEM6 GPA'];
    final var7 = json['SEM7 GPA'];
    final var8 = json['SEM8 GPA'];
    final var9 = json['OVERALL CGPA'];
    final var10 = json['NO OF ARREARS SEM 1'];
    final var11 = json['NO OF ARREARS SEM 2'];
    final var12 = json['NO OF ARREARS SEM 3'];
    final var13 = json['NO OF ARREARS SEM 4'];
    final var14 = json['NO OF ARREARS SEM 5'];
    final var15 = json['NO OF ARREARS SEM 6'];
    final var16 = json['NO OF ARREARS SEM 7'];
    final var17 = json['NO OF ARREARS SEM 8'];
    final var18 = json['TOTAL NO OF STANDING ARREARS'];
    final var19 = json['HISTORY OF ARREARS [Y/N]'];
    final var20 = json['IF YES, HOW MANY?'];
    return CurrentDJSON._(
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
        var20);
  }
}
