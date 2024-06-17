import 'package:flutter/material.dart';
import 'package:joi/app/doctor/addSlots/AddSlots.dart';
import 'package:joi/app/doctor/dashboard/DoctorHome.dart';
import 'package:joi/app/doctor/dashboard/DoctorProfile.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [DoctorHome(), DoctorProfile(), AddSlots()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //  icon: SvgPicture.asset("assets/images/home.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // icon: SvgPicture.asset("assets/images/profile.svg"),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            // icon: SvgPicture.asset("assets/images/work.svg"),
            icon: Icon(Icons.book),
            label: 'My Slots',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Chat/Call',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,

        unselectedItemColor: Color(0xFF858EA9),
        onTap: _onItemTapped,

        // onTap: _onItemTapped,
      ),
    );
    ;
  }
}
