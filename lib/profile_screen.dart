import 'dart:ui';

import 'package:animator_contia/customText.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  bool isBlurred = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          Column(
            children: [
              Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              Center(
                child: Text(
                  "Kalesh Jangir",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
              Container(
                width: 250,
                height: 370,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomTextWithDivider(
                        label: "Email", value: "@vkvfvk@gmail."),
                    CustomTextWithDivider(label: "sdfgn", value: "sdffn"),
                    CustomTextWithDivider(label: "sdfgn", value: "sdffn"),
                    CustomTextWithDivider(label: "sdfgn", value: "sdffn"),
                    CustomTextWithDivider(label: "sdfgn", value: "sdffn"),
                    CustomTextWithDivider(
                        label: "sdfgn", value: "sdffn", showDivider: false),
                  ],
                ),
              )
            ],
          ),

          // Conditional blur filter for background
          isBlurred
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              : const SizedBox.shrink(),
          // Content container or images

          Positioned(
            bottom: 10,
            child: Center(
              child: isExpanded
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = false;
                          isBlurred = false;
                        });
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text("Save Chan"),
                              onPressed: () {
                                setState(() {
                                  isExpanded = false;
                                  isBlurred = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = true;
                          isBlurred = true;
                        });
                      },
                      child: Text('Edit'),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
