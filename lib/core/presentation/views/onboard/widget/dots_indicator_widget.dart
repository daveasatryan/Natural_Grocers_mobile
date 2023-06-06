import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';

class DotsIndicatorWidget extends StatefulWidget {
  DotsIndicatorWidget({
    super.key,
    required this.color,
    required this.position,
  });

  Color color;
  int position;

  @override
  State<DotsIndicatorWidget> createState() => _DotsIndicatorWidgetState();
}

class _DotsIndicatorWidgetState extends State<DotsIndicatorWidget> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    List<DotsItemWidget> listDots = [
      DotsItemWidget(
        color: context.colors.appSecondaryColor,
      ),
      DotsItemWidget(
        color: context.colors.appSecondaryColor,
      ),
      DotsItemWidget(
        color: context.colors.appSecondaryColor,
      ),
      DotsItemWidget(
        color: context.colors.appSecondaryColor,
      ),
      DotsItemWidget(
        color: context.colors.appSecondaryColor,
      ),
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 8,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listDots.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              for (var i = 0; i <= widget.position; i++) {
                listDots[i].color = context.colors.dotsColor;
              }
              return Padding(
                padding: const EdgeInsets.only(
                  left: 2,
                  right: 2,
                ),
                child: listDots[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class DotsItemWidget extends StatelessWidget {
  DotsItemWidget({
    super.key,
    required this.color,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.sp,
      height: 8.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
    );
  }
}
