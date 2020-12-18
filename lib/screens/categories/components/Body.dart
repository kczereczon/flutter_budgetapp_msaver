import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CategoriesBody extends StatefulWidget {
  @override
  State<CategoriesBody> createState() {
    return CategoriesDialog();
  }
}

class CategoriesDialog extends State<CategoriesBody> {
  final _formKey = GlobalKey<FormState>();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) => setState(() => currentColor = color);
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
                                          ColorPicker(
                                            pickerColor: currentColor,
                                            onColorChanged: changeColor,
                                            colorPickerWidth:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            pickerAreaHeightPercent: 0.1,
                                            enableAlpha: false,
                                            displayThumbColor: false,
                                            showLabel: false,
                                            paletteType: PaletteType.hsv,
                                            pickerAreaBorderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("DODAJ"),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
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
    ]);
  }
}
