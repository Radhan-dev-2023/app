import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/screens/trasnsaction_screen.dart';

import 'ProfileScreen.dart';
import 'analytics_screen.dart';
import 'home_screen.dart';

class bottom_Navigation extends StatefulWidget {
  const bottom_Navigation({Key? key}) : super(key: key);

  @override
  State<bottom_Navigation> createState() => bottom_NavigationState();
}

class bottom_NavigationState extends State<bottom_Navigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TransactionScreen(),
    const AnalyticsScreen(),
    const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(

        color:const Color.fromRGBO(57,112, 104, 1),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.house_fill, color: _currentIndex == 0 ? Colors.white : Colors.black, size: _currentIndex==0?35:30,),
                  onPressed: () => _selectPage(0),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.waveform_path_ecg, color: _currentIndex == 1 ? Colors.white : Colors.black, size: _currentIndex==1?35:30,),
                  onPressed: () => _selectPage(1),
                ),
                IconButton(
                  icon: Icon(Icons.analytics_outlined, color: _currentIndex == 2 ? Colors.white : Colors.black,size: _currentIndex==2?35:30,),
                  onPressed: () => _selectPage(2),
                ),
                IconButton(
                  onPressed: () => _selectPage(3),
                  icon: Icon(Icons.person_2, color: _currentIndex == 3 ? Colors.white : Colors.black, size: _currentIndex==3?35:30,),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / _pages.length,
                height: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}