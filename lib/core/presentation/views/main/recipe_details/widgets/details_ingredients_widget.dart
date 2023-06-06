import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsIngredientsWidget extends StatelessWidget {
  final String? ingredients;

  const DetailsIngredientsWidget({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Html(
      data: '''$ingredients''',
    );
  }
}
