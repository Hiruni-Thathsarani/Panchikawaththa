import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, String>> contacts = [
    {
      'name': 'Nicholas Gordon',
      'email': 'ernest.mason@gmail.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Seller',
      'phone': '123-456-7890',
      'province': 'Ontario',
    },
    {
      'name': 'Bradley Malone',
      'email': 'bradley.m@gmail.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Buyer',
      'phone': '234-567-8901',
      'province': 'Quebec',
    },
    {
      'name': 'Janie Todd',
      'email': 'stroman.hanna@yahoo.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Seller',
      'phone': '345-678-9012',
      'province': 'British Columbia',
    },
    {
      'name': 'Marvin Lambert',
      'email': 'micaela.okuneva@zemlak.biz',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Buyer',
      'phone': '456-789-0123',
      'province': 'Alberta',
    },
    {
      'name': 'Teresa Lloyd',
      'email': 'carlee_erdman@gmail.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Seller',
      'phone': '567-890-1234',
      'province': 'Manitoba',
    },
    {
      'name': 'Fred Haynes',
      'email': 'jarod.miller@hotmail.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Buyer',
      'phone': '678-901-2345',
      'province': 'Saskatchewan',
    },
    {
      'name': 'Rose Peters',
      'email': 'oma.russel@hotmail.com',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Seller',
      'phone': '789-012-3456',
      'province': 'Nova Scotia',
    },
    {
      'name': 'Jose Stone',
      'email': 'sylvia.stracke@konopelski.ca',
      'imageUrl': 'https://via.placeholder.com/48', // Placeholder image URL
      'status': 'Buyer',
      'phone': '890-123-4567',
      'province': 'New Brunswick',
    },
  ];

  late List<Map<String, String>> filteredContacts;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
    searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterContacts);
    searchController.dispose();
    super.dispose();
  }

  void _filterContacts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredContacts = contacts.where((contact) {
        final name = contact['name']?.toLowerCase();
        final email = contact['email']?.toLowerCase();
        return name!.contains(query) || email!.contains(query);
      }).toList();
    });
  }

  void _showUserDetails(BuildContext context, Map<String, String> contact) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(contact['imageUrl']!),
                      radius: 24,
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['email']!),
                  ),
                  SizedBox(height: 16),
                  Text('Status: ${contact['status']}'),
                  SizedBox(height: 8),
                  Text('Phone: ${contact['phone']}'),
                  SizedBox(height: 8),
                  Text('Province: ${contact['province']}'),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the admin page
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(contact['imageUrl']!),
                      radius: 24,
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['email']!),
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        _showUserDetails(context, contact);
                      },
                    ),
                    onTap: () {
                      // Navigate to user details or perform any action on tap
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UsersPage(),
  ));
}
