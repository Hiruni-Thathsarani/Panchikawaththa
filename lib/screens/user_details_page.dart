import 'package:flutter/material.dart';
import 'package:my_app/screens/User.dart';
import 'package:my_app/screens/manage_accounts.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;

  const UserDetailsPage({Key? key,  required this.user}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController contactController;
  late TextEditingController businessNameController;
  late TextEditingController businessContactController;
  late TextEditingController businessDescriptionController;

  bool isEditable = false;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    contactController = TextEditingController(text: widget.user.contact);
    businessNameController =
        TextEditingController(text: widget.user.businessName);
    businessContactController =
        TextEditingController(text: widget.user.businessContact);
    businessDescriptionController =
        TextEditingController(text: widget.user.businessDescription);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    businessNameController.dispose();
    businessContactController.dispose();
    businessDescriptionController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      isEditable = !isEditable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details - ${widget.user.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage(''), // Replace with actual image path
                radius: 50,
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                readOnly: !isEditable,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                readOnly: !isEditable,
              ),
              TextField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                readOnly: !isEditable,
              ),
              SizedBox(height: 20),
              Text('Seller Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: businessNameController,
                decoration: InputDecoration(labelText: 'Business Name'),
                readOnly: !isEditable,
              ),
              TextField(
                controller: businessContactController,
                decoration: InputDecoration(labelText: 'Business Contact No'),
                readOnly: !isEditable,
              ),
              TextField(
                controller: businessDescriptionController,
                decoration: InputDecoration(labelText: 'Business Description'),
                readOnly: !isEditable,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: toggleEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5C00),
                      foregroundColor: Color(0xFFFFFFFF),
                    ),
                    child: Text(isEditable ? 'Cancel' : 'Edit'),
                  ),
                  ElevatedButton(
                    onPressed: isEditable
                        ? () {
                            // Update user data
                            final updatedUser = User(
                              name: nameController.text,
                              email: emailController.text,
                              contact: contactController.text,
                              businessName: businessNameController.text,
                              businessContact: businessContactController.text,
                              businessDescription:
                                  businessDescriptionController.text,
                              activity: widget.user.activity,
                              userType: widget.user.userType,
                            );
                            // You can perform update operation here (e.g., update database)
                            // For now, just print updated user data
                            print(updatedUser);
                            toggleEdit();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5C00),
                      foregroundColor: Color(0xFFFFFFFF),
                    ),
                    child: Text('Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
