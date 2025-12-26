import 'package:flutter/material.dart';

class FrogBoatPage extends StatefulWidget {
  const FrogBoatPage({super.key});

  @override
  State<FrogBoatPage> createState() => _FrogBoatPageState();
}

class _FrogBoatPageState extends State<FrogBoatPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // slow & smooth
    );

    /// FROM LEFT → CENTER
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.2, 0), // left outside screen
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081F3F),
      body: SafeArea(
        child: Column(
          children: [
           SizedBox(height: 30),
            languageGrid(),
            SizedBox(height: 30),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // child:  Text(
                      //  // "Choose your language!",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                    ),
                   SizedBox(height: 12),
                    Image.asset(
                      "assets/images/img.png",
                      height: 160,
                    ),
                  ],
                ),
              ),
            ),
          Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00A9B5),
                  padding: EdgeInsets.symmetric(
                    horizontal: 110,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _Lang extends StatelessWidget {
  final String text;
  const _Lang(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
    );
  }
}
Widget languageGrid() {
  final languages = [
    "हिंदी",
    "English",
    "मराठी",
    "தமிழ்",
    "اردو",
    "తెలుగు",
    "ಕನ್ನಡ",
    "മലയാളം",
    "English",
  ];
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 24),
    child: GridView.builder(
      shrinkWrap: true,
      physics:  NeverScrollableScrollPhysics(),
      itemCount: languages.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 per row
        mainAxisSpacing: 22,
        crossAxisSpacing: 30,
        childAspectRatio: 3, // spacing like image
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            languages[index],
            style:  TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    ),
  );
}
