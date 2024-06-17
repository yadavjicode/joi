import 'package:flutter/material.dart';
import 'package:joi/app/doctor/form/background_verfication.dart';
import 'package:joi/app/doctor/form/basicdetail.dart';
import 'package:joi/app/doctor/form/education.dart';
import 'package:joi/app/doctor/form/header.dart';
import 'package:joi/app/doctor/form/roster.dart';

class FormDetail extends StatefulWidget {
  const FormDetail({super.key});

  @override
  State<FormDetail> createState() => _FormDetail();
}

class _FormDetail extends State<FormDetail> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final PageController _pageControllerB = PageController();

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
    _pageControllerB.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageControllerB,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: <Widget>[
                Container(
                    // padding: EdgeInsets.all(15),
                    // height: 50,
                    //  alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: HeaderA()),
                Container(
                    // padding: EdgeInsets.all(15),
                    // height: 50,
                    //  alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: HeaderB()),
                Container(
                    // padding: EdgeInsets.all(15),
                    // height: 50,
                    //  alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: HeaderC()),
                Container(
                    // padding: EdgeInsets.all(15),
                    // height: 50,
                    //  alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: HeaderD()),
              ],
            ),
          ),
          CustomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTap,
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: <Widget>[
                Center(
                    child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 1100,
                    alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: BasicDetail(
                      currentIndex: _currentIndex,
                      onTap: _onTap,
                    ),
                  ),
                )),
                Center(
                    child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 1250,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Education(
                      currentIndex: _currentIndex,
                      onTap: _onTap,
                    ),
                  ),
                )),
                Center(
                    child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      height: 800,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: BackVerification(
                        currentIndex: _currentIndex,
                        onTap: _onTap,
                      )),
                )),
                Center(
                    child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      height: 650,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Roaster(
                        currentIndex: _currentIndex,
                        onTap: _onTap,
                      )),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color getStepColor(int step) {
      if (step < currentIndex) {
        return Colors.green; // Completed step
      } else if (step == currentIndex) {
        return Colors.black; // Current step
      } else {
        return Colors.grey; // Incomplete step
      }
    }

    Color getTextColor(int step) {
      if (step <= currentIndex) {
        return Colors.black; // Completed or current step
      } else {
        return Colors.grey; // Incomplete step
      }
    }

    return Column(children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Color(0xFFF9F9F9),
        ),
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.only(top: 10),
        //  color: Colors.blue,
        // width: double.infinity,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getStepColor(0),
                    ),
                    child: Text("1",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "Basic Detail",
                    style: TextStyle(color: getTextColor(0)),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 3,
              width: 15,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => onTap(1),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getStepColor(1),
                    ),
                    child: Text("2",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Text("Education", style: TextStyle(color: getTextColor(1)))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 3,
              width: 15,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => onTap(2),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getStepColor(2),
                    ),
                    child: Text("3",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Text("Background", style: TextStyle(color: getTextColor(2)))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 3,
              width: 15,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getStepColor(3),
                    ),
                    child: Text(
                      "4",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("Roster", style: TextStyle(color: getTextColor(3)))
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
