import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorer'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.search,
                color: Colors.white38,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Cherches une série ou un film',
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
