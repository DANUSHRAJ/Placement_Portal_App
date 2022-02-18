class Account {
  final String id;
  final String name;
  final String regno;
  final String username;
  final String password;
  final String batch;
  final String tokenId;

  const Account._(this.id, this.name, this.regno, this.username, this.password, this.batch, this.tokenId);

  factory Account.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final name = json['name'];
    final regno = json['regno'];
    final username = json['username'];
    final password = json['password'];
    final batch = json['batch'];
    final tokenId = json['tokenId'];
    return Account._(id, name, regno, username, password, batch, tokenId);
  }
}
