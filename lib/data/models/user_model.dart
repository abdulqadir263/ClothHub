class UserModel
{
  final String uid;
  final String email;
  final String fullName;
  final String gender;
  final int age;
  final String address;
  final String phoneNumber;

  UserModel({
    required this.uid,
    required this.email,
    this.fullName = '',
    this.gender = '',
    this.age = 0,
    this.address = '',
    this.phoneNumber = '',
  });

  factory UserModel.fromMap(Map<String, dynamic> map)
  {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age'] ?? 0,
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap()
  {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'gender': gender,
      'age': age,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
