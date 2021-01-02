import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:hora/models/bottomNavigationBarModel.dart';

class BottomTabScreen extends StatelessWidget {

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return  Consumer<BottomNavigationBarModel>(
      builder: (BuildContext context, BottomNavigationBarModel bottomNavigationBarModel, Widget child) {
        return PersistentTabView(
          context,
          controller: _controller,
          screens: bottomNavigationBarModel.getBarItems(_controller),
          items: bottomNavigationBarModel.bottomNavigationBarItems,
          navBarHeight: MediaQuery.of(context).size.height/14,
          confineInSafeArea: true,
          backgroundColor: Theme.of(context).primaryColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: false,
          ),
          navBarStyle: NavBarStyle.style6,
        );
      },
    );
  }
}