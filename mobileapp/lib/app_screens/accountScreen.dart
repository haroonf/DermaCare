import 'package:flutter/material.dart';

class accountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return accountWidget();
  }
}

class accountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Center(
        child: ListView (
          children: <Widget> [
            Container (
              alignment: Alignment(0, 0),
              height: MediaQuery.of(context).size.height*0.075,
              child: Text(
                'My Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue
                )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              child:profileAvatar(),  
            ),
            Text(
              'Rahul Narvekar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            Row (
              children: <Widget>[
                attributeBuilder("Age", "19"),
                attributeBuilder("Height", "65"),
              ],
            ),
            Row (
              children: <Widget>[
                attributeBuilder("Weight", "132"),
                attributeBuilder("Eyes", "Brown"),
              ],
            ), 
            Row (
              children: <Widget>[
                attributeBuilder("Race", "Indian"),
                attributeBuilder("Sex", "Male"),
              ],
            ),
            Text(
              'Medical Records',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*0.4,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext ctxt, int index) {
                  return historyUIComponent(index);
                }
              )
            ),            
          ]          
        ),
      ),
    );
  }
}
class historyUIComponent extends StatelessWidget {
  int currIndex;
  historyUIComponent(this.currIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile (
      onTap: (){},
      leading: Icon(Icons.save),
      title: Text("dd/mm/yyyy"),
      subtitle: Text("your reason for visit will go here"),
      trailing: Icon(Icons.sentiment_satisfied),
    );
  }
  
}
class profileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage right = new AssetImage('assets/avatar.png');
    Image avatar = Image(image: right);
    return Container(child: avatar);
  }  
}
class attributeBuilder extends StatelessWidget {
  var property;
  var number;
  attributeBuilder(this.property,this.number); 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.5,  
      child: Column(
        children: <Widget>[
          Text(
            property,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          TextFormField (
            initialValue: number,
            textAlign: TextAlign.center
          )
        ],
      ),
    );
  }  
}