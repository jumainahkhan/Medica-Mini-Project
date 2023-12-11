import 'medicine_model.dart';

class PrescriptionModel {
  String? date;
  String? docName;
  String? clinic;
  String? docSpeciality;
  String? reasonForVisit;
  List<MedicineModel> medicines;

  PrescriptionModel({
    this.date,
    this.docName,
    this.clinic,
    this.docSpeciality,
    this.reasonForVisit,
    required this.medicines,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      date: json['date'],
      docName: json['docName'],
      clinic: json['clinic'],
      docSpeciality: json['docSpeciality'],
      reasonForVisit: json['reasonForVisit'],
      medicines: List<MedicineModel>.from(
        json['medicines'].map((x) => MedicineModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'docName': docName,
      'clinic': clinic,
      'docSpeciality': docSpeciality,
      'reasonForVisit': reasonForVisit,
      'medicines': List<dynamic>.from(medicines.map((x) => x.toJson())),
    };
  }

  PrescriptionModel copyWith({
    String? date,
    String? docName,
    String? clinic,
    String? docSpeciality,
    String? reasonForVisit,
    List<MedicineModel>? medicines,
  }) {
    return PrescriptionModel(
      date: date ?? this.date,
      docName: docName ?? this.docName,
      clinic: clinic ?? this.clinic,
      docSpeciality: docSpeciality ?? this.docSpeciality,
      reasonForVisit: reasonForVisit ?? this.reasonForVisit,
      medicines: medicines ?? this.medicines,
    );
  }

  @override
  String toString() {
    return 'PrescriptionModel(date: $date, docName: $docName, clinic: $clinic, docSpeciality: $docSpeciality, reasonForVisit: $reasonForVisit, medicines: $medicines)';
  }
}
