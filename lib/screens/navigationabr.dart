
import 'package:flutter/material.dart';
import 'package:internshipproject1/screens/dashbord.dart';
import 'package:internshipproject1/screens/message.dart';
import 'package:internshipproject1/screens/profile.dart';
import 'package:internshipproject1/screens/question.dart';
import 'package:internshipproject1/screens/trending.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  @override
  int selectedindex=0;
  List<Widget> screenlist =[
    Dashbord(image: '', title: '', subtitle: '',),
    QuestionPage(),
    trending(),
    message(),
    profile(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screenlist.elementAt(selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (val){
          selectedindex=val;

          setState(() {


          });
        },
        currentIndex: selectedindex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon:  Icon(Icons.home_outlined),label: " "),
          BottomNavigationBarItem(icon:  Icon(Icons.question_mark),label: ""),
          BottomNavigationBarItem(icon:  Icon(Icons.ondemand_video_outlined),label: ""),
          BottomNavigationBarItem(icon:  Icon(Icons.chat_bubble_outline),label: ""),
          BottomNavigationBarItem(icon:  Icon(Icons.person_outline),label: ""),

        ],
      ),


    );
  }
}