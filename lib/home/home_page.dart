import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Function/home.dart';
import '../Function/Traffic_push.dart';
import '../Function/group.dart';
import '../Function/home.dart';
import '../Function/traffic_information.dart';
import '../Function/setting.dart';
import '../newbar/newbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottonTabs = [
    const BottomNavigationBarItem(
        label: '路況推播',
        icon: Icon(CupertinoIcons.arrow_branch),
        tooltip: "路況推播"),
    const BottomNavigationBarItem(
        label: '群組', icon: Icon(CupertinoIcons.group), tooltip: "群組"),
    const BottomNavigationBarItem(
        label: 'Home', icon: Icon(CupertinoIcons.home), tooltip: "首頁"),
    const BottomNavigationBarItem(
        label: '道路資訊',
        icon: Icon(CupertinoIcons.bubble_left_bubble_right),
        tooltip: "道路資訊"),
    const BottomNavigationBarItem(
        label: '設定', icon: Icon(CupertinoIcons.settings), tooltip: "設定")
  ];

  final List tabBodies = [
    TrafficPush(),
    group(),
    home(),
    traffic_information(),
    setting()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      drawer: Navbar(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottonTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
