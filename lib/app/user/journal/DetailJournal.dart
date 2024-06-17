import 'package:flutter/material.dart';
import 'package:joi/app/user/journal/Journal.dart';

class DetailJournal extends StatefulWidget {
  const DetailJournal({super.key});

  @override
  State<DetailJournal> createState() => _DetailJournalState();
}

class _DetailJournalState extends State<DetailJournal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
                      builder: (context) => Journal(),
                    ))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Text(
              "   Journal Details",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // SvgPicture.asset("assets/images/filter.svg")
          ],
        ),
      ),
      Stack(
        children: [
          Image.asset(
            "assets/images/images.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Container(
            width: double.infinity,
            height: 440,
            margin: EdgeInsets.only(left: 20, right: 20, top: 280),
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dummy Title here",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "22 November 2024",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Text(
                        "Category Name",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " > ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sub Category",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")
                ],
              ),
            ),
          )
        ],
      )
    ]));
  }
}
