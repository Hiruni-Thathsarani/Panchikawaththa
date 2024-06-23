import 'package:flutter/material.dart';
import 'package:my_app/screens/buy_screen.dart';
import 'package:my_app/screens/filter_sort.dart';
import 'package:my_app/admin_page.dart';

// ignore: camel_case_types
class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

// ignore: camel_case_types
class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminPage()),
            );
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
        ),
        elevation: 0,
        actions: const [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffFF5C01)),
                  ),
                  Text(
                    'Anne_fernando82',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xffFF5C01),
                      size: 30,
                    ),
                    filled: true,
                    fillColor: const Color(0xffFAFAFA),
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    hintText: "Search",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffFAFAFA))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Color(0xffFAFAFA)))),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xffFF5C01),
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFF5C01)),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterSortScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Filter & sort',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFF5C01),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.grid_view_outlined,
                          color: Color(0xffFF5C01),
                          size: 23,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BuyScreen()));
                        },
                        child: Container(
                          width: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffEBEBEB)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/engine_image.jpg',
                                  height: 73, width: 81),
                              const Text(
                                'Toyota CHR',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const Text(
                                'Rs. 850,000.00',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const Text(
                                '2014',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const Text(
                                'Hybrid',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
