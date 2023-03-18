import 'dart:developer';
import 'dart:io';
import 'package:azs/service_locator.dart';
import 'package:azs/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:azs/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final todoStore = serviceLocator<ColumnFuelStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoStore.init();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(FirebaseAuth.instance.currentUser?.email??"")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/qr");
        },
        child: const Icon(Icons.qr_code),
      ),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Observer(builder: (context) {
            return ListView(
              shrinkWrap: true,
              children: [
                ...todoStore.columnFuelList.map((e) => ListTile(
                  title: Text(e.fuelType.toString()),
                  trailing: Text("${e.totalPrice}тг"),
                ))
              ],
            );
          })),
    );
  }
}
