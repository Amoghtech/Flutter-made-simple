import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedimage;

  Future<void> _takePicture() async {
    final imagefile =
        await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 600);
    if (imagefile == null) {
      return;
    }
    setState(() {
      _storedimage = File(imagefile.path);
    });
    final appdir = await syspaths.getApplicationDocumentsDirectory();
    var filename = path.basename(_storedimage.path);
    final savedimage = await _storedimage.copy('${appdir.path}/${filename}');
    widget.onSelectImage(savedimage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedimage != null
              ? Image.file(
                  _storedimage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take picture'),
          textColor: Theme.of(context).primaryColor,
        ))
      ],
    );
  }
}
