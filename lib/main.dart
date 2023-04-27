import 'package:flutter/material.dart';

void main() {
  runApp(MoneyConvApp());
}

class MoneyConvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyConv',
      home: MoneyConv(),
    );
  }
}

class MoneyConv extends StatefulWidget {
  @override
  _MoneyConvState createState() => _MoneyConvState();
}

class _MoneyConvState extends State<MoneyConv> {
  final _realController = TextEditingController();
  double _dollar = 5.05;
  double _euro = 5.60;
  String _result = '';

  void _clearAll() {
    _realController.text = '';
    setState(() {
      _result = '';
    });
  }

  void _convert() {
    double real = double.parse(_realController.text.replaceAll(',', '.'));
    setState(() {
      _result = 'R\$ ' +
          (real / _dollar).toStringAsFixed(2) +
          ' em dólar\n\nR\$ ' +
          (real / _euro).toStringAsFixed(2) +
          ' em euro';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoneyConv'),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _clearAll,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/money.png',
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: _realController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Real',
                labelStyle: TextStyle(color: Colors.green[900]),
                border: OutlineInputBorder(),
                prefixText: 'R\$ ',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: _convert,
              child: Text(
                'Converter',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[900],
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
