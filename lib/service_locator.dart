import 'package:azs/fuel_store.dart';
import 'package:azs/store.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorSetup() async {


  serviceLocator
  ..registerSingleton<ColumnFuelStore>(ColumnFuelStore())
  ..registerSingleton<FuelStore>(FuelStore());
}
