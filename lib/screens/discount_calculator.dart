import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final _originalPriceController = TextEditingController();
  final _discountController = TextEditingController();
  String _result = '';

  void _calculateDiscount() {
    final double originalPrice =
        double.tryParse(_originalPriceController.text) ?? 0;
    final double discount = double.tryParse(_discountController.text) ?? 0;

    if (originalPrice > 0 && discount > 0) {
      final double discountAmount = (discount / 100) * originalPrice;
      final double finalPrice = originalPrice - discountAmount;
      setState(() {
        _result = 'Harga setelah diskon: \$${finalPrice.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Diskon'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _originalPriceController,
              decoration: InputDecoration(
                labelText: 'Harga Awal (\$)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _discountController,
              decoration: InputDecoration(
                labelText: 'Diskon (%)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateDiscount,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text('Hitung Diskon'),
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
