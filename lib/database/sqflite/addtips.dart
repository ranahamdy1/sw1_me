import 'package:flutter/material.dart';
import 'package:project_software1/database/sqflite/sqldb.dart';

class AddTips extends StatefulWidget {
  const AddTips({Key? key}) : super(key: key);

  @override
  State<AddTips> createState() => _AddTipsState();
}

class _AddTipsState extends State<AddTips> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController tip = TextEditingController();
  TextEditingController day = TextEditingController();
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff43c5df),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Add Tips',
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
                          ))),
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
                        int response = await sqlDb.insertData('''
                        INSERT INTO tips (tip , day )
                        VALUES ("${tip.text}","${day.text}")
                        ''');
                        if (response > 0) {
                          Navigator.of(context).pushNamed("Home");
                        }
                      },
                      color: const Color(0xff43c5df),
                      child: const Text(
                        "Add Tips",
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
