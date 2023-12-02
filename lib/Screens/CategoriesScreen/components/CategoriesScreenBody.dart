import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/Screens/CategoriesScreen/components/PrescriptionDetail.dart';

import 'dart:math';

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({super.key});

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  final image = Image.asset('assets/Images/My project.png');
  List<Map<String, dynamic>> colors = [
    {
      'primary': HexColor('#abdac8'),
      'secondary': HexColor('#d4ebe3'),
    },
    {
      'primary': HexColor('#fb6e5d'),
      'secondary': HexColor('#fcd1cb'),
    },
    {
      //Default purple color HexCodes
      // 'primary': HexColor('#293b61'),
      'primary': HexColor('#6d69f0'),
      'secondary': HexColor('#e5e3f9'),
    },
    {
      'primary': HexColor('#fb991e'),
      'secondary': HexColor('#fde9d0'),
    }
  ];
  List<Map<String, dynamic>> prescriptions = [
    {
      'clinic': 'Wellness Dermatology',
      'dname': 'Dr. John Smith',
      'djob': 'Dermatologist',
      'date': '11/11/2022',
      'reasonforvisit': 'Acne treatment ',
    },
    {
      'clinic': 'Health Clinic',
      'dname': 'Dr. Rita Lancaster',
      'djob': 'Orthopaedic Surgeon',
      'date': '12/12/2020',
      'reasonforvisit': 'Fracture',
    },
    {
      'clinic': 'Medsy Clinic',
      'dname': 'Dr. Piya Mitra',
      'djob': 'Gynaecologist',
      'date': '10/01/2021',
      'reasonforvisit': 'Ultrasound',
    },
    {
      'clinic': 'Medal Clinic',
      'dname': 'Dr. Sanjay Malhotra',
      'djob': 'Physician',
      'date': '09/12/2022',
      'reasonforvisit': 'Fever ',
    },
  ];
  int randInt() {
    final random = Random();

    int next(int min, int max) => min + random.nextInt(max - min);
    return next(0, 4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#f0f2f0'),
        appBar: AppBar(
          title: Text(
            'Prescriptions',
            style: GoogleFonts.poppins(
              color: HexColor('#6d69f0'),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: HexColor('#f0f2f0'),
          shadowColor: HexColor('#f0f2f0'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    randInt();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrescriptionDetails()));
                  },
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: GestureDetector(
                        child: Row(
                      children: [
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: colors[2]['primary'],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[2]['secondary'],
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 13.0),
                                          child: Text(
                                            prescriptions[index]
                                                ['reasonforvisit'],
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                  Text(
                                    prescriptions[index]['date'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      foregroundImage: image.image,
                                    ),
                                    title: Text(
                                      prescriptions[index]['dname'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          prescriptions[index]['djob'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          prescriptions[index]['clinic'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              );
            },
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}
