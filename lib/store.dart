
import 'dart:convert';
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

  @computed
  int get getTotalPrice => (selectedcolumnFuel!.liter! * selectedcolumnFuel!.price!);
  ///инициализация данных и настроек
  @action
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(kDefaultListKey) != null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultListKey)!);
      columnFuelList = List<ColumnModel>.from(l.map((model) => ColumnModel.fromJson(model)));
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
    final temp = ColumnModel.fromJson(jsonDecode(value));
    selectedcolumnFuel = temp;
    columnFuelList.add(selectedcolumnFuel!);
  }

  ///сеттеры задач
  @action
  void setPrice(int value) {
    final temp = selectedcolumnFuel!;
    temp.price = value;
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
    temp.totalPrice = value;
    selectedcolumnFuel = temp;
  }
}