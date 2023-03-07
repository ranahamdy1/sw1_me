import 'package:flutter/material.dart';
import 'package:project_software1/database/sqflite/sqldb.dart';

class EditTips extends StatefulWidget {
  final tip;
  final day;
  final id;
  const EditTips({Key? key, this.tip, this.day, this.id}) : super(key: key);

  @override
  State<EditTips> createState() => _EditTipsState();
}

class _EditTipsState extends State<EditTips> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController tip = TextEditingController();
  TextEditingController day = TextEditingController();
  SqlDb sqlDb = SqlDb();

  @override
  void initState() {
    tip.text = widget.tip;
    day.text = widget.day;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff43c5df),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Edit tips',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(45),
        child: ListView(
          children: [
            Form(
                key: formState,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "day",
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff43c5df),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff43c5df),
                          ))),
                      cursorColor: const Color(0xff43c5df),
                      controller: day,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "tip",
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff43c5df),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff43c5df),
                        )),
                      ),
                      cursorColor: const Color(0xff43c5df),
                      controller: tip,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      onPressed: () async {
                        int response = await sqlDb.updateData('''
                        UPDATE tips set tip = "${tip.text}",
                        day = "${day.text}"
                        WHERE id = ${widget.id}
                        ''');
                        if (response > 0) {
                          Navigator.of(context).pushNamed("Home");
                        }
                      },
                      color: const Color(0xff43c5df),
                      child: const Text(
                        "Edit Tips",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
