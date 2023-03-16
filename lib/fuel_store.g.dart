// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FuelStore on _FuelStore, Store {
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_FuelStore.totalPrice'))
          .value;

  late final _$literAtom = Atom(name: '_FuelStore.liter', context: context);

  @override
  double get liter {
    _$literAtom.reportRead();
    return super.liter;
  }

  @override
  set liter(double value) {
    _$literAtom.reportWrite(value, super.liter, () {
      super.liter = value;
    });
  }

  late final _$priceAtom = Atom(name: '_FuelStore.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  @override
  String toString() {
    return '''
liter: ${liter},
price: ${price},
totalPrice: ${totalPrice}
    ''';
  }
}
