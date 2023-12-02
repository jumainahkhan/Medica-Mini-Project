import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LearnMoreBody extends StatefulWidget {
  const LearnMoreBody({super.key});

  @override
  State<LearnMoreBody> createState() => _LearnMoreBodyState();
}

class _LearnMoreBodyState extends State<LearnMoreBody> {
  List<Map<String, dynamic>> medicines = [
    {
      'name': 'Ibuprofen',
      'uses': 'Pain relief, fever reduction, inflammation reduction',
      'howItWorks':
          'Ibuprofen is a non-steroidal anti-inflammatory drug (NSAID). It works by blocking the release of certain chemical messengers that cause fever, pain and inflammation (redness and swelling).',
      'sideEffects':
          'Vomiting, Nausea, Dizziness, Abdominal pain, Constipation, Flatulence, Diarrhea, Dyspepsia, Headache, Fatigue, Rash',
    },
    {
      'name': 'Paracetamol',
      'uses': 'Pain relief, fever reduction, inflammation reduction',
      'howItWorks':
          'Paracetamol is a non-steroidal anti-inflammatory drug (NSAID). It works by blocking the release of certain chemical messengers that cause fever, pain and inflammation (redness and swelling).',
      'sideEffects':
          'Vomiting, Nausea, Dizziness, Abdominal pain, Constipation, Flatulence, Diarrhea, Dyspepsia, Headache, Fatigue, Rash',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#f0f2f0'),
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'About your medicines',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicines[index]['name'],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          medicines[index]['uses'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text('How It Works',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          medicines[index]['howItWorks'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text('Side effects',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          medicines[index]['sideEffects'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
