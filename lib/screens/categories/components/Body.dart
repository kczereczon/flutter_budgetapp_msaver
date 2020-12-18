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

  void changeColor(Color color) => setState(() => {currentColor = color});

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
                          backgroundColor: Colors.grey.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))
                          ),
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
                                                "Nazwa kategorii",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          TextFormField(
                                            cursorColor: Colors.white,
                                            style: TextStyle(color: Colors.white),
                                            decoration: new InputDecoration(
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                                ),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)
                                              ),

                                            ),
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
                                              Text(
                                                "Kolor",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          ButtonTheme(
                                            minWidth: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: FlatButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      titlePadding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ColorPicker(
                                                          pickerColor:
                                                              currentColor,
                                                          onColorChanged:
                                                              changeColor,
                                                          colorPickerWidth:
                                                              300.0,
                                                          pickerAreaHeightPercent:
                                                              0.7,
                                                          enableAlpha: false,
                                                          displayThumbColor:
                                                              false,
                                                          showLabel: false,
                                                          paletteType:
                                                              PaletteType.hsv,
                                                          pickerAreaBorderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft: const Radius
                                                                .circular(2.0),
                                                            topRight: const Radius
                                                                .circular(2.0),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Text(
                                                  'Kliknij aby zmienić.'),
                                              color: currentColor,
                                              textColor: useWhiteForeground(
                                                      currentColor)
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
                                        child: Text("DODAJ", style: TextStyle(color: Colors.white),),
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
