import 'package:flutter/material.dart';

class AreaVolumeCalculator extends StatefulWidget {
  @override
  _AreaVolumeCalculatorState createState() => _AreaVolumeCalculatorState();
}

class _AreaVolumeCalculatorState extends State<AreaVolumeCalculator> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  String _resultArea = '';
  String _resultVolume = '';

  void _calculateArea() {
    final double length = double.tryParse(_lengthController.text) ?? 0;
    final double width = double.tryParse(_widthController.text) ?? 0;

    if (length > 0 && width > 0) {
      final double area = length * width;
      setState(() {
        _resultArea = 'Luas: ${area.toStringAsFixed(2)} m²';
      });
    }
  }

  void _calculateVolume() {
    final double length = double.tryParse(_lengthController.text) ?? 0;
    final double width = double.tryParse(_widthController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;

    if (length > 0 && width > 0 && height > 0) {
      final double volume = length * width * height;
      setState(() {
        _resultVolume = 'Volume: ${volume.toStringAsFixed(2)} m³';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Luas & Volume'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _lengthController,
              decoration: InputDecoration(
                labelText: 'Panjang (m)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _widthController,
              decoration: InputDecoration(
                labelText: 'Lebar (m)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Tinggi (m)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text('Hitung Luas'),
            ),
            ElevatedButton(
              onPressed: _calculateVolume,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text('Hitung Volume'),
            ),
            SizedBox(height: 20),
            Text(
              _resultArea,
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            Text(
              _resultVolume,
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
