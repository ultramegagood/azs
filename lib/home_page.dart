/// страница домашняя где отопражается список счетов оплаченных

import 'dart:developer';
import 'dart:io';
import 'package:azs/column_model.dart';
import 'package:azs/service_locator.dart';
import 'package:azs/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:azs/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
///
/// страница домашняя где отопражается список счетов оплаченных
///
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

  Future<Uint8List> generateReceiptPdf(ColumnModel columnModel) async {
    final pdf = pw.Document();

    // Добавляем шрифт Montserrat
    final fontData = await rootBundle.load("assets/fonts/Montserrat-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);
    final bold = pw.Font.ttf(await rootBundle.load("assets/fonts/Montserrat-Bold.ttf"));
    final pw.ThemeData theme = pw.ThemeData.withFont(
      base: ttf,
      bold: bold,
    );

    // Создаем страницу PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Theme(
          data: theme,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Жанармай төлеу түбіртегі", textScaleFactor: 2),
              pw.SizedBox(height: 20),
              pw.Text("Тип топливо: ${columnModel.fuelType}"),
              pw.Text("Канша литр: ${columnModel.liter}"),
              pw.Text("Бағасы: ${columnModel.totalPrice}"),
            ],
          ),
        ),
      ),
    );
    await Printing.layoutPdf(onLayout: (_) => pdf.save());

    return pdf.save();
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
                ///
                /// цикл для отоброженися списка используется метод map для конвертаций данных в виджет
                ///
                ///
                ...todoStore.columnFuelList.map((e) => ListTile(
                  onTap: ()=>generateReceiptPdf(e),
                  title: Text(e.fuelType.toString()),
                  trailing: Text("${e.totalPrice}тг"),
                ))
              ],
            );
          })),
    );
  }
}
