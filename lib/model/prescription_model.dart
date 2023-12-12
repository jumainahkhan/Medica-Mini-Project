import 'medicine_model.dart';

class PrescriptionModel {
  String? prescriptionId;
  String? date;
  String? docName;
  String? clinic;
  String? docSpeciality;
  String? reasonForVisit;
  List<MedicineModel> medicines;
  String? imagePath;

  PrescriptionModel({
    this.prescriptionId,
    this.date,
    this.docName,
    this.clinic,
    this.docSpeciality,
    this.reasonForVisit,
    required this.medicines,
    this.imagePath,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      prescriptionId: json['presscriptionId'],
      date: json['date'],
      docName: json['docName'],
      clinic: json['clinic'],
      docSpeciality: json['docSpeciality'],
      reasonForVisit: json['reasonForVisit'],
      medicines: List<MedicineModel>.from(
        json['medicines'].map((x) => MedicineModel.fromJson(x)),
      ),
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prescriptionId': prescriptionId,
      'date': date,
      'docName': docName,
      'clinic': clinic,
      'docSpeciality': docSpeciality,
      'reasonForVisit': reasonForVisit,
      'medicines': List<dynamic>.from(medicines.map((x) => x.toJson())),
      'imagePath': imagePath,
    };
  }

  PrescriptionModel copyWith({
    String? prescriptionId,
    String? date,
    String? docName,
    String? clinic,
    String? docSpeciality,
    String? reasonForVisit,
    List<MedicineModel>? medicines,
    String? imagePath,
  }) {
    return PrescriptionModel(
      prescriptionId: prescriptionId ?? this.prescriptionId,
      date: date ?? this.date,
      docName: docName ?? this.docName,
      clinic: clinic ?? this.clinic,
      docSpeciality: docSpeciality ?? this.docSpeciality,
      reasonForVisit: reasonForVisit ?? this.reasonForVisit,
      medicines: medicines ?? this.medicines,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  String toString() {
    return 'PrescriptionModel(prescriptionId: $prescriptionId ,date: $date, docName: $docName, clinic: $clinic, docSpeciality: $docSpeciality, reasonForVisit: $reasonForVisit, medicines: $medicines, imagePath: $imagePath)';
  }
}
