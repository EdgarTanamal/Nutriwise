part of 'widgets.dart';

class Card extends StatelessWidget {
  final String articlePicture;
  final String recMealsPicture;
  final String keywords;
  final String isSelected;
  final double calorieConsumed;
  final double calorieGoal;
  final String description;


  const Card({
    super.key,
    required this.calorieConsumed,
    required this.calorieGoal,
    this.articlePicture="e",
    this.recMealsPicture="e",
    this.keywords="e",
    this.description="e",
    this.isSelected="e",

  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

