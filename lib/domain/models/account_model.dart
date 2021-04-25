class AccountModel {
  final String token;

  AccountModel(this.token);

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      AccountModel(json['token']);
}
