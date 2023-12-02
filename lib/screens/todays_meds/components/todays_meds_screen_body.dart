import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:table_calendar/table_calendar.dart';

class TodaysMedScreenBody extends StatefulWidget {
  const TodaysMedScreenBody({super.key});

  @override
  State<TodaysMedScreenBody> createState() => _TodaysMedScreenBodyState();
}

class _TodaysMedScreenBodyState extends State<TodaysMedScreenBody> {
  DateTime _focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();
  // DateTime? _rangeStart;
  // DateTime? _rangeEnd;
  @override
  void initState() {
    // TODO: implement initState
    selectedEvents = ValueNotifier(getEvents(_focusedDay));
    super.initState();
  }

  List<Map<String, dynamic>> allEvents = [
    {'name': 'Ibuprofen', 'date': '2022-12-10', 'timing': '1-0-1'},
    {'name': 'Paracetamol', 'date': '2022-12-10', 'timing': '1-1-1'},
    {'name': 'Minoxidil', 'date': '2022-12-10', 'timing': '1-0-0'},
    {'name': 'Minoxidil', 'date': '2022-12-09', 'timing': '0-0-1'},
    {'name': 'Paracetamol', 'date': '2022-12-09', 'timing': '1-0-1'},
    {'name': 'Anadol', 'date': '2022-12-08', 'timing': '1-0-1'},
    {'name': 'Tretinoin', 'date': '2022-12-08', 'timing': '1-1-1'},
    {'name': 'Cough Syrup', 'date': '2022-12-08', 'timing': '1-0-1'},
    {'name': 'Paracetamol', 'date': '2022-12-08', 'timing': '1-0-1'},
    {'name': 'Minoxidil', 'date': '2022-12-04', 'timing': '1-0-1'},
    {'name': 'Paracetamol', 'date': '2022-12-04', 'timing': '1-0-1'},
    {'name': 'Anadol', 'date': '2022-12-04', 'timing': '1-0-1'},
    {'name': 'Tretinoin', 'date': '2022-12-04', 'timing': '1-0-1'},
  ];
  ValueNotifier<List<Map<String, dynamic>>> selectedEvents = ValueNotifier([
    {'name': 'Ibuprofen'},
    {'name': 'Paracetamol'}
  ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildAppBar(context),
        buildHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: TableCalendar(
            onDaySelected: onDaySelected,
            headerVisible: false,
            selectedDayPredicate: (day) {
              return isSameDay(_focusedDay, day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: HexColor('#6d69f0'),
                shape: BoxShape.circle,
              ),
              selectedTextStyle: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              outsideDaysVisible: false,
              outsideTextStyle: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
              weekendTextStyle: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
              defaultTextStyle: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
            ),
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            // focusedDay: selectedDay!.subtract(Duration(days: 1)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: selectedEvents,
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          value[index]['name'],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: HexColor('#6d69f0'),
                          ),
                        ),
                        subtitle: Text(value[index]['timing'].toString()),
                      )),
                );
              },
            );
          },
        ))
      ],
    );
  }

  void onDaySelected(DateTime newSelectedDay, DateTime focusedDay) {
    selectedEvents = ValueNotifier(getEvents(newSelectedDay));
    setState(() {
      _focusedDay = newSelectedDay;
      selectedDay = newSelectedDay;
      debugPrint(selectedDay.toString());
      //_selectedDay = selectedDay;

      // rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
  }

  List<Map<String, dynamic>> getEvents(DateTime newSelectedDay) {
    List<Map<String, dynamic>> events = [];
    for (var element in allEvents) {
      if (element['date'] == newSelectedDay.toString().substring(0, 10)) {
        events.add(element);
      }
    }

    return events;
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Daily Meds",
            style: GoogleFonts.lato(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: HexColor('#6d69f0'),
            ),
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: 35,
            color: HexColor('#6d69f0'),
          )
        ],
      ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: HeroIcon(
              HeroIcons.arrowLeft,
              color: HexColor('#6d69f0'),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: HexColor('#6d69f0'),
            ),
          ),

          //Container()
        ],
      ),
    );
  }
}
