import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsDirectionsWidget extends StatelessWidget {
  final String? directions;

  const DetailsDirectionsWidget({
    super.key,
    required this.directions,
  });

  @override
  Widget build(BuildContext context) {
    return Html(
      data: '''$directions''',
    );
  }
}
