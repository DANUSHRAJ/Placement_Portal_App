
 /*
     'LAND LINE NUMBER',
     'PRIMARY MOBILE NO',
     'EMERGENCY CONTACT NO',
     'PRIMARY EMAIL ID',
     'ALTERNATE EMAIL ID',
     'PAN CARD NUMBER',
     'NATIONALITY',
     'INDIAN PASSPORT NUMBER',
     'AADHAAR NUMBER',
     'FATHER NAME',
     'DESIGNATION & ORGANISATION',
     'FATHER MOBILE NUMBER',
     'FATHER EMAIL ID',
     'MOTHER NAME',
     'DESIGNATION & ORGANISATION',
     'MOTHER MOBILE NUMBER',
     'MOTHER EMAIL ID',
     'PERMANENT ADDRESS WITH PIN CODE',
     'PERMANENT ADDRESS LINE 1',
     'PERMANENT ADDRESS LINE 2',
     'PERMANENT CITY',
     'STATE',
     'POSTAL CODE',
     */


 class PersonalDJSON {

   final String id;
   final String uregno;
   final String land;
   final String pmno;
   final String emno;
   final String pmail;
   final String amail;
   final String pan;
   final String natio;
   final String pass;
   final String adhr;
   final String fname;
   final String focp;
   final String fmno;
   final String fmail;
   final String mname;
   final String mocp;
   final String mmno;
   final String mmail;
   final String paddr;
   final String paddr1;
   final String paddr2;
   final String pcity;
   final String state;
   final String pco;

   const PersonalDJSON._(this.id, this.uregno, this.land, this.pmno, this.emno,
       this.pmail, this.amail, this.pan,
       this.natio, this.pass, this.adhr, this.fname, this.focp, this.fmno,
       this.fmail, this.mname, this.mocp, this.mmno, this.mmail,
       this.paddr, this.paddr1, this.paddr2, this.pcity, this.state, this.pco);

   factory PersonalDJSON.fromJson(Map json) {
     final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
     final regno = json['regno'];
     final var1 = json['LAND LINE NUMBER'];
     final var2 = json['PRIMARY MOBILE NO'];
     final var3 = json['EMERGENCY CONTACT NO'];
     final var4 = json['PRIMARY EMAIL ID'];
     final var5 = json['ALTERNATE EMAIL ID'];
     final var6 = json['PAN CARD NUMBER'];
     final var7 = json['NATIONALITY'];
     final var8 = json['INDIAN PASSPORT NUMBER'];
     final var9 = json['AADHAAR NUMBER'];
     final var10 = json['FATHER NAME'];
     final var11 = json['DESIGNATION & ORGANISATION'];
     final var12 = json['FATHER MOBILE NUMBER'];
     final var13 = json['FATHER EMAIL ID'];
     final var14 = json['MOTHER NAME'];
     final var15 = json['DESIGNATION & ORGANISATION'];
     final var16 = json['MOTHER MOBILE NUMBER'];
     final var17 = json['MOTHER EMAIL ID'];
     final var18 = json['PERMANENT ADDRESS WITH PIN CODE'];
     final var19 = json['PERMANENT ADDRESS LINE 1'];
     final var20 = json['PERMANENT ADDRESS LINE 2'];
     final var21 = json['PERMANENT CITY'];
     final var22 = json['STATE'];
     final var23 = json['POSTAL CODE'];
     return PersonalDJSON._(
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
         var14
         ,
         var15,
         var16,
         var17,
         var18,
         var19,
         var20,
         var21,
         var22,
         var23);
   }
 }