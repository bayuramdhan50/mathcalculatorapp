import 'package:flutter/material.dart';
import 'currency_converter.dart';
import 'temperature_converter.dart';
import 'bmi_calculator.dart';
import 'discount_calculator.dart';
import 'area_volume_calculator.dart';
import '../widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          children: [
            MenuCard(
              title: 'Konversi Mata Uang',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyConverter()),
              ),
            ),
            MenuCard(
              title: 'Konversi Suhu',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TemperatureConverter()),
              ),
            ),
            MenuCard(
              title: 'BMI Calculator',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMICalculator()),
              ),
            ),
            MenuCard(
              title: 'Perhitungan Diskon',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiscountCalculator()),
              ),
            ),
            MenuCard(
              title: 'Perhitungan Luas & Volume',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AreaVolumeCalculator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
