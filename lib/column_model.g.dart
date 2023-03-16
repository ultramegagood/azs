// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColumnModel _$ColumnModelFromJson(Map<String, dynamic> json) => ColumnModel(
      isColumn: json['isColumn'] as bool?,
      column: json['column'] as String?,
      fuelType: json['fuelType'] as String?,
      price: json['price'] as int?,
      liter: json['liter'] as int?,
      totalPrice: json['totalPrice'] as int?,
    );

Map<String, dynamic> _$ColumnModelToJson(ColumnModel instance) =>
    <String, dynamic>{
      'isColumn': instance.isColumn,
      'column': instance.column,
      'fuelType': instance.fuelType,
      'price': instance.price,
      'liter': instance.liter,
      'totalPrice': instance.totalPrice,
    };
