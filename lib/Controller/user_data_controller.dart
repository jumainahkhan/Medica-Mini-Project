import 'package:flutter/material.dart';

class UserDataController extends ChangeNotifier {
  String? medicineName;
  bool morning = false;
  bool afternoon = false;
  bool night = false;
  List<Map<String, dynamic>> prescriptions = [
    {
      'clinic': 'XYZ Clinic',
      'dname': 'Dr. John Smith',
      'djob': 'Dermatologist',
      'date': '12/12/2020',
      'reasonforvisit': 'Skin Rash ',
      'medicines': [
        {
          'name': 'Medicine1',
          'morning': 'yes',
          'afternoon': 'no',
          'night': 'yes'
        }
      ],
    },
    {
      'clinic': 'Wellness Clinic',
      'dname': 'Dr. Rita Lancaster',
      'djob': 'Orthopaedic Surgeon',
      'date': '12/12/2020',
      'reasonforvisit': 'Fracture',
      'medicines': [
        {
          'name': 'Medicine2',
          'morning': 'yes',
          'afternoon': 'no',
          'night': 'yes'
        }
      ],
    },
    {
      'clinic': 'Medsy Clinic',
      'dname': 'Dr. Piya Mitra',
      'djob': 'Gynaecologist',
      'date': '12/12/2020',
      'reasonforvisit': 'Ultrasound',
      'medicines': [
        {
          'name': 'Medicine3',
          'morning': 'yes',
          'afternoon': 'no',
          'night': 'no'
        }
      ],
    },
    {
      'clinic': 'Medal Clinic',
      'dname': 'Dr. Sanjay Malhotra',
      'djob': 'Physician',
      'date': '12/12/2020',
      'reasonforvisit': 'Fever ',
      'medicines': []
    },
  ];

  void addPrescription() {
    try {
      setDjob("Dermatologist");
      Map<String, dynamic> newPrescription = {
        'clinic': clinic,
        'dname': dname,
        'djob': djob,
        'date': date,
        'reasonforvisit': reasonforvisit,
        'medicines': medicine
      };
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

  final Map<String, dynamic> _medicine = {};
  Map<String, dynamic> get medicine => _medicine;
  void setMedicine(Map<String, dynamic> medicine) {
    print(medicine);
    print(medicine.entries);
    medicine.addEntries(medicine.entries);
    notifyListeners();
  }
}
