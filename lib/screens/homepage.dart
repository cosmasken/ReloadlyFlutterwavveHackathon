import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/screens/add/add.dart';
import 'package:swarp/screens/chat/chat.dart';
import 'package:swarp/screens/community/community.dart';
import 'package:swarp/screens/home/home.dart';
import 'package:swarp/screens/profile/profile.dart';
import 'package:swarp/theme/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _index = 0;
  var _isVisible;
  var _ispost;
  var _isservice;


  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget? child;
    switch (_index) {
      case 0:
        child = Home();
        break;
      case 1:
        child = Community();
        break;
      case 2:
        child = Add();
        break;
      case 3:
        child = Chat();
        break;
      case 4:
        child = Profile();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Swarp"),

        actions: [

          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: AppColors.secondary, title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.person),backgroundColor: AppColors.secondary, title: Text("Community")),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded),backgroundColor: AppColors.secondary, title: Text("Add")),
          BottomNavigationBarItem(icon: Icon(Icons.message),backgroundColor: AppColors.secondary, title: Text("Chat")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),backgroundColor: AppColors.secondary, title: Text("Profile")),
        ],
      ),
    );
  }
}
