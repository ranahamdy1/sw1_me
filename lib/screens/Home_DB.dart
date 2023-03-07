import 'dart:async';
import 'package:flutter/material.dart';
import '../../database/sqflite/edittips.dart';
import '../../database/sqflite/sqldb.dart';

class MyHomeDbScreen extends StatefulWidget {
  const MyHomeDbScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeDbScreen> createState() => _MyHomeDbScreenState();
}

class _MyHomeDbScreenState extends State<MyHomeDbScreen> {
  SqlDb sqlDb = SqlDb();
  List tips = [];
  bool isLoading = true;

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM tips");
    tips.addAll(response);

    isLoading = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff43c5df),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'tips ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addTips");
        },
        backgroundColor: const Color(0xff43c5df),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: isLoading == true
          ? const Center(child: Text("Loading..."))
          : Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListView.builder(
                      itemCount: tips.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Card(
                            child: ListTile(
                                title: Text("${tips[i]['day']}"),
                                subtitle: Text("${tips[i]['tip']}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => EditTips(
                                                      tip: tips[i]['tip'],
                                                      day: tips[i]['day'],
                                                      id: tips[i]['id'],
                                                    )));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Color(0xff43c5df),
                                        size: 22,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        int response =
                                            await sqlDb.deleteData('''
                                DELETE FROM tips WHERE id =${tips[i]['id']}
                                ''');
                                        if (response > 0) {
                                          tips.removeWhere((element) =>
                                              element['id'] == tips[i]['id']);
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                )));
                      })
                ],
              ),
            ),
    );
  }
}
