import 'package:flutter/material.dart';
import 'package:medica/model/medicine_model.dart';
import 'package:medica/model/prescription_model.dart';

class UserDataController extends ChangeNotifier {
  String? medicineName;
  bool morning = false;
  bool afternoon = false;
  bool night = false;
  List<MedicineModel> _medicineList = [
    MedicineModel(
      medicineName: '',
      morning: false,
      afternoon: false,
      night: false,
    )
  ];
  List<MedicineModel> get medicineList => _medicineList;
  void setMedicineList(List<MedicineModel> medicineList) {
    _medicineList = medicineList;
    notifyListeners();
  }

  void updateMedicine(int index, MedicineModel medicineModel) {
    _medicineList[index] = medicineModel;
    notifyListeners();
  }

  void addMedicine(MedicineModel medicineModel) {
    _medicineList.add(medicineModel);
    notifyListeners();
  }

  void removeMedicine() {
    _medicineList.removeLast();
    notifyListeners();
  }

  List<PrescriptionModel> prescriptions = [];

  void addPrescription() {
    try {
      PrescriptionModel newPrescription = PrescriptionModel(
        clinic: clinic,
        docName: dname,
        docSpeciality: djob,
        date: date,
        reasonForVisit: reasonforvisit,
        medicines: medicineList,
      );
      print(newPrescription);
      prescriptions.add(newPrescription);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String? _clinic;
  String? get clinic => _clinic;
  void setClinic(String? clinic) {
    _clinic = clinic;
    notifyListeners();
  }

  String? _dname;
  String? get dname => _dname;
  void setDname(String? dname) {
    _dname = dname;
    notifyListeners();
  }

  String? _djob;
  String? get djob => _djob;
  void setDjob(String? djob) {
    _djob = djob;
    notifyListeners();
  }

  String? _date;
  String? get date => _date;
  void setDate(String? date) {
    _date = date;
    notifyListeners();
  }

  String? _reasonforvisit;
  String? get reasonforvisit => _reasonforvisit;
  void setReasonforvisit(String? reasonforvisit) {
    _reasonforvisit = reasonforvisit;
    notifyListeners();
  }

  void printAll() {
    print(_medicineList);
  }
}
