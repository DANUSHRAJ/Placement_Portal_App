class IWCDetails {
  final String id;
  final String regno;
  final String username;
  final String batch;
  final String title;
  final String name;
  final String sd;
  final String ed;
  final String clink;
  final String plink;
  final String flink;

  const IWCDetails._(this.id, this.regno, this.username, this.batch, this.title, this.name, this.sd, this.ed, this.clink, this.plink, this.flink);

  factory IWCDetails.fromJson(Map json) {
    final _id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final _regno = json['regno'];
    final _username = json['username'];
    final _batch = json['batch'];
    final _title = json['title'];
    final _name = json['name'];
    final _sd = json['sd'];
    final _ed = json['ed'];
    final _clink = json['clink'];
    final _plink = json['plink'];
    final _flink = json['flinl'];
    return IWCDetails._(_id, _regno, _username, _batch, _title,_name,_sd,_ed,_clink,_plink,_flink);
  }
}
