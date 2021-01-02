import 'package:flutter/material.dart';
import 'package:hora/common/data.dart';
import 'package:hora/models/favorite_model.dart';
import 'package:hora/widgets/item.dart';
import 'package:provider/provider.dart';
import 'package:hora/widgets/home_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Consumer<FavModel>(builder: (context, favModel, child) {
        final snackBar =
            SnackBar(content: Text('Tu n\'a pas assez de place !'));
        return ListView.builder(
            shrinkWrap: false,
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              favModel.implement();
              return ListItem(
                  index,
                  GestureDetector(
                      child: Icon(
                        itemData[index].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: itemData[index].isFavorite ? Colors.white : null,
                        size: 32,
                      ),
                      onTap: () {
                        itemData[index].isFavorite
                            ? () {}
                            : favModel.emptyList.length > 0
                                ? Provider.of<FavModel>(context, listen: false)
                                    .addInFavorite(
                                    itemData[index],
                                    index,
                                    0,
                                  )
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                      }),
                  itemData[index].imageURL,
                  itemData[index].title,
                  itemData[index].description,
                  itemData[index].countdown);
            });
      }),
    );
  }
}
