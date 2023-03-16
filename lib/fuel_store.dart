import 'package:mobx/mobx.dart';

part 'fuel_store.g.dart';

class FuelStore = _FuelStore with _$FuelStore;

abstract class _FuelStore with Store {
  @observable
  double liter = 0.0;

  @observable
  double price = 0.0;

  @computed
  double get totalPrice => liter * price;
}
