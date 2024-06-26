import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

class Sellers {
  final String username;
  final String userContact;
  final String contactDetails;
  final String profilePictureUrl;
  final int totalAds;

  Sellers({
    required this.username,
    required this.userContact,
    required this.contactDetails,
    required this.profilePictureUrl,
    required this.totalAds,
  });
}

class SellersPage extends StatefulWidget {
  const SellersPage({super.key});

  @override
  _SellersPageState createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  final List<Sellers> sellers = [
    Sellers(
      username: 'john_doe',
      userContact: '0774703170',
      contactDetails: 'john.doe@example.com',
      profilePictureUrl: 'https://via.placeholder.com/150',
      totalAds: 5,
    ),
    Sellers(
      username: 'jane_smith',
      userContact: '0713456717',
      contactDetails: 'jane.smith@example.com',
      profilePictureUrl: 'https://via.placeholder.com/150',
      totalAds: 8,
    ),
    // Add more sellers as needed
  ];

  @override
  Widget build(BuildContext context) {
    final Color oddItemColor =
        Color.fromARGB(255, 252, 208, 208).withOpacity(1);
    final Color evenItemColor =
        Color.fromARGB(255, 241, 241, 241).withOpacity(1);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const AdminPage();
            }));
          },
        ),
        title: const Text('Sellers'),
      ),
      body: GridView.builder(
        itemCount: sellers.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final seller = sellers[index];
          return Container(
            padding: const EdgeInsets.all(10),
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        seller.username,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(seller.contactDetails),
                      Text('Total posted Ads = ${seller.totalAds}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: <Widget>[
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
