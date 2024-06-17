import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';

class LivePsychologist extends StatefulWidget {
  const LivePsychologist({super.key});

  @override
  State<LivePsychologist> createState() => _LivePsychologistState();
}

class _LivePsychologistState extends State<LivePsychologist> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Prashant Yadav",
      "spl": "couple",
      "language": "Hindi|English",
      "Exp": "02",
      "time": "03"
    },
    {
      "name": "Akash Singh",
      "spl": "couple",
      "language": "Hindi|English",
      "Exp": "02",
      "time": "03"
    },
    {
      "name": "Anuj Maurya",
      "spl": "couple",
      "language": "Hindi|English",
      "Exp": "02",
      "time": "03"
    },
    {
      "name": "Ankit Sharma",
      "spl": "couple",
      "language": "Hindi|English",
      "Exp": "02",
      "time": "03"
    },
    {
      "name": "Vijay Pal",
      "spl": "couple",
      "language": "Hindi|English",
      "Exp": "02",
      "time": "03"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Color(0xFF7EA11C),
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
                        builder: (context) => Dashboard(),
                      ))
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Text(
                "   Live Psychologist",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Spacer(),

              SvgPicture.asset("assets/images/filter.svg")
              // SvgPicture.asset("assets/images/filter.svg")
            ],
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 20, right: 20),
            // height: 600,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Display only one item per row
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 0.0,
                    mainAxisExtent: 175),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                child: Image.asset(
                                  "assets/images/image.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                  //  filterQuality: FilterQuality.high,
                                ),
                              ),
                              SizedBox(width: 7),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      items[index]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      "Spl In: " +
                                          items[index]["spl"].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index]["language"],
                                        style: TextStyle(fontSize: 13),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    Text(
                                      "Exp: " + items[index]["Exp"],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(children: [
                                      Text(
                                        "₹ 40/15 min",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            left: 6,
                                            right: 6),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Text(
                                          "Chat",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 8, right: 5),
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 6,
                                              right: 6),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: SvgPicture.asset(
                                              "assets/images/call.svg")),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 6,
                                              right: 6),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: SvgPicture.asset(
                                              "assets/images/videocall.svg"))
                                    ])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "---------------------------------------------------------------------------",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Available In : 15 Mins",
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                    ),
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
