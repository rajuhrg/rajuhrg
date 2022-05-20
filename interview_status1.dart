import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobhunt/company/pages/ats/interview_status/intrview_status2.dart';
import 'package:jobhunt/pages/job/searchjob/show_dialog_datasf.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/logic.dart';

class InterViewStatus1 extends StatelessWidget {
  const InterViewStatus1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InterViewStatus1SF();
  }
}

class InterViewStatus1SF extends StatefulWidget {
  const InterViewStatus1SF({Key? key}) : super(key: key);

  @override
  _InterViewStatus1SFState createState() => _InterViewStatus1SFState();
}

class _InterViewStatus1SFState extends State<InterViewStatus1SF> {
  final SizedBox _8pxheight = const SizedBox(
    height: 8,
  );
  var a;
  var screenWidth;

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
            child: BsCol(
              margin: EdgeInsets.all((a<3)?3:20),
              color: Colors.white,
              child: Column(
                children: [
                  BsRow(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: Alignment.topLeft,
                    children: [
                      BsCol(
                        sizes: const ColScreen(
                          xs: Col.col_12,
                          sm: Col.col_12,
                          md: Col.col_10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            RichText(
                              text: TextSpan(
                                text: "Interview Status", style: TextStyle(color: primaryColor, fontSize: (a<3)?20:30, fontWeight: FontWeight.w700, ),
                                // children: <TextSpan>[
                                //   // TextSpan(
                                //   //   text: " Showing 3 out of 3 jobs posted by you", style: TextStyle(color: iconColor, fontSize:(a<3)?16:20, fontWeight: FontWeight.w500),
                                //   //
                                //   // ),
                                // ],
                              ),
                            ),
                            Text("Showing 3 out of 3 jobs posted by you", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: iconColor),)


                          ],
                        ),
                      ),
                      BsCol(
                        alignment: Alignment.centerRight,
                        sizes: const ColScreen(
                          xs: Col.col_12,
                          sm: Col.col_12,
                          md: Col.col_2,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset("assets/icons/blocksIcon.svg"),
                              ),
                              MaterialButton(
                                splashColor: primaryColor.withOpacity(0.5),
                                // onTap: (){},
                                onPressed: () {  },
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Block View", style: TextStyle(color: iconColor, fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.4),),
                                    Icon(Icons.arrow_drop_down, color: iconColor,)
                                  ],
                                ),
                              )

                              // Text("Block View")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: (a<3)?15: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: textColor2,
                  ),
                  BsCol(
                    // padding:  EdgeInsets.symmetric(horizontal: (a < 3)?8: 50),
                    child: BsRow(
                      alignment: Alignment.center,
                      gutter: EdgeInsets.symmetric(
                          vertical: (a < 3) ? 5 : 5.0,
                          horizontal: (a < 3) ? 5 : 12.0),
                      children: List<BsCol>.generate(10, (ji) {
                        return BsCol(
                            sizes: const ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_11,
                                md: Col.col_4,
                                lg: Col.col_4,
                                xl: Col.col_3,
                                xxl: Col.col_3),
                            padding: const EdgeInsets.all(2),
                            //     left: 10.0, right: 10, top: 10, bottom: 10),
                            child: buildJobCard(ji));
                      }).toList(),
                    ),
                  ),
                   SizedBox(
                    height: (a<3)?10 :  15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int glob1 = 0;
  Widget buildJobCard(int ji) {
    print("intsss intervieStatus 1 $ji");
    Color bbcolor = c_EFE725;
    glob1 = (glob1 == 3) ? 0 : glob1;
    if (glob1 == 0) {
      bbcolor = c_1E3FEA;
    } else if (glob1 == 1) {
      bbcolor = c_EFE725;
    } else {
      bbcolor = c_FD6008;
    }
    glob1++;

    double leftPosition = 0;
    List cimage = [
      "assets/images/profileimg1.png",
      "assets/images/profileimg1.png",
      // "assets/images/profileimg1.png"
    ];
    List candImages = List.generate(cimage.length, (index) {
      leftPosition = index * 25;
      String e = cimage[index];
      return Positioned(
        left: leftPosition,
        child: SizedBox(
            height: 35,
            width: 35,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: dashBoarbgColor,
              backgroundImage: AssetImage(e),
            )),
      );
    });
    candImages.add(Positioned(
      left: cimage.length * 25,
      child: SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(
            backgroundColor: dashBoarbgColor,
            child: Text(
              "17+",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25),
            ),
          )),
    ));

    return BsCard(
      style: BsCardStyle(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          //
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 5.0),
              blurRadius: 4.0,
              spreadRadius: 3.0,
            )
          ],
        ),
      ),
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: bbcolor, width: 5, style: BorderStyle.solid))),
          child: Padding(
            padding:
            const EdgeInsets.all(10), //).only(left: 28, top: 15, right: 15, bottom: 25),
            child: Column(
              children: [
                BsCol(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          // direction: Axis.horizontal ,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          // mainAxisAlignment: Main,
                          children: [
                            BsRow(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(color: D8E1E9, width: 2))),
                              children: [
                                BsCol(
                                  sizes: ColScreen(
                                    xs: Col.col_6,
                                    sm: Col.col_6,
                                    md: Col.col_6,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Job ID :',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor2,
                                          letterSpacing: 0.4,
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "5894 6921",
                                          style: TextStyle(
                                            color: iconColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                BsCol(
                                  alignment: Alignment.centerRight,

                                  sizes: ColScreen(
                                    xs: Col.col_6,
                                    sm: Col.col_6,
                                    md: Col.col_6,
                                  ),
                                  child: Wrap(
                                    crossAxisAlignment:
                                    WrapCrossAlignment.center,
                                    alignment: WrapAlignment.end,
                                    children: [
                                      Text(
                                        "22-Jan’22",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: iconColor,
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: textColor2,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 4.0),
                        child: Text(
                          "Executive Assistant",
                          style: TextStyle(
                              color: primaryColor2,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.work,
                                        color: iconColor,
                                        size: 18,
                                      )),
                                  const  WidgetSpan(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 8.0),
                                      child: Text(
                                          "Full Time . On-site. Day shift"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                style:
                                TextStyle(color: textColor, fontSize: 16),
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.stars,
                                        color: iconColor,
                                        size: 18,
                                      )),
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text("2-3 Years Experience"),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Wrap(
                                        crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                        // spacing: 15,
                                        runSpacing: 15,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: iconColor,
                                            size: 20,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 6.0),
                                            child: Card(
                                              // margin: const EdgeInsets.only(left: 10),
                                              color: forgotpwdOutercolor,
                                              elevation: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Text(
                                                  "Chennai",
                                                  style: TextStyle(
                                                      color: textColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      letterSpacing: 0.25),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 5.0),
                                            child: Card(
                                              color: forgotpwdOutercolor,
                                              elevation: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Text(
                                                  "Bangalore",
                                                  style: TextStyle(
                                                      color: textColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      letterSpacing: 0.25),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BsRow(
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  margin: const EdgeInsets.only(top: 10.0, right: 4),
                  children: [
                    BsCol(
                      sizes: ColScreen(
                        xs: Col.col_6,
                        sm: Col.col_6,
                        md: Col.col_6,
                      ),
                      child: SizedBox(
                        height: 35,
                        child: Stack(
                          children: [
                            ...candImages,
                          ],
                        ),
                      ),
                    ),
                    BsCol(
                      alignment: Alignment.centerRight,
                      sizes: ColScreen(
                        xs: Col.col_6,
                        sm: Col.col_6,
                        md: Col.col_6,
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InterViewStatus2()));
                        },
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: 220.0, minHeight: btnHeight1),
                          alignment: Alignment.center,
                          child: const Text(
                            "Applicants",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          maximumSize: Size(220.0, btnHeight1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showJobDialog() {
    AwesomeDialog(
      dismissOnTouchOutside: true,
      isDense: true,
      padding: EdgeInsets.all((a < 4) ? 15 : 49),
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      width: (screenWidth > 700) ? 700 : screenWidth - 10,

      body: const ShowDialogDataSf(),
      // title: 'This is Ignored',
      // desc: 'This is also Ignored',
    ).show();
  }
}
