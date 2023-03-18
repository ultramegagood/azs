import 'package:azs/rounded_textfield.dart';
import 'package:azs/service_locator.dart';
import 'package:azs/store.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'fuel_store.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final fuelStore = serviceLocator<FuelStore>();

  final todoStore = serviceLocator<ColumnFuelStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoStore.pay();
          Navigator.popUntil(
              context, (route) => ["/"].contains(route.settings.name ?? ''));
        },
        child: Text("Оплатить"),
      ),
      appBar: AppBar(
        title: const Text("Детали оплаты"),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedTextField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Колонка'),
                value: todoStore.selectedcolumnFuel?.column,
              ),
              RoundedTextField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Вид топливо'),
                value: todoStore.selectedcolumnFuel?.fuelType,
              ),
              RoundedTextField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Цена'),
                value: todoStore.selectedcolumnFuel?.price.toString(),
              ),
              RoundedTextField(
                decoration: InputDecoration(labelText: 'Сколько литров?'),
                value: todoStore.selectedcolumnFuel?.liter.toString(),
                keyboardType: TextInputType.number,
                onChange: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      todoStore.liter = double.parse(value);
                      todoStore.selectedcolumnFuel!.liter = int.parse(value);
                    });
                  }
                },
              ),
              RoundedTextField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Итого'),
                value: todoStore.totalPrice.toInt().toString(),
              ),
              // SizedBox(width: double.infinity,child: FloatingActionButton(onPressed: (){}, child: Container(width: double.infinity,),))
            ],
          ),
        );
      }),
    );
  }
}
