import 'package:flutter/material.dart';


class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homeScreenBuilder();
  }
}

class homeScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
               child: Text(
                'My Account',
                textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
               child: Text(
                'rahul200023@gmail.com',
                textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            buttonBuilder("Change Password"),
            buttonBuilder("Edit Profile"),
            buttonBuilder("Notifications"),
            buttonBuilder("Support")
          ],
        ),
      ),
    );
  }
}

class buttonBuilder extends StatelessWidget {
  var btnName;
  buttonBuilder(this.btnName);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container (
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width*0.7,
      height: MediaQuery.of(context).size.height*0.125,
      child: RaisedButton(
        btnName,
        onPressed: (){},
        color: Colors.blue,
        child: Text(
          btnName,
        ),
      ),
    );
  }
}