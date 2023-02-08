import 'package:add_edit_delete/model/p_model.dart';
import 'package:add_edit_delete/page/createdata.dart';
import 'package:add_edit_delete/page/editdata.dart';
import 'package:flutter/material.dart';

class DataFrom extends StatefulWidget {
  const DataFrom({key});

  @override
  State<DataFrom> createState() => _DataFromState();
}

class _DataFromState extends State<DataFrom> {
  List<PModel> prolist = new List.filled(0, PModel.empty(), growable: true);
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Datafrom',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Create(prolist.length),
                ),
              ).then((value) {
                if (value == null) {
                } else {
                  prolist.add(value);
                }

                setState(() {});
              });
            },
          )
        ],
      ),
      body: Container(
        child: (prolist.length != 0)
            ? ListView.builder(
                itemCount: prolist.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.green,
                    ),
                    title: Text(prolist[index].user_q),
                    subtitle: Text(prolist[index].lastname_q),
                    trailing: Wrap(children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) =>
                                  new Editdata.setText(prolist, index),
                            ),
                          ).then((value) {
                            if (value == null) {
                            } else {
                              prolist = value;
                            }
                            setState(() {});
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          prolist.removeWhere(
                              (element) => element.id == prolist[index].id);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ]),
                  );
                },
              )
            : Container(),
      ),
    );
  }
}
