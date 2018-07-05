import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => new _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File file;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return new Builder(builder: (BuildContext Context) {
      return new Scaffold(
        appBar: new AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new RaisedButton(
                  child: const Text('Select Image from Camer'),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    _selectImageFromCamera();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: new RaisedButton(
                  child: const Text('Select Image from Gallery'),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    _selectImagefromGallery();
                  },
                ),
              ),
              _displayImageFiles(file),
              _displayImageFiles(file),
            ],
          ),
        ),
      );
    });
  }

  Future _selectImagefromGallery() async {

    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {

    });

  }

  Future _selectImageFromCamera() async {
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  _displayImageFiles(File file) {
    return new SizedBox(
      width: 200.0,
      height: 200.0,
      child: new Container(
        //Div
        child: file == null
            ? new Text('Sorry Nothing selected')
            : new Image.file(file),
      ),
    );
  }
}
