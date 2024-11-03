import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _result = '';
  String _description = '';

  void _calculateBMI() {
    final double heightCm = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    // Convert height from cm to meters
    final double height = heightCm / 100;

    if (height > 0 && weight > 0) {
      final double bmi = weight / (height * height);
      setState(() {
        _result = 'BMI: ${bmi.toStringAsFixed(2)}';
        _description = _getBMIDescription(bmi);
      });
    }
  }

  String _getBMIDescription(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight: Berat badan kurang. Disarankan untuk menambah asupan kalori sehat.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal: Berat badan ideal. Pertahankan gaya hidup sehat!';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight: Berat badan berlebih. Sebaiknya perhatikan pola makan dan aktivitas fisik.';
    } else {
      return 'Obese: Obesitas. Disarankan untuk berkonsultasi dengan profesional kesehatan.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: 'Tinggi (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: 'Berat (kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Hitung BMI',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  _result,
                  style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                ),
                SizedBox(height: 10),
                Text(
                  _description,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
