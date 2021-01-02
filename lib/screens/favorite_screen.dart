import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hora/models/favorite_model.dart';
import 'package:hora/widgets/addButton.dart';
import 'package:hora/widgets/emptyItem.dart';

import 'package:hora/widgets/item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  final PersistentTabController persistentTabController;

  Favorite({this.persistentTabController});
  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel>(builder: (context, favModel, child) {
      final favList = favModel.favList;

      List<dynamic> finalList =
          [...favModel.favList, ...favModel.emptyList].toSet().toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Favoris'),
          elevation: 15,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: finalList.length + 1,
            itemBuilder: (context, index) {
              return index < favList.length
                  ? ListItem(
                      index,
                      Button(index, persistentTabController),
                      favList[index].imageURL,
                      favList[index].title,
                      favList[index].description,
                      favList[index].countdown,
                    )
                  : index < finalList.length
                      ? EmptyItem(persistentTabController)
                      : AddButton(persistentTabController);
            }),
      );
    });
  }
}


class Button extends StatelessWidget {
  final int index;
  final PersistentTabController persistentTabController;

  Button(this.index, this.persistentTabController);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel>(builder: (context, favModel, child) {
      final favList = favModel.favList;
      var now = DateTime.now().millisecondsSinceEpoch;

      return GestureDetector(
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 32,
          ),
          onTap: () {
            favList[index].countdown - now > 1210000000
                ? favModel.removeOfFavorite(
                    index, EmptyItem(persistentTabController), favList[index])
                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: favList[index].countdown - now > 0
                        ? Text('La sortie est dans moins de 2 semaines.')
                        : Text('L\'élément sera supprimé dans 1 mois')));
            ;
          });
    });
  }
}
