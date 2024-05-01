import 'package:cafe_app/util/coffee_type.dart';
import 'package:cafe_app/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //coffee types
  final List coffeeType = [
    //['coffetype', isSelected]
    [
      'Espresso',
      true,
    ],
    [
      'Frappe',
      false,
    ],
    [
      'Iced Coffee',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Macchiato',
      false,
    ],
    [
      'Mocha',
      false,
    ],
  ];

  //user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.white70,
              size: 28,
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.person,
                  size: 28,
                ))
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title,
            style: GoogleFonts.pacifico(color: Colors.white, letterSpacing: 3),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ],
        ),
        body: Column(
          children: [
            //find the best coffee
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 55,
                  letterSpacing: 3,
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  label: Text(
                    ' Search for your favorite coffee',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1,
                    ),
                  ),
                  hintText: 'Cappucino, expresso, latte......',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //horizontal list view of coffee types
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                },
              ),
            ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/expresso.jpg',
                    coffeeName: 'Espresso',
                    coffeePrice: '\$3.99',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/frappe.jpg',
                    coffeeName: 'Frappe',
                    coffeePrice: '\$5.69',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/iced_coffee.jpg',
                    coffeeName: 'Iced Coffee',
                    coffeePrice: '\$5.49',
                  ),

                  CoffeeTile(
                    coffeeImagePath: 'assets/images/latte.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '\$4.79',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/macchiato.jpg',
                    coffeeName: 'Macchiato',
                    coffeePrice: '\$6.29',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/mocha.jpg',
                    coffeeName: 'Mocha',
                    coffeePrice: '\$5.99',
                  ),

                ],
              ),
            ),

            //horizontal listview of coffee titles
          ],
        ));
  }
}
