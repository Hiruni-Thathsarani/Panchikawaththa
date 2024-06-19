import 'package:flutter/material.dart';
import 'package:my_app/screens/User.dart'; // Ensure the User class is imported correctly
import 'package:my_app/screens/user_details_page.dart'; // Import the UserDetailsPage file

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

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
      User(
          name: 'User 1',
          email: 'user1@example.com',
          activity: 'Active',
          userType: UserType.buyer,
          contact: '',
          businessContact: '',
          businessName: '',
          businessDescription: ''),
      User(
          name: 'User 2',
          email: 'user2@example.com',
          activity: 'Active',
          userType: UserType.buyer,
          contact: '',
          businessContact: '',
          businessName: '',
          businessDescription: ''),
      User(
          name: 'User 3',
          email: 'user3@example.com',
          activity: 'Active',
          userType: UserType.buyer,
          contact: '',
          businessContact: '',
          businessName: '',
          businessDescription: ''),
      // Add more users here
    ];
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        // If query is empty, show all users
        fetchUsers(); // Reset to original user list
      } else {
        // Filter users based on query
        users = users
            .where(
                (user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void deleteUser(User user) {
    setState(() {
      users.remove(user);
    });
  }

  void showDeleteConfirmationDialog(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete this user account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                deleteUser(user);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes, Delete'),
            ),
          ],
        );
      },
    );
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
                    backgroundImage: AssetImage(
                        'assets/profile_${index + 1}.jpg'), // Replace with actual image path
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(user.activity),
                      IconButton(
                        icon: Icon(Icons.delete, color: Color(0xFFFF5C00)),
                        onPressed: () {
                          showDeleteConfirmationDialog(user);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return UserDetailsPage(user: user);
                    }));
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
