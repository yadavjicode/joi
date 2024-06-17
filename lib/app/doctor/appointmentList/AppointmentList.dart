import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:joi/app/doctor/dashboard/DoctorDashboard.dart';
import 'package:joi/app/util/custom/customcolor/CustomColor.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final List<Map<String, dynamic>> items = [
    {"name": "Prashant Yadav", "date": "16 March 2024", "time": "11:15 AM"},
    {"name": "Akash Singh", "date": "15 March 2024", "time": "01:15 PM"},
    {"name": "Anuj Maurya", "date": "18 March 2024", "time": "04:15 PM"},
    {"name": "Ankit Sharma", "date": "19 March 2024", "time": "06:15 PM"},
    {"name": "Vijay Pal", "date": "20 March 2024", "time": "11:00 AM"}
  ];
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          height: 400,
          decoration: BoxDecoration(
              color: CustomColor.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/blackfilter.svg"),
                    Text(
                      "Filter By:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "From Date",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SvgPicture.asset(
                        "assets/images/calender.svg",
                        height: 39,
                        width: 39,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "To Date",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: SvgPicture.asset(
                        "assets/images/calender.svg",
                        height: 39,
                        width: 39,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: CustomColor.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                    //  Spacer(),
                    //  ElevatedButton(onPressed: () => {}, child: Text("Submit"))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: CustomColor.backgroundColor,
            height: 80,
            padding: EdgeInsets.all(10),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDashboard(),
                        ))
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.whiteColor,
                  ),
                ),
                Text(
                  "   Live Practitioner",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Spacer(),

                GestureDetector(
                    onTap: () => showBottomSheet(context),
                    child: SvgPicture.asset("assets/images/filter.svg"))
                // SvgPicture.asset("assets/images/filter.svg")
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 700,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Flexible(
              child: Container(
                //  margin: EdgeInsets.only(bottom: 70),
                //padding: EdgeInsets.only(left: 20, right: 20),
                // height: 600,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Display only one item per row
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 0.0,
                        mainAxisExtent: 170),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CustomColor.whiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(children: [
                            IntrinsicHeight(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/calender.svg"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          items[index]["date"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                            "assets/images/time.svg"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          items[index]["time"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipOval(
                                          // borderRadius: BorderRadius.only(
                                          //     topLeft: Radius.circular(10),
                                          //     topRight: Radius.circular(10),
                                          //     bottomLeft: Radius.circular(10),
                                          //     bottomRight: Radius.circular(10)),
                                          child: Image.asset(
                                            "assets/images/human.png",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                            //  filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                        SizedBox(width: 7),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                items[index]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 4,
                                                          bottom: 4,
                                                          left: 6,
                                                          right: 6),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: CustomColor
                                                                  .backgroundColor),
                                                          color: CustomColor
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                      child: Row(children: [
                                                        SvgPicture.asset(
                                                            "assets/images/Vector1.svg"),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          "Chat",
                                                          style: TextStyle(
                                                              color: CustomColor
                                                                  .whiteColor),
                                                        ),
                                                      ]),
                                                    ),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4,
                                                                bottom: 4,
                                                                left: 6,
                                                                right: 6),
                                                        decoration: BoxDecoration(
                                                            color: CustomColor
                                                                .blackColor,
                                                            border: Border.all(
                                                                color: CustomColor
                                                                    .greyColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                "assets/images/Vector3.svg"),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              "Call",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 5,
                                                                left: 6,
                                                                right: 6),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: CustomColor
                                                                    .backgroundColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                "assets/images/Vector2.svg"),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              "Video",
                                                              style: TextStyle(
                                                                  color: CustomColor
                                                                      .backgroundColor),
                                                            ),
                                                          ],
                                                        ))
                                                  ])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
