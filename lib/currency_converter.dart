import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String _fromCurrency = 'INR';
  String _toCurrency = 'USD';
  final TextEditingController _amountController = TextEditingController();
  final List<String> _currencies = ['INR', 'USD', 'EUR', 'GBP', 'JPY'];

  void _convertCurrency() {
    // Add conversion logic here
    // This example assumes a fixed conversion rate for demonstration purposes
    double amount = double.parse(_amountController.text);
    double convertedAmount;
    if (_fromCurrency == 'INR' && _toCurrency == 'USD') {
      convertedAmount = amount * 0.013;
    } else if (_fromCurrency == 'USD' && _toCurrency == 'INR') {
      convertedAmount = amount * 74.50;
    } else {
      convertedAmount = amount; // Default to 1:1 conversion for other currencies
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Converted Amount: $convertedAmount $_toCurrency',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
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
          'Currency Converter',
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/nets.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: _fromCurrency,
                    dropdownColor: Colors.purple,
                    onChanged: (String? newValue) {
                      setState(() {
                        _fromCurrency = newValue!;
                      });
                    },
                    items: _currencies.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _toCurrency,
                    dropdownColor: Colors.purple,
                    onChanged: (String? newValue) {
                      setState(() {
                        _toCurrency = newValue!;
                      });
                    },
                    items: _currencies.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _convertCurrency,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Background color
                    ),
                    child: Text('Convert', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
