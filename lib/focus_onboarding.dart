import 'package:flutter/material.dart';
import 'package:task1/prepare_page.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class  _FocusPageState extends State<FocusPage>
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
      backgroundColor:Color(0xFF081F3F),
      body: Stack(
        children: [
          SafeArea(
      child: Column(
              children: [
                 SizedBox(height: 40),
                Text(
                  "FOCUS!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

               SizedBox(height: 6),
            Text(
                  "Your Mind!",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w900
                  ),
                ),

          SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "Master words, unlock\ntreasures and level up your\njourney.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.6,
                    ),
                  ),
                ),

               SizedBox(height: 35),
                Center(
                  child: Image.asset(
                    'assets/images/img_5.png',
                    fit: BoxFit.contain,// transparent PNG
                    height: 160,
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
              clipper: CurveClipper(),
              child: Container(height: 100, color: Color(0xFF8ED63F)),
            ),
          ),
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:  Color(0xFF081F3F),
                    width: 12,
                  ),
                ),
                child:  GestureDetector(
    onTap: ()async{
      await controller.forward();
    Navigator.of(context).push(
    slideRoute(PreparePage()),);
      controller.reset();
    },
               child:Icon(
               Icons.arrow_forward,
               size: 28,
               color: Colors.white,),
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
Route slideRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 600),
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween(
          begin:  Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 60)
      ..quadraticBezierTo(size.width / 2, -40, size.width, 60)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}






