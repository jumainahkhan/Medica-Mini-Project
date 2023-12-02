// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'package:medica/Controller/med_log_controller.dart';

// ignore: must_be_immutable
class MedDetail extends StatelessWidget {
  final String? medName;
  bool morning = false;
  bool afternoon = false;
  bool night = false;

  MedDetail({super.key, this.medName});

  @override
  Widget build(BuildContext context) {
    return Consumer<MedLogController>(
        builder: (context, medLogController, child) {
      return Column(
        children: [
          header(),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: medLogController.medCount,
            itemBuilder: (context, index) {
              return SizedBox(
                key: UniqueKey(),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter some text';
                            //   }
                            //   return null;
                            // },
                            onChanged: (value) {
                              //  medLogController.setName(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Medicine Name',
                              hintStyle: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.medication_liquid_outlined,
                                color: HexColor('#6d69f0'),
                              ),
                            ),
                          )),
                          Checkbox(
                            value: morning,
                            onChanged: (value) {
                              morning = value!;
                              medLogController.setMorning(value);
                            },
                          ),
                          Checkbox(
                            value: afternoon,
                            onChanged: (value) {
                              afternoon = value!;
                              medLogController.setAfternoon(value);
                            },
                          ),
                          Checkbox(
                            value: night,
                            onChanged: (value) {
                              night = value!;
                              medLogController.setNight(value);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Divider(
                      //   color: Colors.black38,
                      //   height: 2,
                      //   thickness: 1,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    medLogController.incrementMedCount();
                  },
                  child: const Icon(Icons.add)),
              const SizedBox(
                width: 10,
              ),
              Text(
                medLogController.medCount.toString(),
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: HexColor('#6d69f0'),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    medLogController.decrementMedCount();
                  },
                  child: const Icon(Icons.remove))
            ],
          )
        ],
      );
    });
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Medicine Details",
          style: GoogleFonts.lato(
            fontSize: 18,
            color: HexColor('#6d69f0'),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Row(
          children: [
            Text("M"),
            SizedBox(
              width: 40,
            ),
            Text("A"),
            SizedBox(
              width: 40,
            ),
            Text("N"),
            SizedBox(
              width: 30,
            ),
          ],
        )
      ],
    );
  }
}
