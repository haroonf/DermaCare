import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:async';


class consultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CameraApp();
}

class CameraApp extends State<consultScreen> {
  File _image;
  // CameraApp(FirebaseUser user) {
  //   this.firebaseUser = user;
  // }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var cameraWidget = new Center(
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*.6,
            child:Center(
              child: _image == null? new Text('No image selected'):new Image.file(_image),
            ),
          ),          
          RaisedButton(
            "Capture Picture",
            onPressed: getImage,
            color: Colors.blue,
            child: Text("Capture Picture"),
          ),
          attributeBuilder("Symptoms", ""),
          attributeBuilder("Current Medications", ""),
          attributeBuilder("Odd  Patterns", "")
        ],
      )
      
    );
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('myimage1.jpg');
    final StorageUploadTask task = firebaseStorageRef.putFile(_image);
    return cameraWidget;
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