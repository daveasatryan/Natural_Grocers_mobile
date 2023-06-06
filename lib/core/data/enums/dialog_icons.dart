import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';

enum DialogIcons {
  done,
  error,
  question;

  String get svgIcon {
    switch (this) {
      case DialogIcons.done:
        return AppAssets.doneDialogIcon;
      case DialogIcons.error:
        return AppAssets.errorDialogIcon;
      case DialogIcons.question:
        return AppAssets.questionIcon;
    }
  }
}
