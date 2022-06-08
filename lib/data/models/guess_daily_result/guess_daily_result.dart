import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guess_daily_result.g.dart';

@JsonSerializable()
class GuessDailyResult extends Equatable {
  final int? slot;
  final String? guess;

  final String? result;

  const GuessDailyResult({this.slot, this.guess, this.result});

  factory GuessDailyResult.fromJson(Map<String, dynamic> json) {
    return _$GuessDailyResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GuessDailyResultToJson(this);

  @override
  List<Object?> get props => [slot, guess, result];
}
