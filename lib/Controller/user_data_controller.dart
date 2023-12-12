import 'package:flutter/material.dart';
import 'package:medica/helpers/user_helper.dart';
import 'package:medica/model/medicine_model.dart';
import 'package:medica/model/prescription_model.dart';

class UserDataController extends ChangeNotifier {
  UserHelper userHelper = UserHelper();
  // add loading sate (true by default)
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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

  // List<PrescriptionModel> prescriptions = [];

  // void addPrescription(String image) {
  //   try {
  //     PrescriptionModel newPrescription = PrescriptionModel(
  //         clinic: clinic,
  //         docName: dname,
  //         docSpeciality: djob,
  //         date: date,
  //         reasonForVisit: reasonforvisit,
  //         medicines: medicineList,
  //         imagePath: image);
  //     print(newPrescription);
  //     prescriptions.add(newPrescription);
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

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

  // 1. Initialize the list of Prescriptions
  List<PrescriptionModel> _prescriptions = [];
  List<PrescriptionModel> get prescriptions => _prescriptions;
  void setPrescriptions(List<PrescriptionModel> prescriptions) {
    _prescriptions = prescriptions;
    notifyListeners();
  }

  // 2. Create a getter to return the list of Prescriptions
  // 3. Create a method to fetch the list of Prescriptions from the database (only wrapper here, mmethod should be in the userhelper class)
  Future getPrescriptions() async {
    setLoading(true);

    UserHelper userHelper = UserHelper();
    List<PrescriptionModel> prescriptions = await userHelper.getPrescriptions();
    debugPrint('Prescriptions: ${prescriptions.length}');

    // for (var Prescription in Prescriptions) {
    //   debugPrint('Prescription: $Prescription');
    //   UserModel user = await userHelper.getUser(Prescription.uid!);

    //   debugPrint('user: $user');
    // }

    setPrescriptions(prescriptions);

    setLoading(false);
  }

  // 4. Create a method to add a new Prescription to the list of Prescriptions (only wrapper here, mmethod should be in the userhelper class)

  Future addPrescription(String image) async {
    try {
      PrescriptionModel newPrescription = PrescriptionModel(
          clinic: clinic,
          docName: dname,
          docSpeciality: djob,
          date: date,
          reasonForVisit: reasonforvisit,
          medicines: medicineList,
          imagePath: image);
      print(newPrescription);
      debugPrint('updateRecord: ${newPrescription.toString()}');
      await userHelper.addPrescription(newPrescription);
      //   prescriptions.add(newPrescription);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // 4.1 If Prescription is added to the database successfully, add it to the list of Prescriptions and notify listeners
  // this actively listens for changes in Prescriptions collection
  void listenToPrescriptions() {
    userHelper.listenToPrescriptions().listen((prescriptions) {
      debugPrint('Prescriptions: ${prescriptions.length}');
      setPrescriptions(prescriptions);
    });
  }
}
