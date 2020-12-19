import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pam_2020_msaver/components/CategoryElement.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';

class CategoriesBody extends StatefulWidget {
  @override
  State<CategoriesBody> createState() {
    return CategoryView();
  }
}

class CategoryView extends State<CategoriesBody> {
  Future<List<CategoryModel>> categories = SqliteDatabase.db.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FlatButton(
                child: Text('+ NOWA KATEGORIA',
                    style: TextStyle(color: Colors.white)),
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _NewDialog(
                            onChange: () => setState(() => {
                                  categories =
                                      SqliteDatabase.db.getAllCategories()
                                }));
                      })
                },
                color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
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
                return CategoryElement(
                    categoryModel: item,
                    delete: () {
                      SqliteDatabase.db.deleteCategory(item.id);
                      setState(() {
                        categories = SqliteDatabase.db.getAllCategories();
                      });
                    });
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ))
    ]);
  }
}

class _NewDialog extends StatefulWidget {
  _NewDialog({
    @required this.onChange,
  });

  final Function onChange;

  @override
  _NewDialogState createState() => _NewDialogState(onChange: this.onChange);
}

class _NewDialogState extends State<_NewDialog> {
  _NewDialogState({
    @required this.onChange,
  });

  final Function onChange;

  final _formKey = GlobalKey<FormState>();
  String name;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) => setState(() => {currentColor = color});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nazwa kategori",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nazwa nie może być pusta!';
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        onChanged: (text) {
                          setState(() {});
                          name = text;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Kolor",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          elevation: 3.0,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return _ColorPicker(
                                    currentColor: currentColor,
                                    changeColor: (Color color) =>
                                        setState(() => {currentColor = color}));
                              },
                            );
                          },
                          child: const Text('Kliknij aby zmienić.'),
                          color: currentColor,
                          textColor: useWhiteForeground(currentColor)
                              ? const Color(0xffffffff)
                              : const Color(0xff000000),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text("DODAJ", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        SqliteDatabase.db.insertCategory(CategoryModel(
                            name: this.name, color: this.currentColor));
                        this.onChange();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  _ColorPicker({
    @required this.currentColor,
    @required this.changeColor,
  });

  Color currentColor;
  final Function changeColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          onColorChanged: changeColor,
          colorPickerWidth: 300.0,
          pickerAreaHeightPercent: 0.7,
          enableAlpha: false,
          displayThumbColor: false,
          showLabel: false,
          paletteType: PaletteType.hsv,
          pickerAreaBorderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(2.0),
            topRight: const Radius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
