import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calc(),
        appBar: AppBar(title: Text("Калькулятор площади")),
      )));
}

class Calc extends StatefulWidget {
  Calc({Key? key}) : super(key: key);
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var width;
  var height;
  String value = "Задайте параметры";
  var S;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: [
                    SizedBox(height: 10),
                    Text("Ширина(мм):"),
                    SizedBox(height: 10),
                    Flexible(child: TextFormField(
                      validator: (text) {
                        if (text!.isEmpty) return "Введите ширину";
                        try {
                          width = int.parse(text);
                        } catch (e) {
                          return "Введите ширину";
                        }
                      },
                    ))
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text("Высота(мм):"),
                    Flexible(child: TextFormField(
                      validator: (textt) {
                        if (textt!.isEmpty) return "Введите высоту";
                        try {
                          height = int.parse(textt);
                        } catch (e) {
                          return "Введите высоту";
                        }
                      },
                    ))
                  ]),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            if (height is int && width is int) {
                              S = height * width;
                              value = "S=$height*$width = $S мм²";
                            }
                          }
                        });
                      },
                      child: Text("Вычислить", style: TextStyle(fontSize: 15))),
                  SizedBox(height: 19),
                  Text(
                    "$value",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )
                ])));
  }
}
