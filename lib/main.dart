import 'package:flutter/material.dart';
import 'package:travel_app_ui/screens/hotel_screen.dart';

import 'screens/activity_screen.dart';
import 'widgets/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Travel App UI',
        initialRoute: '/activities',
        routes: {
          ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
          HotelScreen.routeName: (context) => const HotelScreen(),
        },
        builder: (context, child) {
          return _TravelApp(
            navigator: (child!.key as GlobalKey<NavigatorState>),
            child: child,
          );
        });
  }
}

class _TravelApp extends StatefulWidget {
  const _TravelApp({Key? key, required this.navigator, required this.child})
      : super(key: key);

  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  @override
  State<_TravelApp> createState() => __TravelAppState();
}

class __TravelAppState extends State<_TravelApp> {
  bool isOnBoarding = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: isOnBoarding
          ? _buildOnBoarding(context)
          : Row(
              children: [
                SideBar(
                  width: width,
                  height: height,
                  navigator: widget.navigator,
                ),
                Expanded(
                  child: widget.child,
                )
              ],
            ),
    );
  }

  Container _buildOnBoarding(context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.45,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Text(
                'Hidden Treasures of Italy',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isOnBoarding = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Explore Now',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
