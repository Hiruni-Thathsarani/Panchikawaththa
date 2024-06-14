import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

class Seller {
  final String username;
  final String contactDetails;
  final String profilePictureUrl;
  final String summary;

  Seller({
    required this.username,
    required this.contactDetails,
    required this.profilePictureUrl,
    required this.summary,
  });
}

final List<Seller> _sellers = List<Seller>.generate(100, (int index) {
  return Seller(
    username: 'User $index',
    contactDetails: 'user$index@example.com\n+1234567890',
    profilePictureUrl:
        'https://via.placeholder.com/150', // Placeholder image URL
    summary: 'This is a summary for User $index.',
  );
});

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 223, 186, 90),
        useMaterial3: true,
      ),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.5);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return AdminPage();
            }));
          },
        ),
        title: const Text('Sellers'),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor:
            shadowColor ? Theme.of(context).colorScheme.shadow : oddItemColor,
      ),
      body: GridView.builder(
        itemCount: _sellers.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final seller = _sellers[index];
          return Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: index.isOdd ? oddItemColor : evenItemColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(seller.profilePictureUrl),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        seller.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(seller.contactDetails),
                      Text(seller.summary),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: const <Widget>[
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const AppBarApp());
}
