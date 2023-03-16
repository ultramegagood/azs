// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ColumnFuelStore on _ColumnFuelStore, Store {
  Computed<int>? _$getTotalPriceComputed;

  @override
  int get getTotalPrice =>
      (_$getTotalPriceComputed ??= Computed<int>(() => super.getTotalPrice,
              name: '_ColumnFuelStore.getTotalPrice'))
          .value;

  late final _$selectedcolumnFuelAtom =
      Atom(name: '_ColumnFuelStore.selectedcolumnFuel', context: context);

  @override
  ColumnModel? get selectedcolumnFuel {
    _$selectedcolumnFuelAtom.reportRead();
    return super.selectedcolumnFuel;
  }

  @override
  set selectedcolumnFuel(ColumnModel? value) {
    _$selectedcolumnFuelAtom.reportWrite(value, super.selectedcolumnFuel, () {
      super.selectedcolumnFuel = value;
    });
  }

  late final _$columnFuelListAtom =
      Atom(name: '_ColumnFuelStore.columnFuelList', context: context);

  @override
  List<ColumnModel> get columnFuelList {
    _$columnFuelListAtom.reportRead();
    return super.columnFuelList;
  }

  @override
  set columnFuelList(List<ColumnModel> value) {
    _$columnFuelListAtom.reportWrite(value, super.columnFuelList, () {
      super.columnFuelList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ColumnFuelStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_ColumnFuelStoreActionController =
      ActionController(name: '_ColumnFuelStore', context: context);

  @override
  void setColumn(String value) {
    final _$actionInfo = _$_ColumnFuelStoreActionController.startAction(
        name: '_ColumnFuelStore.setColumn');
    try {
      return super.setColumn(value);
    } finally {
      _$_ColumnFuelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFromQr(String value) {
    final _$actionInfo = _$_ColumnFuelStoreActionController.startAction(
        name: '_ColumnFuelStore.getFromQr');
    try {
      return super.getFromQr(value);
    } finally {
      _$_ColumnFuelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(int value) {
    final _$actionInfo = _$_ColumnFuelStoreActionController.startAction(
        name: '_ColumnFuelStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_ColumnFuelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuelType(String value) {
    final _$actionInfo = _$_ColumnFuelStoreActionController.startAction(
        name: '_ColumnFuelStore.setFuelType');
    try {
      return super.setFuelType(value);
    } finally {
      _$_ColumnFuelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLiter(int value) {
    final _$actionInfo = _$_ColumnFuelStoreActionController.startAction(
        name: '_ColumnFuelStore.setLiter');
    try {
      return super.setLiter(value);
    } finally {
      _$_ColumnFuelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedcolumnFuel: ${selectedcolumnFuel},
columnFuelList: ${columnFuelList},
getTotalPrice: ${getTotalPrice}
    ''';
  }
}
