import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class Habit extends StatefulWidget {
  const Habit({super.key});

  @override
  State<Habit> createState() => _HabitState();
}

class _HabitState extends State<Habit> {
  DateTime selsectdate = DateTime.now();

  // List days = ['All', 'Morning', 'Afternoon', 'Evening'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {},
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_today_outlined),
                      label: 'Today'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.system_update_tv_outlined),
                      label: 'JOURNY'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.analytics_outlined), label: 'HISTORY'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'ME'),
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        body: Container(
          color: CupertinoColors.black,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text('Today\nMay 10',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.white),
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          CircleBorder(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Card(
                  color: Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        child: WeeklyDatePicker(
                          enableWeeknumberText: false,
                          weeknumberColor: Color(0xFF57AF87),
                          weeknumberTextColor: Colors.white,
                          backgroundColor: Color(0xFF1A1A1A),
                          weekdayTextColor: Color(0xFF8A8A8A),
                          digitsColor: Colors.white,
                          selectedDigitBackgroundColor: Color(0xFF57AF87),
                          weekdays: [
                            'SUN',
                            'MON',
                            'TUE',
                            'WED',
                            'THU',
                            'FRI',
                            'SAT'
                          ],
                          daysInWeek: 7,
                          selectedDay: selsectdate,
                          changeDay: (p0) {
                            setState(() {
                              selsectdate = p0;
                            });
                          },
                        ),
                        color: Colors.black,
                        margin: EdgeInsets.all(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionChip(
                            label: Text('All'),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: Colors.blue,
                            onPressed: () {},
                          ),
                          ActionChip(
                            avatar: Icon(CupertinoIcons.cloud_sun,
                                color: Colors.white),
                            label: Text('Morning'),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: Colors.black38,
                            onPressed: () {},
                          ),
                          ActionChip(
                            avatar: Icon(
                              Icons.sunny,
                              color: Colors.white,
                            ),
                            label: Text('Afternoon'),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: Colors.black38,
                            onPressed: () {},
                          ),
                          ActionChip(
                            avatar: Icon(Icons.nightlight_outlined,
                                color: Colors.white),
                            label: Text(
                              'Night',
                            ),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: Colors.black38,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Text(
                              'ANYTIME',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: CupertinoColors.white)),
                            margin: EdgeInsets.all(15),
                            height: 30,
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              height: 90,
                              margin: EdgeInsets.all(15),
                              child: Center(
                                child: ListTile(
                                  trailing:
                                      Icon(Icons.menu, color: Colors.white),
                                  leading: Icon(Icons.directions_run,
                                      color: Colors.white),
                                  title: Text('MY FIRST HABIT',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('CREATE A NEW HABIT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ChipList(
//   listOfChipNames: [
//     'All',
//     'Morning',
//     'Afternoon',
//     'Evening'
//   ],
//   listOfChipIndicesCurrentlySeclected: [0],
//   activeBgColorList: [Colors.green],
//   inactiveBgColorList: [Color(0xFF1A1A1A)],
// )
// return Scaffold(
//   bottomNavigationBar: BottomNavigationBar(
//       unselectedLabelStyle: TextStyle(color: Colors.greenAccent),
//       unselectedItemColor: Colors.black,
//       selectedItemColor: Colors.blue,
//       items: [
//         BottomNavigationBarItem(
//           icon: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
//           label: 'Today',
//         ),
//         BottomNavigationBarItem(
//             icon: IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
//             label: 'Journy'),
//         BottomNavigationBarItem(
//             icon: IconButton(onPressed: () {}, icon: Icon(Icons.bar_chart)),
//             label: 'History'),
//         BottomNavigationBarItem(
//             icon: IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.account_circle_outlined)),
//             label: 'Me')
//       ]),
//   body: Container(
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Today\nMay 10"),
//             ),
//             Container(
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle, color: Colors.blue),
//                 child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     )))
//           ],
//         ),
//         WeeklyDatePicker(
//           enableWeeknumberText: false,
//           weeknumberColor: Color(0xFF57AF87),
//           weeknumberTextColor: Colors.white,
//           backgroundColor: Color(0xFF1A1A1A),
//           weekdayTextColor: Color(0xFF8A8A8A),
//           digitsColor: Colors.white,
//           selectedDigitBackgroundColor: Color(0xFF57AF87),
//           weekdays: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
//           daysInWeek: 7,
//           selectedDay: selsectdate,
//           changeDay: (p0) {
//             setState(() {
//               selsectdate = p0;
//             });
//           },
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Center(child: Text('All')),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(CupertinoIcons.cloud_sun),
//                     Text("Morning")
//                   ]),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(CupertinoIcons.sun_min),
//                     Text("AFTERNOON")
//                   ]),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [Icon(CupertinoIcons.moon), Text("EVENING")]),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black)),
//             ),
//             Container(
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                         flex: 2,
//                         child: Icon(
//                           Icons.directions_run,
//                           color: Colors.white,
//                         )),
//                     Expanded(
//                         flex: 3,
//                         child: Text(
//                           'My first Habit',
//                           style: TextStyle(color: Colors.white),
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                         )),
//                   ]),
//               margin: EdgeInsets.all(10),
//               width: 300,
//               height: 100,
//               decoration: BoxDecoration(
//                   color: Colors.blue,
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20)),
//             )
//           ],
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child:
//                 Text('CREATE A NEW HABIT', style: TextStyle(fontSize: 20)),
//           ),
//         ),
//       ],
//     ),
//   ),
// );
