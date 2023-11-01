import 'dart:convert';

class ServerData {
  double? snrRfore;
  double? snrRtail;
  double? snrRhead;
  double? snrRrel;
  double? sumsnrrel;
  double? sumsnrpump;
  double? ttnFor;
  double? ttnStor;
  double? ttnRel;
  double? ttnsumrel;
  double? ttnDemandIrr;

  ServerData({
    this.snrRfore,
    this.snrRtail,
    this.snrRhead,
    this.snrRrel,
    this.sumsnrrel,
    this.sumsnrpump,
    this.ttnFor,
    this.ttnStor,
    this.ttnRel,
    this.ttnsumrel,
    this.ttnDemandIrr,
  });

  factory ServerData.fromMap(Map<String, dynamic> data) => ServerData(
        snrRfore: (data['snr_rfore'] as num?)?.toDouble(),
        snrRtail: (data['snr_rtail'] as num?)?.toDouble(),
        snrRhead: (data['snr_rhead'] as num?)?.toDouble(),
        snrRrel: (data['snr_rrel'] as num?)?.toDouble(),
        sumsnrrel: (data['sumsnrrel'] as num?)?.toDouble(),
        sumsnrpump: data['sumsnrpump'] as double?,
        ttnFor: (data['ttn_for'] as num?)?.toDouble(),
        ttnStor: (data['ttn_stor'] as num?)?.toDouble(),
        ttnRel: data['ttn_rel'] as double?,
        ttnsumrel: data['ttnsumrel'] as double?,
        ttnDemandIrr: data['ttn_demand_irr'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'snr_rfore': snrRfore,
        'snr_rtail': snrRtail,
        'snr_rhead': snrRhead,
        'snr_rrel': snrRrel,
        'sumsnrrel': sumsnrrel,
        'sumsnrpump': sumsnrpump,
        'ttn_for': ttnFor,
        'ttn_stor': ttnStor,
        'ttn_rel': ttnRel,
        'ttnsumrel': ttnsumrel,
        'ttn_demand_irr': ttnDemandIrr,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServerData].
  factory ServerData.fromJson(String data) {
    return ServerData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServerData] to a JSON string.
  String toJson() => json.encode(toMap());
}
