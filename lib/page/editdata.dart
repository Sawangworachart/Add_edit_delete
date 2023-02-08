import 'package:add_edit_delete/model/p_model.dart';
import 'package:flutter/material.dart';
import 'package:add_edit_delete/global.dart' as global;

class Editdata extends StatefulWidget {
  List<PModel> profilelist = new List.filled(0, PModel.empty(), growable: true);
  int id = 0;

  Editdata.setText(List<PModel> prolist, int id) {
    this.profilelist = prolist;
    this.id = id;
  }

  @override
  State<Editdata> createState() => _EditdataState(profilelist, id);
}

class _EditdataState extends State<Editdata> {
  List<PModel> prolist = new List.filled(0, PModel.empty(), growable: true);
  int id = 0;

  _EditdataState(List<PModel> profilelist, int idx) {
    prolist = profilelist;
    id = idx;
    global.user.text = profilelist[id].user_q;
    global.lastname.text = profilelist[id].lastname_q;
    global.gmail.text = profilelist[id].email_q;
    global.school.text = profilelist[id].school_q;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Edit Data',
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
                      var edit =
                          prolist.firstWhere((element) => element.id == id);
                      edit.user_q = global.user.text;
                      edit.lastname_q = global.lastname.text;
                      edit.email_q = global.gmail.text;
                      edit.school_q = global.school.text;
                      Navigator.pop(context, prolist);
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
                    onTap: () {},
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
