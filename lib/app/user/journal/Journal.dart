import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/journal/DetailJournal.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final List<Map<String, dynamic>> items = [
    {
      "image": "assets/images/children.png",
      "tittle": "Dummy Tittle here",
      "date": "2 November 2024",
      "text":
          "The paint method draws circles along the width of the canvas at intervals defined by dotSpacing and dotRadius."
    },
    {
      "image": "assets/images/children.png",
      "tittle": "Dummy Tittle here",
      "date": "2 November 2024",
      "text":
          "The paint method draws circles along the width of the canvas at intervals defined by dotSpacing and dotRadius."
    },
    {
      "image": "assets/images/children.png",
      "tittle": "Dummy Tittle here",
      "date": "2 November 2024",
      "text":
          "The paint method draws circles along the width of the canvas at intervals defined by dotSpacing and dotRadius."
    },
    {
      "image": "assets/images/children.png",
      "tittle": "Dummy Tittle here",
      "date": "2 November 2024",
      "text":
          "The paint method draws circles along the width of the canvas at intervals defined by dotSpacing and dotRadius."
    },
    {
      "image": "assets/images/children.png",
      "tittle": "Dummy Tittle here",
      "date": "2 November 2024",
      "text":
          "The paint method draws circles along the width of the canvas at intervals defined by dotSpacing and dotRadius."
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
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              Text(
                "   Journal ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Spacer(),
              SvgPicture.asset("assets/images/filter.svg")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Category Name ",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                ">",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                " Sub Categary",
                style: TextStyle(fontSize: 18),
              )
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
                    mainAxisExtent: 150),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailJournal(),
                            ))
                      },
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
                        child: IntrinsicHeight(
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
                                  "assets/images/images.png",
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
                                      items[index]["tittle"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      items[index]["date"].toString(),
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index]["text"],
                                        style: TextStyle(fontSize: 13),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
