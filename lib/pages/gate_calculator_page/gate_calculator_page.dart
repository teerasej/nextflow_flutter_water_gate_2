import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gate_calculator_controller.dart';

class GateCalculatorPage extends StatelessWidget {
  GateCalculatorPage({super.key});

  var controller = Get.put(GateCalculatorController());

  @override
  Widget build(BuildContext context) {
    controller.loadServerData();

    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวนประตูน้ำ'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'จำลองระดับน้ำเหนือเขื่อน (m MSL)',
                  ),
                  controller: controller.ttn_for_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.ttn_for = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ระดับน้ำที่ต้องการยกระดับ (m MSL)',
                  ),
                  controller: controller.lv_inp_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.lv_inp = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'แผนระบายน้ำ (m MSL)',
                  ),
                  controller: controller.demand_irr_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.demand_irr = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Total Sum SNR Release (MCM)',
                  ),
                  controller: controller.snr_rrel_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.snr_rrel = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Total Sum TTN Release (MCM)',
                  ),
                  controller: controller.ttnsumrel_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.ttnsumrel = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ปั้มสูบกลับ (m MSL)',
                  ),
                  controller: controller.dis_tol_textCtrl.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.dis_tol = double.parse(value);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: controller.u1Enabled.value,
                      onChanged: (bool? value) {
                        controller.u1Enabled.value = value!;
                      },
                    ),
                    Text('Unit 1 (${controller.u1Value.value})'),
                  ],
                ),
                Slider(
                  value: controller.u1Value.value,
                  min: 80,
                  max: 120,
                  divisions: 4,
                  label: controller.u1Value.value.toString(),
                  onChanged: controller.u1Enabled.value
                      ? (double value) {
                          controller.u1Value.value = value;
                        }
                      : null,
                ),
                Text('Unit 2 (${controller.u2Value.value})'),
                Slider(
                  value: controller.u2Value.value,
                  min: 80,
                  max: 120,
                  divisions: 4,
                  label: controller.u2Value.value.toString(),
                  onChanged: (double value) {
                    controller.u2Value.value = value;
                  },
                ),
                Text('Unit 3 (${controller.u3Value.value})'),
                Slider(
                  value: controller.u3Value.value,
                  min: 80,
                  max: 120,
                  divisions: 4,
                  label: controller.u3Value.value.toString(),
                  onChanged: (double value) {
                    controller.u3Value.value = value;
                  },
                ),
                Text('Unit 4 (${controller.u4Value.value})'),
                Slider(
                  value: controller.u4Value.value,
                  min: 150,
                  max: 180,
                  divisions: 3,
                  label: controller.u4Value.value.toString(),
                  onChanged: (double value) {
                    controller.u4Value.value = value;
                  },
                ),
                Text('Unit 5 (${controller.u5Value.value})'),
                Slider(
                  value: controller.u5Value.value,
                  min: 150,
                  max: 180,
                  divisions: 3,
                  label: controller.u5Value.value.toString(),
                  onChanged: (double value) {
                    controller.u5Value.value = value;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.calculate();
                    },
                    child: const Text('คำนวน'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(controller.resultText.value),
              ],
            ),
          ),
        );
      }),
    );
  }
}
