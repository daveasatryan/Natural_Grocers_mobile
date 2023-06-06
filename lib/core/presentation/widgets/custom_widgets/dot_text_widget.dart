import 'package:flutter/material.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';

class DotTextWidget extends StatelessWidget with BaseStatelessMixin {
  DotTextWidget({
    super.key,
    required this.text,
    this.style,
  });

  String text;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '• ',
          style: style,
        ),
        Expanded(
          child: Text(
            text,
            style: style,
          ),
        ),
      ],
    );
  }
}
