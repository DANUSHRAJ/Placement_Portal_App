class ProfileData {
  String key;
  String value;

  ProfileData(this.key, this.value);

  ProfileData._(this.key, this.value);

  factory ProfileData.fromJson(Map json) {
    final keyf = json['key'];
    final valf = json['value'];
    return ProfileData._(keyf, valf);
  }
}