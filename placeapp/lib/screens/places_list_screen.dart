import 'package:flutter/material.dart';
import 'package:placeapp/providers/great_places.dart';
import 'package:placeapp/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlace.routeName);
                },
                icon: Icon(Icons.add))
          ],
          title: Text('Add Your Places!'),
        ),
        body: FutureBuilder(
          future:
              Provider.of<GreatPlaces>(context, listen: false).fetchplaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: Center(
                    child: Text('Got no places yet!'),
                  ),
                  builder: (ctx, places, ch) => places.items.length <= 0
                      ? ch
                      : ListView.builder(
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(places.items[i].Image),
                            ),
                            title: Text(places.items[i].title),
                            onTap: () {},
                          ),
                          itemCount: places.items.length,
                        ),
                ),
        ));
  }
}
