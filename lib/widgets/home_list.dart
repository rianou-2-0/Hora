import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';


class ImageObject extends StatelessWidget {
  final String itemData;
  const ImageObject(this.itemData);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft : Radius.circular(10.0), bottomLeft: Radius.circular(10.0),),
      child: CachedNetworkImage(
        height: MediaQuery.of(context).size.height/5,
        width: MediaQuery.of(context).size.width/4,
        imageUrl: itemData,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextObject extends StatelessWidget {
  final String title;
  final String description;
  const TextObject(this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacer(),
        Container(
          padding: const EdgeInsets.only(top: 15.0),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ),
        Spacer(),
      ],
    ),);
  }
}

class CountObject extends StatelessWidget {
  final int date;
  const CountObject(
    this.date,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 20), child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: CountdownTimer(
          daysSymbol: Text( "j "),
          hoursSymbol: Text(" : "),
          minSymbol: Text(" : "),
          secSymbol: Text(""),
          endTime: date,
          textStyle: Theme.of(context).textTheme.headline3,
          emptyWidget: Center(child: Text('Va sur Netflix!')
          ),

        )
    )
    );
  }
}