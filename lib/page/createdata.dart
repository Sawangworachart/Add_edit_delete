import 'package:add_edit_delete/model/p_model.dart';
import 'package:flutter/material.dart';
import 'package:add_edit_delete/global.dart' as global;

class Create extends StatefulWidget {
  int len = 0;
  Create(int length) {
    this.len = length;
  }

  @override
  State<Create> createState() => _CreateState(len);
}

class _CreateState extends State<Create> {
  int len = 0;

  _CreateState(int len) {
    this.len = len;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Create',
            style: TextStyle(color: Colors.white),
          )),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Input Data',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Textfromfild('Username', '', global.user),
              SizedBox(height: 20),
              Textfromfild('Lastname', '', global.lastname),
              SizedBox(height: 20),
              Textfromfild('Gmail', '', global.gmail),
              SizedBox(height: 20),
              Textfromfild('School', '', global.school),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),

                        padding: const EdgeInsets.all(8),
                        // Change button text when light changes state.
                        child: Center(
                          child: Text(
                            'Add Value',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      PModel profile = new PModel(
                          len,
                          global.user.text,
                          global.lastname.text,
                          global.gmail.text,
                          global.school.text);
                      Navigator.pop(context, profile);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),

                        padding: const EdgeInsets.all(8),
                        // Change button text when light changes state.
                        child: Center(
                          child: Text(
                            'Cancle',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  TextField Textfromfild(
      String lText, String hText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: lText,
        hintText: hText,
      ),
    );
  }
}
