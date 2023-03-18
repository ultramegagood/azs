import 'dart:convert';
import 'package:azs/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'assets.dart';
import 'column_model.dart';
part 'store.g.dart';

///singleton класс для работы
class ColumnFuelStore = _ColumnFuelStore with _$ColumnFuelStore;

abstract class _ColumnFuelStore with Store {
  _ColumnFuelStore();

  @observable
  ColumnModel? selectedcolumnFuel = ColumnModel();

  ///Дефолтный массив для списка задач
  @observable
  List<ColumnModel> columnFuelList = [];

  @observable
  double liter = 0.0;

  @observable
  double price = 0.0;

  @computed
  double get totalPrice => liter * price;

  ///инициализация данных и настроек
  @action
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    logger.w(prefs.getString(kDefaultListKey));
    if (prefs.getString(kDefaultListKey) != null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultListKey)!);
      columnFuelList =
          List<ColumnModel>.from(l.map((model) => ColumnModel.fromJson(model)));
    }
  }

  ///сеттеры задач
  @action
  void setColumn(String value) {
    final temp = selectedcolumnFuel!;
    temp.column = value;
    selectedcolumnFuel = temp;
  }

  @action
  void getFromQr(String value) {
    logger.w(value);
    final temp = ColumnModel.fromJson(jsonDecode(value));
    price = temp.price!.toDouble();
    selectedcolumnFuel = temp;
    logger.w([selectedcolumnFuel?.fuelType]);
  }

  ///сеттеры задач
  @action
  void setPrice(int value) {
    final temp = selectedcolumnFuel!;
    temp.price = value;
    price = value.toInt().toDouble();
    selectedcolumnFuel = temp;
  }

  ///сеттеры задач
  @action
  void setFuelType(String value) {
    final temp = selectedcolumnFuel!;
    temp.fuelType = value;
    selectedcolumnFuel = temp;
  }

  @action
  void setLiter(int value) {
    final temp = selectedcolumnFuel!;
    temp.liter = value;
    liter = value.toDouble();
    selectedcolumnFuel = temp;
  }
  @action
  Future<void> pay() async{
    final prefs = await SharedPreferences.getInstance();
    selectedcolumnFuel?.totalPrice = totalPrice.toInt();
    columnFuelList.add(selectedcolumnFuel!);
    logger.w([columnFuelList]);
    prefs.setString(kDefaultListKey, jsonEncode(columnFuelList));
    logger.w(json);
  }

}
