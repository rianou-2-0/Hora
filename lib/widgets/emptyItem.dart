import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class EmptyItem extends StatelessWidget {
  final PersistentTabController persistentTabController;

  EmptyItem(this.persistentTabController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 2.0,
        right: 2.0,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColorLight,
          ),
          child: FlatButton(
            height: MediaQuery.of(context).size.height / 5,
            onPressed: () {
              persistentTabController.jumpToTab(0);
            },
            child: Text('Ajoute un favoris !'),
          ),
        ),
      ),
    );
  }
}