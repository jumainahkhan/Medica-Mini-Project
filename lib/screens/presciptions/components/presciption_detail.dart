import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class PrescriptionDetails extends StatefulWidget {
  const PrescriptionDetails({super.key});

  @override
  State<PrescriptionDetails> createState() => _PrescriptionDetailsState();
}

class _PrescriptionDetailsState extends State<PrescriptionDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/Images/My project.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Dr. John Smith',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Dermatologist',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Wellness Dermatology',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   'Rs. 100',
            //   style: GoogleFonts.poppins(
            //     color: Colors.black,
            //     fontSize: 30,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            const SizedBox(
              height: 2,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 10),
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: HexColor('#6d69f0'),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Acne Treatment',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '11-11-2022',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bandage,
                          size: 40,
                          color: HexColor('#6d69f0'),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Medicine Details',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    height: 270,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Paracetamol',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '0-0-1, BF, 5 days',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Cetrizine',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1-1-1, AF, 3 days',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Dolo 650',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1-0-1, AF, 3 days',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Ibuprofen',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1-0-1, AF, 3 days',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 1),
                        // const Text(
                        //   'Notes:',
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    )),
                const SizedBox(height: 20),
                Container(
                  height: 80,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.doc_text,
                          size: 40,
                          color: HexColor('#6d69f0'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Prescription',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(CupertinoIcons.eye),
                              Text(
                                'View',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(CupertinoIcons.down_arrow),
                              Text(
                                'Download',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
