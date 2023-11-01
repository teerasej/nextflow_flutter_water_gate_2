import 'package:flutter/material.dart';

class GateCalculatorPage extends StatelessWidget {
  const GateCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวนประตูน้ำ'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'จำลองระดับน้ำเหนือเขื่อน (m MSL)',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
