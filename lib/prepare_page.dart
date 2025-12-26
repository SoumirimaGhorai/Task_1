import 'package:flutter/material.dart';
import 'journey_page.dart';

class PreparePage extends StatefulWidget{
  const PreparePage({super.key});
  @override
  State<PreparePage> createState() => _PreparePageState();
}

class  _PreparePageState extends State<PreparePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    scaleAnim = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081F3F),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children:  [
                SizedBox(height: 40),
                Text(
                  "PREPARE!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "For the Quest!",
                  style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "Face tougher challenges,\n"
                        "earn rare rewards & rise as a\n"
                        "true language warrior.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                 Hero(
                   tag: "character",
                   child: Center(
                      child: Image(
                        image: AssetImage("assets/images/img_1.png",),
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                 ),
                SizedBox(height: 10),
                Text(
                  "MOKSH",
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: 100,
                color: Color(0xFF8BC34A),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () async{
                  await controller.forward();
                  Navigator.push(
                    context,
                    journeyRoute(JourneyPage()));
                      controller.reset();
                },
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  Color(0xFF081F3F),
                      width: 12,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 28,
                    color: Colors.black,
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
Route journeyRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 800),
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween(begin: 0.95, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 60);
    path.quadraticBezierTo(
      size.width / 2,
      -40,
      size.width,
      60,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}







