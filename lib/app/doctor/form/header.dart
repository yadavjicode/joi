import 'package:flutter/material.dart';
import 'package:joi/app/doctor/Login/DoctorLogin.dart';

class HeaderA extends StatefulWidget {
  const HeaderA({super.key});

  @override
  State<HeaderA> createState() => _HeaderAState();
}

class _HeaderAState extends State<HeaderA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      builder: (context) => DoctorLogin(),
                    ))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),

            Text(
              " Psychologist/Yoga Practitioner Q/A",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // SvgPicture.asset("assets/images/filter.svg")
          ],
        ),
      ),
    );
  }
}

class HeaderB extends StatefulWidget {
  const HeaderB({super.key});

  @override
  State<HeaderB> createState() => _HeaderBState();
}

class _HeaderBState extends State<HeaderB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      builder: (context) => DoctorLogin(),
                    ))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),

            Text(
              " Education Qualification",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // SvgPicture.asset("assets/images/filter.svg")
          ],
        ),
      ),
    );
  }
}

class HeaderC extends StatefulWidget {
  const HeaderC({super.key});

  @override
  State<HeaderC> createState() => _HeaderCState();
}

class _HeaderCState extends State<HeaderC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      builder: (context) => DoctorLogin(),
                    ))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),

            Text(
              " Background Verification",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // SvgPicture.asset("assets/images/filter.svg")
          ],
        ),
      ),
    );
  }
}

class HeaderD extends StatefulWidget {
  const HeaderD({super.key});

  @override
  State<HeaderD> createState() => _HeaderDState();
}

class _HeaderDState extends State<HeaderD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      builder: (context) => DoctorLogin(),
                    ))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),

            Text(
              " Roaster Details",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            // SvgPicture.asset("assets/images/filter.svg")
          ],
        ),
      ),
    );
  }
}
