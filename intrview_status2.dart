
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhunt/company/pages/ats/offers/provisional_offers/release_offer_letter.dart';
import 'package:jobhunt/company/pages/ats/schedule_interview/shedule_inter_view_dialog1.dart';
import 'package:jobhunt/pages/profile/model/request_server.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InterViewStatus2 extends StatelessWidget {
  const InterViewStatus2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InterViewStatus2Sf();
  }
}

class InterViewStatus2Sf extends StatefulWidget {
  const InterViewStatus2Sf({Key? key}) : super(key: key);

  @override
  _InterViewStatus2SfState createState() => _InterViewStatus2SfState();
}


class _InterViewStatus2SfState extends State<InterViewStatus2Sf> {
  List<Item> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final ScrollController _dtableScrollController = ScrollController();
  List<Map<String,dynamic>> jobType = [
    {"icon": Icons.work, "job":"Full Time - On-site - Day shift", "type":"work"},
    {"icon": Icons.stars, "job":"1- 3 years Experience", "type":"experience"},
    {"icon": "", "svg" : SvgPicture.asset("assets/icons/salary.svg", color: primaryColor2,), "job":"Salary negotiable", "type":"salery"},
    {"icon": Icons.location_on, "job":"Chennai,Bangalore " , "type":"location"},
    {"icon": Icons.groups, "job":"2 Candidates hiring " , "type":"hire"},
    {"icon": Icons.school, "job":"Any degree qualification" , "type":"qualification"},
    {"icon": Icons.domain, "job":"IT Services and IT Consulting" , "type":"companyType"},
    {"icon": Icons.psychology, "job":"JavaScript, Python, Dart" , "type":"skills"},
    {"icon": Icons.account_tree_outlined, "job":"Testing and Development" , "type":"department"},
  ];


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
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            // fluid: BsFluid.sm,
            child: Column(
              children: [
                BsCol(
                  padding: EdgeInsets.symmetric(horizontal: (a<3)?10:30),
                  child: BsRow(
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
                          text: "Interview Status", style: TextStyle(color: primaryColor, fontSize: (a<3)? 20: 30, fontWeight: FontWeight.w700),
                          children: <TextSpan>[
                            TextSpan(text: " - Excecutive Assisant" , style: TextStyle(color: primaryColor2, fontSize: (a<3)? 16: 20, fontWeight: FontWeight.w400)),
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
                            text: 'Job ID : ',
                            style: const TextStyle(
                              color: pbtnColor2,
                              fontSize: 15,
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
                      BsCol(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: (a< 3)?8.0:15),
                              child: Divider(color: textColor2,),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: (a<3)?10:20,
                              // runSpacing: 10,
                              children: List.generate( jobType.length, (index) {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                    });
                                },
                                  // padding: EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      (jobType[index]["icon"] == "")?jobType[index]["svg"] :
                                      Icon(jobType[index]["icon"], size: 18,color: primaryColor2,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(jobType[index]["job"], style: TextStyle(color: textColor, fontWeight: FontWeight.w400, fontSize: 16),),
                                      )
                                ],),);
                              } ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(color: textColor2,)),
                          ],
                        ),
                      ),
                      BsCol(
                        sizes: const ColScreen(
                          xs: Col.col_12,
                          sm: Col.col_12,
                          md: Col.col_12,
                        ),

                        child:  Scrollbar(
                          hoverThickness: 8,
                          thickness: 5,
                          showTrackOnHover: true,
                          controller: _dtableScrollController,
                          child: SingleChildScrollView(
                            controller: _dtableScrollController,
                            scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            child: BsCol(
                              sizes: const ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_12,
                              ),
                              // constraints: BoxConstraints(
                              //   minWidth: screenWidth-300
                              // ),
                              // width: (screenWidth > 800)? screenWidth- 200: 800,
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
                                dataRowHeight: 130,
                                dataTextStyle:  TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                                headingRowColor: MaterialStateColor.resolveWith((states) => forgotpwdOutercolor),
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
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: SizedBox(
                        //     width: (a< 3)?200: 900,
                        //     child: ListView(
                        //       shrinkWrap: true,
                        //       // scrollDirection: Axis.horizontal,
                        //       // shrinkWrap: true,
                        //       children: [
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
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

        label: Expanded(child: Text('Name', textAlign: TextAlign.center,)),
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
        label: Expanded(child: Text('PANELIST', textAlign: TextAlign.center,)),
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
        label: Expanded(child: const Text('Status', textAlign: TextAlign.center,)),
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

      const DataColumn(
        label: Expanded(child: Text('Action', textAlign: TextAlign.center,)),
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

    var rounds = item.rounds;
    List<bool> roundsL = List.generate(4, (li) => (li < rounds)? true: false);

    // List roundsL = [false,false,false,false];

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
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(item.img),
                radius: 25,
              ),
              Padding(

                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(item.name, style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 20),),
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
                        style: TextStyle(color: otpFieldBorderColor),
                        children: [
                           WidgetSpan(child: Icon(Icons.psychology , color: otpFieldBorderColor,size: 18,)),
                         const TextSpan(text: "  "),
                          TextSpan(text: item.skills),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(color: otpFieldBorderColor,),
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

          // placeholder: false,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(item.img),
                radius: 23,
              ),
              const SizedBox(height: 5,),
              Text("Mrs.Emma Wesley", style: TextStyle(fontSize: 12, color: primaryColor2, fontWeight: FontWeight.w400),),
    Text("(ID - 542)" , style: TextStyle(fontSize: 12, color: primaryColor2, fontWeight: FontWeight.w400),),
            ],
          )
          // showEditIcon: true,
          // onTap: () {
          //   print('onTap');
          // },
        ),

        DataCell(

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 20,

                child: StepProgressIndicator(
                  totalSteps: 4,
                  currentStep: rounds,
                  size: 8,
                  padding: 0,
                  // selectedColor: Colors.yellow,
                  unselectedColor: Colors.black12,
                  roundedEdges: Radius.circular(10),
                  selectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryPurple, primaryColor2],
                  ),
                  // unselectedGradientColor: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [Colors.black, Colors.blue],
                  // ),

                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,

                    activeColor: primaryPurple,

                    value: roundsL[0], onChanged: (v){

                  }, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)), ),
                  ),
                  Text("Round 1 $rounds"),

                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,

                    activeColor: primaryPurple,

                    value: roundsL[1], onChanged: (v){

                  }, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)), ),
                  ),
                  Text("Round 2"),

                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,

                    activeColor: primaryPurple,

                    value: roundsL[2],
                    onChanged: (v){

                  }, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)), ),
                  ),
                  Text("Round 3"),

                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,

                    activeColor: primaryPurple,

                    value: roundsL[3],
                    onChanged: (v){

                  }, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)), ),
                  ),
                  Text("Offer"),
                ],
              ),
            ],
          )
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text("95% Match", style: TextStyle(color: green, fontSize: 14, fontWeight: FontWeight.w600),),
                    ),
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.print, color: iconColor,size: 20, semanticLabel: "testing",), label: Text("View Report", style: TextStyle(color: iconColor, fontSize: 12),),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero, visualDensity: VisualDensity.compact, ),

                    ),
                    // IconButton(onPressed: (){}, icon: Icon(Icons.print, color: iconColor,)),
                    SizedBox(
                      width: 30,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: iconColor,),),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if(rounds == 4){
                    interViewStatus2Dialog();
                  }

                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: btnGradient,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: Text(
                      (rounds==4)? 'Release Provisonal Offer' : 'Schedule Interview',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Karla"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
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
          isSelected: true,
        rounds: index+1,

      );
    });
  }

  void interViewStatus2Dialog() {
    AwesomeDialog(context: context,
        dialogType: DialogType.NO_HEADER,
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        width: (a < 3)? screenWidth: 820,
        // padding: EdgeInsets.all(15.0),
        isDense: true,
        padding: EdgeInsets.symmetric(horizontal: (a< 3)? 3: 20, vertical: 3),
        dialogBackgroundColor: forgotpwdOutercolor,
        body: ReleaseOfferLetter(context1: context)
    ).show();
    // ReleaseOfferLetter

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
    required this.rounds,
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
  int rounds;
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


