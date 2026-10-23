import 'package:flutter/material.dart';
import 'about_us.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Navigation Bar
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Row(
                children: [
                  // Logo
                  SizedBox(
                    width: 160,
                    child: Image.asset(
                      'images/OleafLogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Navigation buttons
                  Expanded(
                    child: Wrap(
                      spacing: 30,
                      alignment: WrapAlignment.end,
                      children: [
                        _navButton("Home", context, const LandingPage()),
                        _navButton("About Us", context, const AboutUs()),
                        _navButton("Our Partner", context, null),
                        _navButton("Products", context, null),
                        _navButton("Contact Us", context, null),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Hero Image
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.9,
              child: Image.asset('images/unnamed.png', fit: BoxFit.cover),
            ),

            // Welcome Section
            Container(
              width: double.infinity,
              color: Colors.green.shade50,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome to OleafTex",
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Where quality meets innovation in garment manufacturing. "
                    "Discover our commitment to excellence, ethical practices, "
                    "and cutting-edge designs that set industry standards. "
                    "Explore now and experience the difference.",
                    style: TextStyle(fontSize: 20, height: 1.6, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Production Capacity
            Container(
              width: double.infinity,
              color: Colors.blueGrey.shade50,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Production Capacity",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Oleaf Tex Sourcing is currently running with 16 lines. "
                          "By September 2025, we will expand to 24 lines.\n\n"
                          "• Monthly productivity: 700,000 pcs\n"
                          "• Target (Sept 2025): 1,000,000 pcs",
                          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Product Categories",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "• Denim Pant\n"
                          "• Denim/Twill Jacket\n"
                          "• Sherpa Jacket\n"
                          "• Fleece Jacket\n"
                          "• Chino Pant\n"
                          "• Dress Pant\n"
                          "• Basic Trousers\n"
                          "• Cargo Pant\n"
                          "• Work Wear\n"
                          "• Swimming Shorts",
                          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Contact Section
            Container(
              width: double.infinity,
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Contact Us",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Plot-49/1, Block-A, Ward-20, Post- Salna Bazar (1703), "
                    "Gazipur City Corporation, Gazipur, Dhaka\n"
                    "(+880) 1714398327\n"
                    "info@OleafTex.net",
                    style: TextStyle(fontSize: 18, height: 1.6, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String text, BuildContext context, Widget? page) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: page == null
            ? null
            : () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => page,
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const beginOffset = Offset(1.0, 0.0);
                      const endOffset = Offset.zero;
                      const curve = Curves.easeInOut;

                      final tween = Tween(begin: beginOffset, end: endOffset)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
        style: TextButton.styleFrom(foregroundColor: Colors.black87),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
