class ExtraDJSON {
  final String id;
  final String uregno;
  final String lang;
  final String gap;
  final String skill;
  final String sportQ;
  final String becS;
  final String becG;
  final String higherS;

  const ExtraDJSON._(this.id, this.uregno, this.lang, this.gap, this.skill,
      this.sportQ, this.becS, this.becG, this.higherS);

  factory ExtraDJSON.fromJson(Map json) {
    final String id =
        json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final String regno = json['regno'];
    final var1 = json['LANGUAGES KNOWN'];
    final var2 = json['GAP IN EDUCATION (in Years)'];
    final var3 = json['IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL'];
    final var4 = json['SPORTS QUOTA'];
    final var5 = json['BEC EXAM STATUS'];
    final var6 = json['BEC EXAM GRADE'];
    final var7 = json['ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]'];

    return ExtraDJSON._(id, regno, var1, var2, var3, var4, var5, var6, var7);
  }
}
