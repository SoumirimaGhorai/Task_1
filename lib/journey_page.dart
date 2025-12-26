import 'package:flutter/material.dart';
import 'package:task1/boat_page.dart';

class JourneyPage extends StatelessWidget {
  const JourneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081F3F), // dark blue background
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
             SizedBox(height: 40),
              Text(
                "JOURNEY!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Awaits!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
      SizedBox(height: 40),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF081F3F),
                      Color(0xFF081F3F),
                    ],
                  ),
                ),
                child: CircleAvatar(maxRadius: 70,minRadius: 10,backgroundColor:Color(0xff021123),
                  child: Image.asset(
                    "assets/images/img_2.png", // replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
              ),
           SizedBox(height: 20),
               Text(
                "LingoBreeze",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA1E8EC),
                ),
              ),
           SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FrogBoatPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
               EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child:Text(
                  "Lets Get Started",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
