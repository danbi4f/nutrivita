import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';



@JsonSerializable()
class Food {
  @JsonKey(name: 'SurveyFoods')
  final List<SurveyFood> surveyFoods;

  const Food({
    required this.surveyFoods,
  });

  static const empty = Food(surveyFoods: []);

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
