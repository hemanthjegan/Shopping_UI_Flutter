import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.directions_bike,
    Icons.map,
    Icons.shopping_cart,
    Icons.person,
    Icons.sticky_note_2_sharp,
  ];

  final List<bool> _heartSelected = [false, false, false, false, false];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onHeartTapped(int index) {
    setState(() {
      _heartSelected[index] = !_heartSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 10.0),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: const Text(
                            'Choose Your Bike',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF60efff), Color(0xFF0061ff)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(Icons.search, color: Colors.white),
                                iconSize: 24.0,
                                onPressed: () {
                                  // Search button action
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ClipPath(
                  clipper: SlantedBottomClipper(radius: 20.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          padding: const EdgeInsets.only(top: 8.0, left: 32.0, right: 32.0, bottom: 32.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 16.0),
                                width: double.infinity,
                                height: 200.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '30% OFF',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSteppedButton("All", Colors.white, 0),
                    _buildSteppedButton("Battery", Colors.white, 1),
                    _buildSteppedButton("Road", Colors.white, 2),
                    _buildSteppedButton("Mountain", Colors.white, 3),
                    _buildSteppedButton("Helmet", Colors.white, 4),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, rowIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ClipPath(
                              clipper: TileParallelogramClipper(radius: 20.0),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: () => _onHeartTapped(rowIndex),
                                              icon: _heartSelected[rowIndex]
                                                  ? ShaderMask(
                                                shaderCallback: (bounds) => LinearGradient(
                                                  colors: [
                                                    Color(0xFF60efff),
                                                    Color(0xFF0061ff),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ).createShader(bounds),
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                              )
                                                  : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Center(
                                            child: Image.asset(
                                              'assets/img1.png',
                                              height: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            'Road Bike',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'PEUGEOT ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '\$1,999.99',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 20.0),

                          // Second Tile in the row
                          Expanded(
                            child: ClipPath(
                              clipper: TileParallelogramClipper(radius: 20.0),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: () => _onHeartTapped(rowIndex),
                                              icon: _heartSelected[rowIndex]
                                                  ? ShaderMask(
                                                shaderCallback: (bounds) => LinearGradient(
                                                  colors: [
                                                    Color(0xFF60efff),
                                                    Color(0xFF0061ff),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ).createShader(bounds),
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                              )
                                                  : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Center(
                                            child: Image.asset(
                                              'assets/img1.png',
                                              height: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            'Road Bike',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'PEUGEOT - LR01',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '\$1,999.99',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 100.0, // Prevent overflow
                  color: const Color(0xFF2c335d).withOpacity(0.6),
                  child: BottomNavigationBar(
                    items: _icons.map((icon) {
                      int index = _icons.indexOf(icon);
                      return BottomNavigationBarItem(
                        icon: ClipPath(
                          clipper: RoundedParallelogramClipper(radius: 12.0),
                          child: Container(
                            width: 55.0,
                            height: 55.0,
                            padding: EdgeInsets.all(_selectedIndex == index ? 0 : 8.0),
                            decoration: _selectedIndex == index
                                ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF60efff), Color(0xFF0061ff)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            )
                                : null,
                            child: Icon(
                              icon,
                              color: _selectedIndex == index
                                  ? Colors.white
                                  : const Color(0xFF9EA3BA),
                            ),
                          ),
                        ),
                        label: '',
                      );
                    }).toList(),
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

Widget _buildSteppedButton(String label, Color iconColor, int index) {
  return GestureDetector(
    onTap: () {
    },
    child: Transform.translate(
      offset: Offset(0, -index * 8.0),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: index == 0
              ? Text(
            label,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
            ),
          )
              : Icon(
            _getIconForIndex(index),
            color: iconColor,
          ),
        ),
      ),
    ),
  );
}

IconData _getIconForIndex(int index) {
  switch (index) {
    case 1:
      return Icons.battery_charging_full;
    case 2:
      return Icons.notifications;
    case 3:
      return Icons.contacts;
    case 4:
      return Icons.phone;
    default:
      return Icons.home;
  }
}
// Widget _buildParallelogramBox(String text) {
//   return Expanded(
//     child: ClipPath(
//       clipper: RoundedParallelogramClipper(radius: 12.0),
//       child: Container(
//         height: 150.0,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF60efff), Color(0xFF0061ff)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16.0,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

class TileParallelogramClipper extends CustomClipper<Path> {
  final double radius;

  TileParallelogramClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.moveTo(0, height * 0.2);
    path.quadraticBezierTo(0, height * 0.2, 12, height * 0.2);

    path.lineTo(width - 12, 0);
    path.quadraticBezierTo(width, 0, width, 12);

    path.lineTo(width, height * 0.9 - 12);
    path.quadraticBezierTo(width, height * 0.9, width - 12, height * 0.9);

    path.lineTo(12, height);
    path.quadraticBezierTo(0, height, 0, height - 12);


    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Clipper for Slanted Bottom
class SlantedBottomClipper extends CustomClipper<Path> {
  final double radius;

  SlantedBottomClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(width, 0, width, radius);

    path.lineTo(width, height * 0.8 - radius);
    path.quadraticBezierTo(width, height * 0.8, width - radius, height * 0.8);

    path.lineTo(radius, height);
    path.quadraticBezierTo(0, height, 0, height - radius);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RoundedParallelogramClipper extends CustomClipper<Path> {
  final double radius;

  RoundedParallelogramClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.moveTo(0, height * 0.2 + radius);
    path.quadraticBezierTo(0, height * 0.2, radius, height * 0.2);

    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(width, 0, width, radius);

    path.lineTo(width, height * 0.8 - radius);
    path.quadraticBezierTo(width, height * 0.8, width - radius, height * 0.8);

    path.lineTo(radius, height);
    path.quadraticBezierTo(0, height, 0, height - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


