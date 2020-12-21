import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/components/Raport.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';

class RaportBody extends StatefulWidget {
  @override
  State<RaportBody> createState() {
    return RaportView();
  }
}

class RaportView extends State<RaportBody> {
  Future<List<CategoryModel>> categories = SqliteDatabase.db.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
    Expanded(
    child: FutureBuilder<List<CategoryModel>>(
      future: categories,
      builder: (BuildContext context,
          AsyncSnapshot<List<CategoryModel>> snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.all(9),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              CategoryModel item = snapshot.data[index];
              return Raport(
                  category: item,
                 );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ))
    ]);
    // TODO: implement build
    throw UnimplementedError();
  }

}