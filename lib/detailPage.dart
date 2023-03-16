import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Детали оплаты"),
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                TextField(

                  readOnly: true,
                  decoration: InputDecoration(
                    labelText:  'Колонка'
                  ),

                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
