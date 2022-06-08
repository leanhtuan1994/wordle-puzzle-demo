// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guess_daily_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuessDailyResult _$GuessDailyResultFromJson(Map<String, dynamic> json) =>
    GuessDailyResult(
      slot: json['slot'] as int?,
      guess: json['guess'] as String?,
      result: json['result'] as String?,
    );

Map<String, dynamic> _$GuessDailyResultToJson(GuessDailyResult instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'guess': instance.guess,
      'result': instance.result,
    };
