import 'package:flutter/material.dart';
import 'app_screens/accountScreen.dart';
import 'app_screens/homeScreen.dart';
import 'app_screens/consultScreen.dart';

void main() => runApp(medicalHelp());

class medicalHelp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return medicalHelpBuilder();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       // This is the theme of your application.
  //       //
  //       // Try running your application with "flutter run". You'll see the
  //       // application has a blue toolbar. Then, without quitting the app, try
  //       // changing the primarySwatch below to Colors.green and then invoke
  //       // "hot reload" (press "r" in the console where you ran "flutter run",
  //       // or simply save your changes to "hot reload" in a Flutter IDE).
  //       // Notice that the counter didn't reset back to zero; the application
  //       // is not restarted.
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: MyHomePage(title: 'Flutter Demo Home Page'),
  //   )
  // }
}
class medicalHelpBuilder extends State<medicalHelp> {
  int selectedPage = 0;
  final pageOptions = [    
    accountScreen(),
    consultScreen(),
    homeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dermacare",
      home: Scaffold (
        appBar: AppBar(
          title: Text('Dermacare'),
          backgroundColor: Colors.blue,
        ),
        body: pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: selectedPage,
          onTap: (int index) {
            setState((){
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem (
              icon: Icon(Icons.home),
              title: Text('Home')
            ),
            BottomNavigationBarItem (
              icon: Icon(Icons.camera),
              title: Text('Consult Help')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
            )
          ],
        ),
      )
    );
  }
}