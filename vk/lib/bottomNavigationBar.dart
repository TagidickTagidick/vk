import 'package:flutter/material.dart';
import 'package:vk/newsOrDiscover/newsOrDiscover.dart';
import 'package:vk/explore/explore.dart';
import 'package:vk/messages/messages.dart';
import 'package:vk/clips/clips.dart';
import 'package:vk/profile/profile.dart';

class VkBottomNavigationBar extends StatefulWidget {
  @override
  _VkBottomNavigationBarState createState() => _VkBottomNavigationBarState();
}

class _VkBottomNavigationBarState extends State<VkBottomNavigationBar>
{
  int _currentIndex = 0;
  final List<Widget> _children = [
    NewsOrDiscover(),
    Explore(),
    Messages(),
    Clips(),
    Profile()
  ];

  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar
          (
            onTap: onTappedBar,
            currentIndex: _currentIndex,
            items:
            [
              BottomNavigationBarItem
                (
                  icon: new Icon(
                      Icons.payment,
                      color: _currentIndex == 0 ? Color(0xff4c75a3) : Color(0xff424242),
                  ),
                  title: new Text("")
              ),
              BottomNavigationBarItem
                (
                  icon: Icon(
                      Icons.explore,
                    color: _currentIndex == 1 ? Color(0xff4c75a3) : Color(0xff424242),
                  ),
                  title: Text("")
              ),
              BottomNavigationBarItem
                (
                  icon: Icon(
                      Icons.message,
                    color: _currentIndex == 2 ? Color(0xff4c75a3) : Color(0xff424242),
                  ),
                  title: Text("")
              ),
              BottomNavigationBarItem
                (
                  icon: Icon(
                      Icons.search,
                    color: _currentIndex == 3 ? Color(0xff4c75a3) : Color(0xff424242),
                  ),
                  title: Text("")
              ),
              BottomNavigationBarItem
                (
                  icon: Icon(
                      Icons.person_pin,
                    color: _currentIndex == 4 ? Color(0xff4c75a3) : Color(0xff424242),
                  ),
                  title: new Text("")
              ),
            ]
        )
    );
  }
}