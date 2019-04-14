import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';


class consultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CameraApp();
}

class fileUtilities {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/myfile.text');
  }
  static Future<File> saveToFile(String data) async{
    final file = await getFile;
    final modified = file.writeAsString(data);
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('email.txt');
    final StorageUploadTask task = firebaseStorageRef.putFile(await modified);
    return modified;
  }
}

class CameraApp extends State<consultScreen> {
  void onChanged (String value) {
    _write(value);
  }
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
  final myController = TextEditingController ();
  @override
  Widget build(BuildContext context) {
    String fileContents = "";
    void onPressed() {

    }
    // TODO: implement build
    var cameraWidget = new Center(
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*.5,
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
          Container(
            width: MediaQuery.of(context).size.width*0.5,  
            child: Column(
            children: <Widget>[
              Text(
                'E-mail',
                style: TextStyle(
                color: Colors.blue,
              ),
            ),
          TextField (
            textAlign: TextAlign.center,
            controller: myController,            
              )
            ],
            ),
          ),
          RaisedButton(
            "Submit",
            onPressed: () {
              fileUtilities.saveToFile(myController.text);
            },
            child: Text('Submit'),
            color: Colors.blue,
          )
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
  void onChanged (String value) {
    _write(value);
  }
  
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
          TextField (
            textAlign: TextAlign.center,
            onChanged: (String value) {
              onChanged: (String value) {onChanged(value);};
            },
          )
        ],
      ),
    );
  }  
}
_write(String text) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/my_file.txt');
  await file.writeAsString(text);
  final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('myimage1.jpg');
  final StorageUploadTask task = firebaseStorageRef.putFile(file);
}