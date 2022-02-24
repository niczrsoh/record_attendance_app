import 'package:flutter/material.dart';
import 'package:record_attendance_app/viewAttendance.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'dart:async';

class EditAttendence extends StatefulWidget {
  const EditAttendence({Key? key}) : super(key: key);

  @override
  EditAttendenceState createState() => EditAttendenceState();
}

// todo: Create EditAttendence class
class EditAttendenceState extends State<EditAttendence> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  // todo: Set the time for the button loading to 2 seconds
  void _doSomething() {
    Timer(const Duration(seconds: 2), () {
      _btnController.success();
    });
  }

  // todo: print out the EditAttendence of the students after submit
  void EditAttendenceDeterminer() {
    print(EditAttendence);
  }

  // todo: Construct a namelist of the students
  int _nameindex = 0;
  final namelist = const [
    'ALICE LIM',
    'NICHOLAS SOH',
    'DYLAN TAN',
    'AHMAD BIN NAQUIDDIN',
    'AHMAD BIN MUHAMMAD',
    'RAMESH A/L SNEHAN',
    'SIM YING TING',
    'EDMUND WONG',
    'SITI BINTI MUHAMMAD',
    'AISYAH BINTI ISMAIL',
  ];
  // todo: Construct a dynamic list of EditAttendence among the students
  static var EditAttendence = [
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
    'N/A',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' EditAttendence')),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1500,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Colors.grey[300],
                    child: Column(children: [
                      const SizedBox(height: 20),
                      // todo: Give a title for this screen
                      const Text("EditAttendence",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18)),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                                "*The EditAttendence list can only fit max 24 students",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                      // todo: Construct titles for the EditAttendence situation
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SizedBox(width: 180),
                            Text(
                              "Attend",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Absent",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "N/A",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ]),
                      const SizedBox(height: 10),
                      // todo: Construct the EditAttendence list
                      for (; _nameindex < namelist.length; _nameindex++)
                        CreateRadioListTile(namelist[_nameindex], _nameindex),

                      // todo: Construct a pdf for EditAttendence report after submitted
                      Row(
                        children: [
                          const SizedBox(width: 100),
                          RoundedLoadingButton(
                            elevation: 5,
                            color: Colors.yellow[600],
                            successColor: Colors.yellow[600],
                            width: 100,
                            onPressed: () {
                              _doSomething();
                              EditAttendenceDeterminer();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewAttendence(
                                        marked: EditAttendence[0] != "N/A"
                                            ? true
                                            : false,
                                        presence: EditAttendence[0] == "PRESENT"
                                            ? true
                                            : false),
                                  ));
                            },
                            controller: _btnController,
                            child: const Text("Submitted",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreateRadioListTile extends StatefulWidget {
  const CreateRadioListTile(this.name, this.num, {Key? key}) : super(key: key);
  final String name;
  final int num;
  @override
  CreateRadioListTileState createState() => CreateRadioListTileState();
}

class CreateRadioListTileState extends State<CreateRadioListTile> {
  int selectedRadio = 0;

  @override
  void initState() {
    // todo: implement initState
    super.initState();
    selectedRadio = 3;
  }

  void setSelectedRadio(int val) {
    // todo: Change the state of value after switching each radio
    setState(() {
      selectedRadio = val;
    });
    // todo: record the EditAttendence of students in the list according to their names
    if (selectedRadio == 1) {
      EditAttendenceState.EditAttendence[widget.num] = 'PRESENT';
    } else if (selectedRadio == 2) {
      EditAttendenceState.EditAttendence[widget.num] = 'ABSENT';
    } else {
      EditAttendenceState.EditAttendence[widget.num] = 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 5),
      SizedBox(
        width: 190,
        child: Text(widget.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // todo: set the present radio to green
          Radio(
              value: 1,
              groupValue: selectedRadio,
              activeColor: Colors.green,
              onChanged: (val) {
                setSelectedRadio(int.parse(val.toString()));
              }),
          const SizedBox(width: 14),
          // todo: set the absent radio to red
          Radio(
              value: 2,
              groupValue: selectedRadio,
              activeColor: Colors.red,
              onChanged: (val) {
                setSelectedRadio(int.parse(val.toString()));
              }),
          const SizedBox(width: 7),
          // todo: set the N/A radio to orange
          Radio(
              value: 3,
              groupValue: selectedRadio,
              activeColor: Colors.orange,
              onChanged: (val) {
                setSelectedRadio(int.parse(val.toString()));
              })
        ],
      ),
    ]);
  }
}
