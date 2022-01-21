import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageurl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 170,
            width: double.infinity,
            child: _previewImageurl == null
                ? Text(
                    'No Location Chosen!',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          children: [
            FlatButton.icon(
                onPressed: () {},
                textColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.location_on,
                ),
                label: Text('Current Location!')),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.map,
                ),
                label: Text('Current Location!'),
                textColor: Theme.of(context).primaryColor)
          ],
        )
      ],
    );
  }
}
