import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:placeapp/providers/great_places.dart';
import 'package:placeapp/screens/add_place_screen.dart';
import 'package:placeapp/screens/places_list_screen.dart';
import 'package:provider/provider.dart';



class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ChangeNotifierProvider.value(
          value: GreatPlaces(),
          child: MaterialApp(
              title: 'Great Places',
              theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber
              ),
              home: PlaceListScreen(),
              routes: {
                AddPlace.routeName:(ctx)=>AddPlace()
              },
            ),
        );
;
  }
}
