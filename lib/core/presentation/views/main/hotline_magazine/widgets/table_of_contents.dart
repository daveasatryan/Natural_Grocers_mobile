import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/table_of_contents_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';

class TableOfContents extends StatelessWidget {
  TableOfContents({super.key});

  List<TableOfContentsModel> tableOfContentsModel = TableOfContentsModel.getContentsTableModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: context.colors.greyColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 30.sp),
              Text(
                context.strings.table_of_contents,
                style: context.fonts.latoMedium,
              ),
              IconButton(
                icon: Icon(Icons.chevron_right_rounded, size: 30.sp),
                onPressed: () {},
              )
            ],
          ),
        ),
        SizedBox(height: 10.sp),
        ListView.separated(
          shrinkWrap: true,
          itemCount: tableOfContentsModel.length,
          separatorBuilder: (context, index) => Divider(color: context.colors.greyColor),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            TableOfContentsModel model = tableOfContentsModel[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: ListTileTheme(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                minLeadingWidth: 0,
                dense: true,
                child: Theme(
                  data: ThemeData().copyWith(
                    dividerColor: context.colors.transparent,
                    splashColor: context.colors.transparent,
                  ),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    tilePadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    iconColor: context.colors.borderTrueColor,
                    title: Text(
                      model.title,
                      style: context.fonts.latoBold.copyWith(
                        fontSize: 13.sp,
                        color: context.colors.black,
                      ),
                    ),
                    trailing: Text(
                      model.count.toString(),
                      style: context.fonts.latoLight.copyWith(
                        color: context.colors.greyColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
