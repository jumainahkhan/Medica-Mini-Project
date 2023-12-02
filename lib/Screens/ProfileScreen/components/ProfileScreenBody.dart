import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  final image = Image.asset('assets/Images/My project.png');
  List<Map<String, dynamic>> data = [
    {
      'tool': 'Password',
      'icon': CupertinoIcons.lock,
    },
    {
      'tool': 'Email Address',
      'icon': CupertinoIcons.envelope,
    },
    {
      'tool': 'Fingerprint',
      'icon': CupertinoIcons.barcode_viewfinder,
    },
    {
      'tool': 'Support',
      'icon': Icons.phone_in_talk,
    },
    {
      'tool': 'Sign Out',
      'icon': Icons.logout,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor('#6d69f0'),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor('#8480f2'),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'Edit Profile',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: image,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ranveer Bhatia',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'ID: 123456789',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  children: [
                    Container(
                      height: 68,
                      width: 355,
                      decoration: BoxDecoration(
                        color: HexColor('#e5e3f9'),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: HexColor('#c9c7f9'),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  data[index]['icon'],
                                  color: HexColor('#8480f2'),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                data[index]['tool'],
                                style: GoogleFonts.poppins(
                                  color: HexColor('#8480f2'),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: HexColor('#8480f2'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // child: ListTile(
                //   contentPadding: EdgeInsets.all(7),
                //   tileColor: HexColor('#e5e3f9'),
                //   title: Text(
                //     data[index]['tool'],
                //   ),
                //   leading: Container(
                //     height: 10.h,
                //     width: 10.h,
                //     decoration: BoxDecoration(
                //       color: HexColor('#c9c7f9'),
                //       borderRadius: BorderRadius.circular(100),
                //     ),
                //     child: Icon(
                //       data[index]['icon'],
                //       color: HexColor('#8480f2'),
                //     ),
                //   ),
                // ),
                onTap: () {},
              );
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}
