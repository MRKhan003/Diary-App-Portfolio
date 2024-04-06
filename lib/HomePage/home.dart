// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Controllers/dbController.dart';
import 'package:diary/Firebase/clientFirebase.dart';
import 'package:diary/Firebase/clientInfo.dart';
import 'package:diary/Widgets/drawerElements.dart';
import 'package:diary/Widgets/textFieldsData.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  dbController controller = dbController();
  ClientInfo info = ClientInfo();
  String searchName = "";

  @override
  State<HomePage> createState() => _homePageState();

  Future<void> FindClient(String searchName) async {
    CollectionReference client =
        FirebaseFirestore.instance.collection('MyCLients');
    QuerySnapshot snapshot = await client.get();

    snapshot.docs.forEach((doc) {
      if (doc['ClientName'] == searchName) {
        controller.nameController.text = doc['ClientName'];
        controller.userIdController.text = doc['CLientID'];
        controller.userPasswordController.text = doc['ClientPassword'];
        controller.userPinController.text = doc['ClientPin'];
      } else {}
    });
  }
}

class _homePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "My Diary",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            drawerElements(
              containerText: "Add Data",
              containerColor: Colors.green,
              containerIcon: Icons.add,
            ),
            const Divider(),
            drawerElements(
              containerText: "Update Data",
              containerColor: Colors.yellow,
              containerIcon: Icons.update,
            ),
            const Divider(),
            drawerElements(
              containerText: "Delete Data",
              containerColor: Colors.red,
              containerIcon: Icons.delete,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(
              seconds: 2,
            ),
          );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: 330,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      controller: widget.controller.searchController,
                      decoration: InputDecoration(
                        hintText: "Search by client name",
                        suffixIcon: GestureDetector(
                          child: const Icon(
                            Icons.search,
                          ),
                          onDoubleTap: () {
                            widget.searchName =
                                widget.controller.searchController.text;
                            widget.FindClient(widget.searchName);
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textFieldsData(
                    labelText: "Client Name",
                    editingController: widget.controller.nameController,
                    hintText: widget.controller.nameController.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textFieldsData(
                    labelText: "Client ID",
                    editingController: widget.controller.userIdController,
                    hintText: widget.controller.userIdController.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textFieldsData(
                    labelText: "Client Password",
                    editingController: widget.controller.userPasswordController,
                    hintText: widget.controller.userPasswordController.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textFieldsData(
                    labelText: "Client Pin",
                    editingController: widget.controller.userPinController,
                    hintText: widget.controller.userPinController.text,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.green,
                        ),
                      ),
                      onPressed: () {
                        if (widget.controller.nameController.text.isNotEmpty &&
                            widget
                                .controller.userIdController.text.isNotEmpty &&
                            widget.controller.userPasswordController.text
                                .isNotEmpty &&
                            widget
                                .controller.userPinController.text.isNotEmpty) {
                          widget.info.clientName =
                              widget.controller.nameController.text;
                          widget.info.clientID =
                              widget.controller.userIdController.text;
                          widget.info.clientPassword =
                              widget.controller.userPasswordController.text;
                          widget.info.clientPin =
                              widget.controller.userPinController.text;

                          ClientFirebase().SendClientData(
                            widget.info,
                          );
                        } else {}
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.yellow,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.red,
                        ),
                      ),
                      onPressed: () {
                        widget.info.clientName =
                            widget.controller.nameController.text;
                        widget.info.clientID =
                            widget.controller.userIdController.text;
                        widget.info.clientPassword =
                            widget.controller.userPasswordController.text;
                        widget.info.clientPin =
                            widget.controller.userPinController.text;
                        ClientFirebase().DeleteClientData(widget.info);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
