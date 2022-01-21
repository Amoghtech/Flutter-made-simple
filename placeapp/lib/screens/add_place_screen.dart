import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:placeapp/providers/great_places.dart';
import 'package:placeapp/widgets/image_input.dart';
import 'package:placeapp/widgets/location_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titlecontroller = TextEditingController();
  File _pickedimage;

  void _selectImage(File pickedimage) {
    _pickedimage = pickedimage;
  }

  void _saveplace() {
    if (_titlecontroller.text.isEmpty || _pickedimage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context)
        .addplace(_titlecontroller.text, _pickedimage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titlecontroller,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput()
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            onPressed: _saveplace,
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            label: Text('Add place'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
