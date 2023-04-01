/// Моделька для бензоколонки

import 'package:json_annotation/json_annotation.dart';

part 'column_model.g.dart';

///
/// Моделька для бензоколонки
///
@JsonSerializable()
class ColumnModel{
  bool? isColumn;
  String? column;
  String? fuelType;
  int? price;
  int? liter;
  int? totalPrice;

  ColumnModel({this.isColumn, this.column, this.fuelType, this.price,this.liter,this.totalPrice});
  factory ColumnModel.fromJson(Map<String,dynamic>json)=>_$ColumnModelFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnModelToJson(this);

}