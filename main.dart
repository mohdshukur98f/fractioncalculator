import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String img = "assets/images/default.png";
  final TextEditingController _numberA = TextEditingController();
  final TextEditingController _numberB = TextEditingController();
  final TextEditingController _numberC = TextEditingController();
  final TextEditingController _numberD = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, d = 0.0;
  double resultA = 0.0, resultB = 0.0, resultC=0.0;

  String _resultA = "";
  String _resultB = "";
  String _resultC = "";
  String _dropdownList = 'Choose:';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Fraction Calculator'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(img, height: 100.0, fit: BoxFit.cover),
            Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 65, 0),
                  child: TextField(
                    controller: _numberA,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(65, 30, 40, 0),
                  child: TextField(
                    controller: _numberC,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 18, 0),
                  child: Text(
                    '--------------',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: DropdownButton<String>(
                    
                    value: _dropdownList,
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownList = newValue;
                      });
                    },
                    items: <String>["Choose:", "+", "-", "/", "x"]
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Text(
                      '--------------',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 65, 0),
                  child: TextField(
                    controller: _numberB,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(65, 0, 40, 0),
                  child: TextField(
                    controller: _numberD,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(160, 40, 150, 0),
              child: Text(
                '$_resultA',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                  child: Text(
                    'Total=',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '--------------   = $_resultC',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(160, 0, 150, 0),
              child: Text(
                '$_resultB',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _calculate),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _clear),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _calculate() {
    setState(() {
      a = double.parse(_numberA.text);
      b = double.parse(_numberB.text);
      c = double.parse(_numberC.text);
      d = double.parse(_numberD.text);

      if (_dropdownList == '+') {
        img = "assets/images/add.png";
        resultA = (a * d) + (b * c);
        resultB = (b * d);
        resultC = ((a * d) + (b * c))/(b * d);
        _resultA = format(resultA);
        _resultB = format(resultB);
        _resultC = format(resultC);
      }
      if (_dropdownList == '-') {
        img = "assets/images/minus.png";
        resultA = (a * d) - (b * c);
        resultB = (b * d);
        resultC = ((a * d) - (b * c))/(b * d);
        _resultA = format(resultA);
        _resultB = format(resultB);
        _resultC = format(resultC);
      }
      if (_dropdownList == 'x') {
        img = "assets/images/multiplication.png";
        resultA = a * c;
        resultB = b * d;
        resultC = (a * c)/( b * d);
        _resultA = format(resultA);
        _resultB = format(resultB);
        _resultC = format(resultC);
      }
      if (_dropdownList == '/') {
        img = "assets/images/division.png";
        resultA = a * d;
        resultB = b * c;
        resultC = (a * d)/( b * c);
        _resultA = format(resultA);
        _resultB = format(resultB);
        _resultC = format(resultC);
      }
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  void _clear() {
    _numberA.text = '';
    _numberB.text = '';
    _numberC.text = '';
    _numberD.text = '';
  }
}
