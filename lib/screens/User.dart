
class User {
  final String name;
  final String email;
  final String activity;
  final UserType userType;
  final String contact;
  final String businessContact;
  final String businessName;
  final String businessDescription;

  User({
    required this.name,
    required this.email,
    required this.activity,
    required this.userType,
    required this.contact,
    required this.businessContact,
    required this.businessName,
    required this.businessDescription,
  });
}
enum UserType { buyer, seller }