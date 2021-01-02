import 'package:flutter/material.dart';
import 'package:hora/widgets/home_list.dart';

class ListItem extends StatelessWidget {
  final int index;
  final Widget button;
  final String image;
  final String title;
  final String description;
  final int date;

  ListItem(this.index, this.button, this.image, this.title, this.description, this.date);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColorLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageObject(
                image,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextObject(
                        title, description),
                    CountObject(
                      date,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: button,
              ),
            ],
          ),
        ),
      );
  }
}