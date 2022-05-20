

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobhunt/pages/profile/model/request_server.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/logic.dart';

class TextInterview extends StatelessWidget {
  const TextInterview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextInterviewSf();
  }
}

class TextInterviewSf extends StatefulWidget {
  const TextInterviewSf({Key? key}) : super(key: key);

  @override
  _TextInterviewSfState createState() => _TextInterviewSfState();
}


class _TextInterviewSfState extends State<TextInterviewSf> {
  List<Item> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final _horizontalScrollController = ScrollController();

  // List<Map<String,dynamic>> jobType = [
  //   {"icon": Icons.work, "job":"Full Time - On-site - Day shift", "type":"work"},
  //   {"icon": Icons.stars, "job":"1- 3 years Experience", "type":"experience"},
  //   {"icon": "", "svg" : SvgPicture.asset("assets/icons/salary.svg", color: primaryColor2,), "job":"Salary negotiable", "type":"salery"},
  //   {"icon": Icons.location_on, "job":"Chennai,Bangalore " , "type":"location"},
  //   {"icon": Icons.groups, "job":"2 Candidates hiring " , "type":"hire"},
  //   {"icon": Icons.school, "job":"Any degree qualification" , "type":"qualification"},
  //   {"icon": Icons.domain, "job":"IT Services and IT Consulting" , "type":"companyType"},
  //   {"icon": Icons.psychology, "job":"JavaScript, Python, Dart" , "type":"skills"},
  //   {"icon": Icons.account_tree_outlined, "job":"Testing and Development" , "type":"department"},
  // ];


  @override
  void initState() {
    getData();
    super.initState();
  }
  late double screenWidth;
  var a;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    a = Responsive.gridSize(screenWidth);
    return Scaffold(
      body: SafeArea(
        child: BsCol(
          sizes: ColScreen(
            xs: Col.col_12,
            sm: Col.col_12,
            md: Col.col_12,
            lg: Col.col_12,
          ),

          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: screenHeight,
                  color: primaryPurple,
                ),
              ),
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.end,
                          spacing: 15,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                radius: 20,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                            ),
                            CircleAvatar(
                              radius: 25,
                            ),
                          ],
                        ),
                      ),
                      BsCol(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal:(a<3)?5: 40, vertical: (a<3)?5: 25),

                        sizes: ColScreen(
                          xs: Col.col_12,
                          sm: Col.col_12,
                          md: Col.col_12,
                          lg: Col.col_12,
                        ),

                        padding: EdgeInsets.all( (a<3)?10:30),
                        child: Column(

                          children: [
                            BsRow(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                BsCol(
                                    sizes:const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    child:
                                    RichText(text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: "Upcoming Interviews", style: TextStyle(color: primaryColor, fontSize: (a<3)? 20: 30, fontWeight: FontWeight.w600)),
                                          // TextSpan(text: " - Excecutive Assisant" , style: TextStyle(color: primaryColor2, fontSize: (a<3)? 16: 20, fontWeight: FontWeight.w400)),
                                        ]
                                    ))
                                  // Text("Schedule Interview - Excecutive Assistant", style: TextStyle(color: pbtnColor2, fontSize: 30),),
                                ),
                                BsCol(
                                  padding: EdgeInsets.only(right: 8.0),
                                  sizes: const ColScreen(
                                    xs: Col.col_12,
                                    sm: Col.col_12,
                                    md: Col.col_6,

                                  ),
                                  alignment: Alignment.centerRight,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'View your upcoming interviews to attend and initialize conducting an interview',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // Color(0xFF253269)),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' 7254 ',
                                          style:
                                          TextStyle(
                                            color: iconColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            BsCol(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: (a< 3)?8.0:15),
                                    child: Divider(color: textColor2,),
                                  ),
                                  // Wrap(
                                  //   alignment: WrapAlignment.center,
                                  //   spacing: (a<3)?10:20,
                                  //   // runSpacing: 10,
                                  //   children: List.generate( jobType.length, (index) {
                                  //     return InkWell(
                                  //       onTap: (){
                                  //         setState(() {
                                  //         });
                                  //       },
                                  //       // padding: EdgeInsets.all(0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //
                                  //         children: [
                                  //           (jobType[index]["icon"] == "")?jobType[index]["svg"] :
                                  //           Icon(jobType[index]["icon"], size: 18,color: primaryColor2,),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(left: 8.0),
                                  //             child: Text(jobType[index]["job"], style: TextStyle(color: textColor, fontWeight: FontWeight.w400, fontSize: 16),),
                                  //           )
                                  //         ],),);
                                  //   } ),
                                  // ),
                                  // Padding(
                                  //     padding: EdgeInsets.symmetric(vertical: 10),
                                  //     child: Divider(color: textColor2,)),

                                  Text("Showing 7 out of 14 candidates whose interview has been scheduled", style: TextStyle(color: textColor2, fontSize: 14, fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
                            Scrollbar(
                              trackVisibility: true,
                              controller: _horizontalScrollController,
                              thickness: 8.0,
                              hoverThickness: 12.0,

                              isAlwaysShown: true,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _horizontalScrollController,
                                child: Container(
                                  constraints: BoxConstraints(
                                    minWidth: (a < 3 )? screenWidth : screenWidth - 200
                                  ),
                                  child: DataTable(
                                    sortColumnIndex: _sortColumnIndex,
                                    sortAscending: _sortAscending,
                                    columnSpacing: 15,
                                    dividerThickness: 5,

                                    onSelectAll: (bool? isSelected) {
                                      if (isSelected != null) {
                                        _items.forEach((item) {
                                          item.isSelected = isSelected;
                                        });
                                        setState(() {});
                                      }
                                    },
                                    // decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 1)),
                                    dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.selected)
                                        ? Colors.blue
                                        : const Color.fromARGB(100, 215, 217, 219)
                                    ),
                                    dataRowHeight: 150,
                                    dataTextStyle:  TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                    headingRowHeight: 80,
                                    headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black,),
                                    horizontalMargin: 10,
                                    showBottomBorder: true,
                                    showCheckboxColumn: false,
                                    columns: _createColumns(),
                                    rows: _items.map((item) => _createRow(item))
                                        .toList(),

                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 30,),
                          ],
                        ),
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


  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }


  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label:  Text('Name', textAlign: TextAlign.center,),
        numeric: false,
        tooltip: 'Name of Candiate',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.name.compareTo(item2.name));
          } else {
            _items.sort((item1, item2) => item2.name.compareTo(item1.name));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },// Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label: const Align( alignment: Alignment.center,child:  Text('JOB POST')),
        numeric: false,
        // tooltip: 'Name of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.expectedCTC.compareTo(item2.expectedCTC));
          } else {
            _items.sort((item1, item2) => item2.expectedCTC.compareTo(item1.expectedCTC));
          }
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Interview Date & Time'),
        numeric: false,  // Deliberately set to false to avoid right alignment.
        tooltip: 'Notice period',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.noticePeriod.compareTo(item2.noticePeriod));
          } else {
            _items.sort((item1, item2) => item2.noticePeriod.compareTo(item1.noticePeriod));
          }
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      // DataColumn(
      //   label: const Text('COMMENT'),
      //   numeric: false,
      //   tooltip: 'Description of the item',
      //   onSort: (int columnIndex, bool ascending) {
      //     if (ascending) {
      //       _items.sort((item1, item2) => item1.matchPercentage.compareTo(item2.matchPercentage));
      //     } else {
      //       _items.sort((item1, item2) => item2.matchPercentage.compareTo(item1.matchPercentage));
      //     }
      //
      //     setState(() {
      //       _sortColumnIndex = columnIndex;
      //       _sortAscending = ascending;
      //     });
      //   },
      // ),
      const DataColumn(
        label: Text('Action', textAlign: TextAlign.center,),
        numeric: false,
        tooltip: 'Actions',
        // onSort: (int columnIndex, bool ascending) {
        //   if (ascending) {
        //     _items.sort((item1, item2) => item1.matchPercentage.compareTo(item2.matchPercentage));
        //   } else {
        //     _items.sort((item1, item2) => item2.matchPercentage.compareTo(item1.matchPercentage));
        //   }
        //
        //   setState(() {
        //     _sortColumnIndex = columnIndex;
        //     _sortAscending = ascending;
        //   });
        // },
      ),
    ];
  }

  DataRow _createRow(Item item) {
    return (
        DataRow(
          // index: item.id, // for DataRow.byIndex
          key: ValueKey(item.id),
          selected: item.isSelected,
          onSelectChanged: (bool? isSelected) {
            if (isSelected != null) {
              item.isSelected = isSelected;

              setState(() {});
            }
          },
          color: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.selected)
              ? Colors.white70
              : const Color.fromARGB(100, 215, 217, 219)
          ),

          cells: [
            DataCell(
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(item.img),
                      radius: 35,
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(item.name, style: TextStyle(color: textColor, fontWeight: FontWeight.w700, fontSize: 14),),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(color: otpFieldBorderColor),
                            children: [
                              WidgetSpan(child: Icon(Icons.stars, color: otpFieldBorderColor,size: 18,)),
                              const TextSpan(text: "  "),
                              TextSpan(text: item.experiance),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(color: otpFieldBorderColor, fontSize: 11),
                            children: [
                              WidgetSpan(child: Icon(Icons.psychology , color: otpFieldBorderColor,size: 18,)),
                              const TextSpan(text: "  "),
                              TextSpan(text: item.skills),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(color: otpFieldBorderColor,fontSize: 11),
                            children: [
                              WidgetSpan(child: Icon(Icons.work, color: otpFieldBorderColor,size: 18,)),
                              const TextSpan(text: "  "),
                              TextSpan(text: item.currentDesignation),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            DataCell(
              Text(item.expectedCTC),
              placeholder: false,
              // showEditIcon: true,
              // onTap: () {
              //   print('onTap');
              // },
            ),
            DataCell(
              // Text(item.price.toString())
                Text(item.noticePeriod)
            ),
            // DataCell(
            //   Text(item.matchPercentage),
            // ),
            DataCell(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.print, color: iconColor,)),
                          Text("View Previous Round Report", style: TextStyle(color: textColor2),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: iconColor,)),

                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        OutlinedButton(
                          onPressed: () {

                          },
                          child: Container(
                            constraints:
                            BoxConstraints(
                                // maxWidth: 200.0,
                                minHeight: 35),
                            alignment: Alignment.center,
                            child: const Text("View Candidate Details", style: TextStyle(fontSize: 11),),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2,
                              color: primaryColor,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10,),

                        MaterialButton(
                          onPressed: () {
                            textInterviewDialog();
                          },
                          textColor: Colors.white,

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: btnGradient,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              constraints:
                              BoxConstraints(
                                  // maxWidth: 150.0,

                                  minHeight: btnHeight1),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'Schedule Interview',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Karla"),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                )
            ),
          ],
        ));
  }



  Future<void> getData() async {


    var data = await HttpRequests()
        .requestsGet({"skillName": ""}, "", "/company/ats/shedule_interview.php", 5, 3);
    print(data);
    Map datamap=  json.decode(data);

    List abc = datamap['values'];
    setState(() {
      _items = generateItems(abc);
    });


  }

  // Widget listedData(Map map) {
  //   Map candata = map;
  //   return ListTile(
  //     leading: CircleAvatar(
  //       backgroundImage: NetworkImage(candata["ImagePath"]),
  //     ) ,
  //     title: Wrap(
  //     ),
  //   );
  // }

  List<Item> generateItems(List abc) {
    return List.generate(abc.length, (int index) {
      Map d = abc[index];
      return Item(id: int.parse(d["id"]),
          name: d["name"],
          skills: d["skills"],
          experiance: d["experiance"].toString(),
          img: d["ImagePath"],
          currentDesignation: d["currentDesignation"],
          currentCTC: d["currentCTC"].toString(),
          expectedCTC : d["expectedCTC"].toString(),
          noticePeriod :d["noticePeriod"],
          matchPercentage : d["matchPercentage"],
          isSelected: true);
    });
  }

  void textInterviewDialog() {
    AwesomeDialog(context: context,
      dialogType: DialogType.NO_HEADER,
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      width: (a < 3)? screenWidth: 650,
      // padding: EdgeInsets.all(15.0),
      isDense: true,
      padding: EdgeInsets.symmetric(horizontal: (a< 3)? 3: 50, vertical: 30),
      dialogBackgroundColor: forgotpwdOutercolor,
      body: Container( child: Text("Next Screens not Designed"),), // TextInterviewDialog1(context1: context)
    ).show();
  }
}




class Item {
  Item({
    required this.id,
    required this.name,
    required this.skills,
    required this.experiance,
    required this.img,
    required this.currentDesignation,
    required this.currentCTC,
    required this.expectedCTC,
    required this.noticePeriod,
    required this.matchPercentage,

    required this.isSelected,
  });

  int id;
  String name;
  String skills;
  String experiance;
  String img;
  String currentDesignation;
  String currentCTC;
  String expectedCTC;
  String noticePeriod;
  String matchPercentage;
  bool isSelected;
}




// class SheduleData extends  {
// }
//
// class SheduleData extends BsDatatableSource {
//
//   SheduleData({
//     List data = const [],
//   }) : super(data: data);
//
//   Function(dynamic, int) onEditListener = (value, index) {};
//   Function(dynamic, int) onDeleteListener = (value, index) {};
//
//   static List<BsDataColumn> get columns => <BsDataColumn>[
//     BsDataColumn(label: Text('No'), orderable: false, searchable: false, width: 100.0),
//     BsDataColumn(label: Text('Code'), columnName: 'typecd', width: 200.0),
//     BsDataColumn(label: Text('Name'), columnName: 'typenm'),
//     BsDataColumn(label: Text('Aksi'), orderable: false, searchable: false, width: 200.0),
//   ];
//
//   @override
//   BsDataRow getRow(int index) {
//     return BsDataRow(index: index, cells: <BsDataCell>[
//       BsDataCell(Text('${controller.start + index + 1}')),
//       BsDataCell(Text('${response.data[index]['typecd']}')),
//       BsDataCell(Text('${response.data[index]['typenm']}')),
//       BsDataCell(Row(
//         children: [
//           BsButton(
//             margin: EdgeInsets.only(right: 5.0),
//             onPressed: () => onEditListener(response.data[index]['typecd'], index),
//             prefixIcon: Icons.edit,
//             size: BsButtonSize.btnIconSm,
//             style: BsButtonStyle.primary,
//           ),
//           BsButton(
//             onPressed: () => onDeleteListener(response.data[index]['typecd'], index),
//             prefixIcon: Icons.delete,
//             size: BsButtonSize.btnIconSm,
//             style: BsButtonStyle.danger,
//           )
//         ],
//       ))
//     ]);
//   }
// }

