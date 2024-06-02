import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

final List<int> _items = List<int>.generate(100, (int index) => index);

class Orders extends StatelessWidget {
  const Orders({super.key});

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
        title: const Text('Orders'),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: GridView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Center();
          }
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _items[index].isOdd ? oddItemColor : evenItemColor,
            ),
            child: Text('Item $index'),
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
  runApp(const Orders());
}
