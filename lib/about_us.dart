import 'package:flutter/material.dart';
import 'landing_page.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: Image.asset('images/OleafLogo.png', fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 20),
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

            // Hero Section
            Container(
              width: double.infinity,
              color: Colors.green.shade50,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 900 ? 120 : 40,
                vertical: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "About Us",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Oleaf Tex Sourcing, incorporated in Bangladesh in September 2025, "
                    "is a forward-thinking apparel sourcing and manufacturing company. "
                    "We combine innovation, ethical practices, and sustainability to deliver "
                    "high-quality garments that meet global standards.\n\n"

                    "With an experienced leadership team and a dedicated workforce, we ensure "
                    "compliance with all labor laws and international regulations. We strictly "
                    "prohibit child labor, guarantee safe and hygienic working conditions, and "
                    "provide fair wages on time.\n\n"

                    "Sustainability is at the core of our operations — from energy-efficient "
                    "technologies to water conservation and waste recycling, we are committed "
                    "to minimizing our environmental footprint.\n\n"

                    "At Oleaf Tex Sourcing, we believe in partnerships built on trust, "
                    "transparency, and excellence — where quality meets innovation.",
                    style: TextStyle(fontSize: 20, height: 1.8, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Contact Section
            Container(
              width: double.infinity,
              color: Colors.black87,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 900 ? 120 : 40,
                vertical: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Contact Us",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Plot-49/1, Block-A, Ward-20, Post- Salna Bazar (1703),\n"
                    "Gazipur City Corporation, Gazipur, Dhaka\n\n"
                    "(+880) 1714398327\n"
                    "info@OleafTex.net",
                    style: TextStyle(fontSize: 18, height: 1.8, color: Colors.white70),
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
