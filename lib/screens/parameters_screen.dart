import 'package:flutter/material.dart';
import 'package:hora/models/favorite_model.dart';
import 'package:provider/provider.dart';
import 'package:hora/common/style.dart';

class Parameters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paramètres'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColorLight,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vos statistiques :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold, color: white87),
                      ),
                      Spacer(),
                      Center(
                        child: Consumer<FavModel>(
                            builder: (context, favModel, child) {
                          int number = favModel.favList.length;
                          return Text(
                            number > 1 ? 'Vous avez ajoutez $number favoris' : 'Vous avez ajoutez $number favori',
                            style: TextStyle(fontSize: 16, color: white87),
                          );
                        }),
                      ),
                      Spacer(),
                    ]),
              ),
              SettingItem('Email', 'test@gmail.com', Icons.alternate_email,
                 ),
              SettingItem(
                  'Telephone', '+33 7 02 06 09', Icons.phone,),
              SizedBox(height: 18),
              SettingItem('Notification', 'activé', Icons.notifications,
                 ),
              SettingItem('Sécurité', '', Icons.security,),
              SizedBox(height: 18),
              SettingItem('Pays', 'France', Icons.language,),
              SettingItem('Thème', 'sombre', Icons.brightness_2_outlined,
                 ),
              SettingItem('Aide', '', Icons.help_outline,),
            ],
          ),
        ));
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String sub;

  SettingItem(this.title, this.sub, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Container(
            height: MediaQuery.of(context).size.height / 19,
            width: MediaQuery.of(context).size.height / 19,
            decoration: BoxDecoration(
              color: kbackIcon,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, color: Colors.white60, size: 22),
            ),
          ),
        ),
        Text(title,
            style: TextStyle(
              fontSize: 16,
            )),
        Spacer(),
        Text(sub, style: TextStyle(fontSize: 14, color: Colors.white38)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white38,
          iconSize: 16,
        ),
      ],
    );
  }
}
