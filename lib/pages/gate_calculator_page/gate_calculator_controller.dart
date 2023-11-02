import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/server_data.dart';

class GateCalculatorController extends GetxController {
  var resultText = "".obs;

  var isLoading = false.obs;
  var connect = Get.put(GetConnect());

  var ttn_for = 0.0;
  var ttn_for_textCtrl = TextEditingController().obs;

  var lv_inp = 0.0;
  var lv_inp_textCtrl = TextEditingController().obs;

  var demand_irr = 0.0;
  var demand_irr_textCtrl = TextEditingController().obs;

  var snr_rrel = 0.0;
  var snr_rrel_textCtrl = TextEditingController().obs;

  var ttnsumrel = 0.0;
  var ttnsumrel_textCtrl = TextEditingController().obs;

  var dis_tol = 0.0;
  var dis_tol_textCtrl = TextEditingController().obs;

  var u1Value = 80.0.obs;
  var u2Value = 80.0.obs;
  var u3Value = 80.0.obs;
  var u4Value = 150.0.obs;
  var u5Value = 150.0.obs;

  void calculate() async {
    print('ttn_for: $ttn_for');
    print('lv_inp: $lv_inp');
    print('demand_irr: $demand_irr');
    print('snr_rrel: $snr_rrel');
    print('ttnsumrel: $ttnsumrel');
    print('dis_tol: $dis_tol');

    print('u1: $u1Value');
    print('u2: $u2Value');
    print('u3: $u3Value');
    print('u4: $u4Value');
    print('u5: $u5Value');

    resultText.value = "";

    var body = {
      "lv_inp": lv_inp,
      "ttn_for_inp": ttn_for,
      "demand_irr": demand_irr,
      "snr_rrel": snr_rrel,
      "ttnsumrel": ttnsumrel,
      "u1": true,
      "u2": true,
      "u3": true,
      "u4": true,
      "u5": true,
      "u1s": u1Value.value,
      "u2s": u2Value.value,
      "u3s": u3Value.value,
      "u4s": u4Value.value,
      "u5s": u5Value.value
    };

    print(body);

    var response = await connect.post(
      'https://waterlevelapi.azurewebsites.net/level-api.php',
      body,
      contentType: 'application/json',
    );

    if (response.status.hasError) {
      print('Error: ${response.statusText}');
    } else {
      print('Success: ${response.bodyString}');
    }

    resultText.value += response.body["output"].toString();
  }

  Future<void> loadServerData() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));

    var response = await connect.get(
        "https://nextflowxegatx2023.blob.core.windows.net/server/server-data.json");
    print(response.bodyString);
    var serverData = ServerData.fromMap(response.body);

    snr_rrel = serverData.snrRrel ?? 0;
    snr_rrel_textCtrl.value.text = snr_rrel.toString();

    ttn_for = serverData.ttnFor ?? 0;
    ttn_for_textCtrl.value.text = ttn_for.toString();

    ttnsumrel = serverData.ttnsumrel ?? 0.0;
    ttnsumrel_textCtrl.value.text = ttnsumrel.toString();

    lv_inp = ttn_for;
    lv_inp_textCtrl.value.text = lv_inp.toString();

    demand_irr = serverData.ttnDemandIrr ?? 0.0;
    demand_irr_textCtrl.value.text = demand_irr.toString();

    isLoading.value = false;
  }
}
