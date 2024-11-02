import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final _amountController = TextEditingController();
  String _result = '';

  void _convertCurrency() {
    final double amount = double.tryParse(_amountController.text) ?? 0;
    final double exchangeRate = 15000; // Contoh: 1 USD = 15000 IDR
    setState(() {
      _result = 'Hasil: ${amount * exchangeRate} IDR';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Jumlah (USD)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
