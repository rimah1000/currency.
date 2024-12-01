import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();
  String _selectedCurrency = 'LBP';
  double _convertedAmount = 0;

  final Map<String, double> rates = {
    'LBP': 90000,
    '€': 0.90, // Replace with dynamic rates
    '₱': 56.00, // Replace with dynamic rates
  };

  void _convertCurrency() {
    setState(() {
      double amount = double.tryParse(_controller.text) ?? 0;
      _convertedAmount = amount * rates[_selectedCurrency]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter amount in USD'),
            ),
            DropdownButton<String>(
              value: _selectedCurrency,
              onChanged: (value) {
                setState(() {
                  _selectedCurrency = value!;
                });
              },
              items: rates.keys.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
            Text(
              'Converted Amount: $_convertedAmount $_selectedCurrency',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
