import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/screens/bottom_navigation.dart';


class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: '\nChoose Your Categories !',
      body: '\nGet all your CREDIT & DEBIT updates in one touch',
      image: Center(
        child: Icon(Icons.analytics_outlined,
            size: 200, color: Colors.teal.shade700),
      ),
      decoration: PageDecoration(
        titleTextStyle: const TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.brown),
        bodyTextStyle: TextStyle(
            fontSize: 22,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade700),
      ),
    ),
    PageViewModel(
        title: '\nAccess Everywhere !',
        body: '\nCheck out the Bank Balance & Transaction Details',
        image: Center(
            child: Icon(
          CupertinoIcons.waveform_path_ecg,
          size: 200,
          color: Colors.teal.shade700,
        )
            //Image.asset('assets/images/onb2.png'),
            ),
        decoration: PageDecoration(
            titleTextStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown),
            bodyTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.teal.shade700))),
    PageViewModel(
        title: '\nCurrency Check !',
        body: '\nCheck out the Currency Expenses in Analytics Basis',
        image: Center(
            child: Icon(
          Icons.currency_rupee,
          size: 200,
          color: Colors.teal.shade700,
        )
            //Image.asset('assets/images/onb2.png'),
            ),
        decoration: PageDecoration(
            titleTextStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown),
            bodyTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.teal.shade700))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: const Size(8, 8),
            color: Colors.red,
            activeSize: const Size.square(15),
            activeColor: Colors.teal.shade700,
          ),
          showDoneButton: true,
          done: const Text(
            ' Done',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          showSkipButton: true,
          skip: InkWell(
            onTap: () async {
             await _completeOnboarding().then((value) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const bottom_Navigation())));
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
            color: Colors.black,
          ),
          onDone: () {
            _completeOnboarding().then((value) {});
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const bottom_Navigation()));
          },
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  Future _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIns', true);
  }
}
