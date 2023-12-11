class MedicineModel {
  String? medicineName;
  bool? morning;
  bool? afternoon;
  bool? night;

  MedicineModel({
    this.medicineName,
    this.morning,
    this.afternoon,
    this.night,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      medicineName: json['medicineName'],
      morning: json['morning'],
      afternoon: json['afternoon'],
      night: json['night'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicineName': medicineName,
      'morning': morning,
      'afternoon': afternoon,
      'night': night,
    };
  }

  MedicineModel copyWith({
    String? medicineName,
    bool? morning,
    bool? afternoon,
    bool? night,
  }) {
    return MedicineModel(
      medicineName: medicineName ?? this.medicineName,
      morning: morning ?? this.morning,
      afternoon: afternoon ?? this.afternoon,
      night: night ?? this.night,
    );
  }

  @override
  String toString() {
    return 'MedicineModel(medicineName: $medicineName, morning: $morning, afternoon: $afternoon, night: $night)';
  }
}
