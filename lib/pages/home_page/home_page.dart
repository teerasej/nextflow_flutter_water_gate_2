import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nextflow Water Gate')),
      body: ListView(
        children: [
          ListTile(
            title: Text('คำนวน'),
            leading: Icon(Icons.calculate),
            onTap: () {
              Get.toNamed('/gate-calculator');
            },
          ),
        ],
      ),
    );
  }
}
