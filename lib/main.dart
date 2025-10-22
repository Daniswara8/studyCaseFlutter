import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


// Entry Point and AppBar
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(top: 20),
            child: Image.asset('assets/images/logo.png', height: 50),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Profile(),
            ButtonMenu(),
            MainMenu(),
          ],
        )
      ),
    );
  }
}

// Profile
class Profile extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hallo Alexa!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins', 
                ),
              ),
              // SizedBox(height: 1),
              Text(
                "Mau masak apa hari ini?",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            radius: 20,
          ),
        ],
      ),
    );
  }
}


// Button Menu
class ButtonMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
              Image.asset(
                'assets/icons/bakso.png',
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
              Text('Bakso'),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/icons/ramen.png',
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
              Text('Ramen'),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/icons/pizza.png',
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
              Text('Pizza'),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/icons/taco.png',
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
              Text('Taco'),
            ],
          ),
        ],
      ),
    );
  }
}

// Main Menu
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recomended',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                FoodCard(
                  color: Color(0xFF2FA4A9),
                  image: 'assets/images/nasi-goreng.png',
                  title: 'Nasi Goreng Spesial\nKhas Malang',
                  rating: 5,
                  time: '5 Min',
                ),
                FoodCard(
                  color: Color(0xFFF6B100),
                  image: 'assets/images/nasi-goreng.png',
                  title: 'Nasi Goreng Seafood\nPedas Manis',
                  rating: 4,
                  time: '5 Min',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final int rating;
  final String time;

  const FoodCard({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.rating,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(top: 40, right: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            right: 10,
            child: Image.asset(image, width: 100),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    rating,
                    (index) =>
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.white, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.home, color: Colors.white, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

