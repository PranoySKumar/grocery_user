import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class Store {
  String? deliveryTime;
  Store({this.deliveryTime});

  List<TimeOfDay> get getRange => deliveryTime!
      .split("-")
      .map((item) =>
          TimeOfDay(hour: int.parse(item.split(":")[0]), minute: int.parse(item.split(":")[1])))
      .toList();

  String timeInLocal() {
    final now = DateTime.now();
    final startDt = DateTime(now.year, now.month, now.day, getRange[0].hour, getRange[0].minute);
    final endDt = DateTime(now.year, now.month, now.day, getRange[1].hour, getRange[1].minute);

    final format = DateFormat.jm();
    return "${format.format(startDt).replaceFirst(" ", "")} - ${format.format(endDt).replaceFirst(" ", "")}";
  }

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> get toJson => _$StoreToJson(this);
}

//9:00-14:00 