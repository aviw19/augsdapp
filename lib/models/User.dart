class User {
  final String email;
  String userId, name, userAuthToken;
  bool isActive, isStaff;

  User(this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        isActive = json['is_active'] == 'true' ? true : false,
        isStaff = json['is_staff'] == 'true' ? true : false,
        userId = json['user_id'],
        userAuthToken = json['token'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'is_active': isActive,
        'is_staff': isStaff,
        'user_id': userId,
      };
}
