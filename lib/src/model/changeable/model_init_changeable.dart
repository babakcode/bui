class ModelInitChangeable {
  String? project;
  String? account;
  String? accessToken;
  String? encryptKey;

  bool disableUpdates = false;

  ModelInitChangeable.fromJson(Map<String, dynamic> json) {
    project = json['project'];
    account = json['account'];
    accessToken = json['accessToken'];
    encryptKey = json['encryptKey'];
    disableUpdates = json['disableUpdates'];
  }
}
