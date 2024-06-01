import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'User Management Dashboard',
    home: ManageAccount(),
  ));
}

class ManageAccount extends StatefulWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  List<User> users = []; // List of users
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // Fetch users data
    fetchUsers();
    super.initState();
  }

  void fetchUsers() {
    // Dummy data for demonstration
    users = [
      User(name: 'User 1', email: 'user1@example.com', activity: 'Active', userType: UserType.buyer),
      User(name: 'User 2', email: 'user2@example.com', activity: 'Inactive', userType: UserType.seller),
      User(name: 'User 3', email: 'user2@example.com', activity: 'Active', userType: UserType.buyer),
      // Add more users here
    ];
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        // If query is empty, show all users
        users = [
          User(name: 'User 1', email: 'user1@example.com', activity: 'Active', userType: UserType.buyer),
          User(name: 'User 2', email: 'user2@example.com', activity: 'Inactive', userType: UserType.seller),
          User(name: 'User 3', email: 'user2@example.com', activity: 'Active', userType: UserType.buyer),
          // Add more users here
        ];
      } else {
        // Filter users based on query
        users = users.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterUsers,
              decoration: InputDecoration(
                labelText: 'Search Users',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_${index + 1}.jpg'), // Replace with actual image path
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.activity),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => UserDetailsPage(user: user)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 
 
class UserDetailsPage extends StatefulWidget {
  final User user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController emailController ;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details - ${widget.user.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(''), // Replace with actual image path
              radius: 50,
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Display user type
            Text('User Type: ${widget.user.userType == UserType.buyer ? "Buyer" : "Seller"}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update user data
                final updatedUser = User(
                  name: nameController.text,
                  email: emailController.text,
                  activity: widget.user.activity,
                  userType: widget.user.userType,
                );
                // You can perform update operation here (e.g., update database)
                // For now, just print updated user data
                print(updatedUser);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

enum UserType { buyer, seller }

class User {
  final String name;
  final String email;
  final String activity;
  final UserType userType;

  User({required this.name, required this.email, required this.activity, required this.userType});
}
