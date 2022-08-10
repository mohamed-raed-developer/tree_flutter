class LoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? identityCard;
  String? mobileNumber;
  String? email;
  String? password;
  Null? emailVerifiedAt;
  bool? addItem;
  bool? deleteItem;
  bool? addDeleteDetails;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.identityCard,
        this.mobileNumber,
        this.email,
        this.password,
        this.emailVerifiedAt,
        this.addItem,
        this.deleteItem,
        this.addDeleteDetails,
        this.rememberToken,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identityCard = json['identity_card'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    password = json['password'];
    emailVerifiedAt = json['email_verified_at'];
    addItem = json['add_item'];
    deleteItem = json['delete_item'];
    addDeleteDetails = json['add_delete_details'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['identity_card'] = this.identityCard;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['add_item'] = this.addItem;
    data['delete_item'] = this.deleteItem;
    data['add_delete_details'] = this.addDeleteDetails;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}