import 'package:flutter/material.dart';
import 'package:joi/app/doctor/dashboard/DoctorDashboard.dart';
import 'package:joi/app/util/custom/customcolor/CustomColor.dart';
import 'package:joi/app/util/custom/customtextfeild/CustomTextFeild.dart';

class AddSlots extends StatefulWidget {
  const AddSlots({super.key});

  @override
  State<AddSlots> createState() => _AddSlotsState();
}

class _AddSlotsState extends State<AddSlots> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  List<DateTime> slots = [];
  DateTime? selectedStartTime;
  DateTime? selectedEndTime;

  @override
  void initState() {
    super.initState();
    createDoctorSlots();
  }

  void createDoctorSlots() {
    DateTime startTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0);
    DateTime endTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0);

    Duration interval = Duration(minutes: 15); // One hour interval

    DateTime slotTime = startTime;
    while (slotTime.isBefore(endTime)) {
      slots.add(slotTime);
      slotTime = slotTime.add(interval);
    }
  }

  void setSelectedTimes(DateTime startTime) {
    setState(() {
      selectedStartTime = startTime;
      selectedEndTime = startTime
          .add(Duration(minutes: 15)); // Assuming each slot is one hour
    });
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      final formattedDate =
          '${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}'; // Remove the time part
      setState(() {
        controller.text = formattedDate.toString();
      });
    }
  }

  // Using a list of maps to store the pairs of TextEditingControllers
  List<Map<String, TextEditingController>> textControllerPairs = [];

  void incrementTextFieldPair() {
    setState(() {
      textControllerPairs.add({
        'startController': TextEditingController(),
        'endController': TextEditingController(),
      });
    });
  }

  void deleteTextFieldPair(int index) {
    setState(() {
      textControllerPairs.removeAt(index);
    });
  }

  void printTextFieldText() {
    for (int i = 0; i < textControllerPairs.length; i++) {
      print(
          'Start Time ${i + 1}: ${textControllerPairs[i]['startController']!.text}');
      print(
          'End Time ${i + 1}: ${textControllerPairs[i]['endController']!.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  "   Add Avilable Slots",
                  style: TextStyle(color: CustomColor.whiteColor, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From Date",
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomTextField(
                    controller: fromdate,
                    suffixIcon: GestureDetector(
                      onTap: () => _selectDate(context, fromdate),
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                Text(
                  "To Date",
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomTextField(
                    controller: todate,
                    suffixIcon: GestureDetector(
                        onTap: () => _selectDate(context, todate),
                        child: Icon(Icons.calendar_today)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Text(
                    "Add Time Slots",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 350,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: textControllerPairs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 10, bottom: 10, right: 10),
                            //color: Colors.green,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    DropdownButton<DateTime>(
                                      hint: Text('Select Start Time'),
                                      value: selectedStartTime,
                                      onChanged: (DateTime? newValue) {
                                        setSelectedTimes(newValue!);
                                        textControllerPairs[index]
                                                    ['startController']!
                                                .text =
                                            '${_formatHour(newValue.hour)}:${newValue.minute.toString().padLeft(2, '0')} ${newValue.hour >= 12 ? 'PM' : 'AM'}';

                                        textControllerPairs[index]
                                                ['endController']!
                                            .text = selectedEndTime !=
                                                null
                                            ? '${_formatHour(selectedEndTime!.hour)}:${selectedEndTime!.minute.toString().padLeft(2, '0')} ${selectedEndTime!.hour >= 12 ? 'PM' : 'AM'}'
                                            : '';
                                      },
                                      items: slots
                                          .map<DropdownMenuItem<DateTime>>(
                                              (DateTime value) {
                                        final formattedTime =
                                            '${_formatHour(value.hour)}:${value.minute.toString().padLeft(2, '0')} ${value.hour >= 12 ? 'PM' : 'AM'}';
                                        return DropdownMenuItem<DateTime>(
                                          value: value,
                                          child: Text(formattedTime),
                                        );
                                      }).toList(),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () =>
                                          deleteTextFieldPair(index),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        readOnly: true,
                                        controller: textControllerPairs[index]
                                            ['startController'],
                                        decoration: InputDecoration(
                                          labelText: 'Start Time',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          border: OutlineInputBorder(),
                                          //  suffixIcon: Icon(Icons.access_time),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        readOnly: true,
                                        controller: textControllerPairs[index]
                                            ['endController'],
                                        decoration: InputDecoration(
                                          labelText: 'End Time',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          border: OutlineInputBorder(),
                                          //  suffixIcon: Icon(Icons.access_time),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: incrementTextFieldPair,
                  child: Text('Add More'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  String _formatHour(int hour) {
    if (hour == 0) {
      return '12';
    } else if (hour > 12) {
      return (hour - 12).toString();
    } else {
      return hour.toString();
    }
  }
}
