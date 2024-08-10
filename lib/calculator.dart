import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _operand = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _operand = "";
      _num1 = 0.0;
      _num2 = 0.0;
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);

      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == "*") {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == "/") {
        _output = (_num1 / _num2).toString();
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      _output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
            backgroundColor: color, // Background color of buttons
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            shadowColor: Colors.black54,
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Handle message button press
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle account button press
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),


          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.deepPurple, // Violet background color
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 36, horizontal: 14),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton("7", Colors.lightBlueAccent),
                    buildButton("8", Colors.lightBlueAccent),
                    buildButton("9", Colors.lightBlueAccent),
                    buildButton("/", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4", Colors.lightBlueAccent),
                    buildButton("5", Colors.lightBlueAccent),
                    buildButton("6", Colors.lightBlueAccent),
                    buildButton("*", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1", Colors.lightBlueAccent),
                    buildButton("2", Colors.lightBlueAccent),
                    buildButton("3", Colors.lightBlueAccent),
                    buildButton("-", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton(".", Colors.greenAccent),
                    buildButton("0", Colors.lightBlueAccent),
                    buildButton("00", Colors.greenAccent),
                    buildButton("+", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("C", Colors.redAccent),
                    buildButton("=", Colors.greenAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
