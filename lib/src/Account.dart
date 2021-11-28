class Account {
  final String id;
  final String name;
  final String regno;
  final String username;
  final String password;

  const Account._(this.id, this.name, this.regno, this.username, this.password);

  factory Account.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final name = json['name'];
    final regno = json['regno'];
    final username = json['username'];
    final password = json['password'];
    return Account._(id, name, regno, username, password);
  }
}
