import 'package:flutter/material.dart';
import 'package:hora/models/favorite_model.dart';
import 'package:hora/widgets/emptyItem.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  final PersistentTabController persistentTabController;

  AddButton(this.persistentTabController);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel>(builder: (context, favModel, child) {
      return Padding(
      padding: EdgeInsets.all(10),
      child: FlatButton.icon(
        label: Text(
          'Ajoute une place !',
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: () {
          favModel.addEmpty(EmptyItem(
            persistentTabController,
          ));
        },
        color: Colors.green[400],
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  });}
}
