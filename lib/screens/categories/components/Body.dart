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
                        return _NewDialog();
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
        future: SqliteDatabase.db.getAllCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(9),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                CategoryModel item = snapshot.data[index];
                return CategoryElement(name: item.name, color: Colors.red);
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
  @override
  _NewDialogState createState() => _NewDialogState();
}

class _NewDialogState extends State<_NewDialog> {
  final _formKey = GlobalKey<FormState>();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) => setState(() => {currentColor = color});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                child: Icon(Icons.close)),
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
                          ),
                        ],
                      ),
                      TextFormField()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kolor",
                          ),
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
                  child: RaisedButton(
                    child: Text("DODAJ"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
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
