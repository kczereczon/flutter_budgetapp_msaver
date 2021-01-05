import 'dart:wasm';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pam_2020_msaver/components/Outcome.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/models/OutcomeModel.dart';
import 'package:pam_2020_msaver/screens/categories/CategoriesScreen.dart';
import 'package:pam_2020_msaver/screens/raport/RaportScreen.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';
import 'package:sqflite/sqflite.dart';

class Body extends StatefulWidget {
  Future<List<OutcomeModel>> outcomes = SqliteDatabase.db.getAllOutcomes();

  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      child: Text('+ KATEGORIA',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        bool refresh = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoriesScreen();
                        }));

                        if (refresh) {
                          setState(() {
                            widget.outcomes =
                                SqliteDatabase.db.getAllOutcomes();
                          });
                        }
                      },
                      color:
                          Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    FlatButton(
                      child:
                          Text('REPORT', style: TextStyle(color: Colors.white)),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RaportScreen();
                        }))
                      },
                      color:
                          Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    FlatButton(
                      child: Text('+ WYDATEK',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _NewOutcomeAlert(updateOutcomes: () {
                                setState(() {
                                  widget.outcomes =
                                      SqliteDatabase.db.getAllOutcomes();
                                });
                              });
                            })
                      },
                      color:
                          Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                )),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
        Expanded(
            child: FutureBuilder<List<OutcomeModel>>(
          future: widget.outcomes,
          builder: (BuildContext context,
              AsyncSnapshot<List<OutcomeModel>> snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(9),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  OutcomeModel item = snapshot.data[index];
                  return Outcome(
                      title: item.name,
                      dateTime: item.dateTime,
                      value: item.value,
                      category: item.category);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ))
      ],
    );
  }
}

class _NewOutcomeAlert extends StatefulWidget {
  _NewOutcomeAlert({this.updateOutcomes});

  String title = "";
  double value = 0.00;
  CategoryModel category;
  List<CategoryModel> categories = List<CategoryModel>();
  Function updateOutcomes;

  @override
  _NewOutcomeAlertState createState() {
    return _NewOutcomeAlertState();
  }
}

class _NewOutcomeAlertState extends State<_NewOutcomeAlert> {
  final _formKey = GlobalKey<FormState>();

  void setCategory(CategoryModel newCategory) =>
      setState(() => {widget.category = newCategory});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    List<CategoryModel> categoires = await SqliteDatabase.db.getAllCategories();
    setState(() {
      widget.categories = categoires;
      widget.category = categoires.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -0.0,
            top: -0.0,
            child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close, color: Colors.white)),
          ),
          Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Nazwa nie może być pusta!';
                        }
                        return null;
                      },
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white70),
                      decoration: new InputDecoration(
                        labelText: "Nazwa wydatku",
                        hintText: "np. zakupy biedronka",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          widget.title = text;
                        });
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(?:\.\d{0,2})?$')),
                      ],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Kwota nie może być pusta!';
                        }
                        return null;
                      },
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        labelText: "Kwota",
                        hintText: "np. 10.00",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          widget.value = double.parse(text);
                        });
                      },
                    ),
                    DropdownButtonFormField<CategoryModel>(
                      decoration: InputDecoration(
                        labelText: 'Kategoria',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      items: widget.categories
                          .map<DropdownMenuItem<CategoryModel>>(
                              (CategoryModel model) {
                        return DropdownMenuItem<CategoryModel>(
                          value: model,
                          child: Text(model.name),
                        );
                      }).toList(),
                      onChanged: (newCategory) {
                        setCategory(newCategory);
                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      value: widget.category,
                      selectedItemBuilder: (BuildContext context) {
                        return widget.categories.map((CategoryModel value) {
                          return Text(
                            widget.category.name,
                            style: TextStyle(color: Colors.white70),
                          );
                        }).toList();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        child: Text("DODAJ",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print(SqliteDatabase.db.insertOutcome(OutcomeModel(
                                name: widget.title,
                                category: widget.category,
                                value: widget.value,
                                dateTime: DateTime.now())));
                            widget.updateOutcomes();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
