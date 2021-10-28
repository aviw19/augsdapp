class User {
  final String email;

  final String name;

  bool isActive;

  bool isStaff;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        isActive = json['is_active'],
        isStaff = json['is_staff'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'is_active': isActive,
        'is_staff': isStaff
      };
}
