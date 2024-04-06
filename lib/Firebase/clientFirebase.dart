// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Firebase/clientInfo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientFirebase {
  ClientInfo currentClient = ClientInfo();
  FirebaseFirestore ffObject = FirebaseFirestore.instance;
  Future<bool> SendClientData(ClientInfo info) async {
    try {
      await ffObject.collection("MyCLients").doc(info.clientID).set({
        "ClientName": info.clientName,
        "CLientID": info.clientID,
        "ClientPin": info.clientPin,
        "ClientPassword": info.clientPassword,
        "CLientCreated": Timestamp.now(),
      });
      Fluttertoast.showToast(
        msg: "Data added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return true;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
  }

  Future<bool> DeleteClientData(ClientInfo info) async {
    try {
      await ffObject.collection("MyClients").doc(info.clientID).delete();
      Fluttertoast.showToast(
        msg: "Client Data Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return true;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
  }

  Future<bool> UpdateClientData(ClientInfo info) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
