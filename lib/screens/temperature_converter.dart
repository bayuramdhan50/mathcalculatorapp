import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final _celsiusController = TextEditingController();
  String _result = '';

  void _convertTemperature() {
    final double celsius = double.tryParse(_celsiusController.text) ?? 0;
    final double fahrenheit = (celsius * 9 / 5) + 32;
    setState(() {
      _result = 'Fahrenheit: ${fahrenheit.toStringAsFixed(2)} °F';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              decoration: InputDecoration(
                labelText: 'Suhu (°C)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
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
