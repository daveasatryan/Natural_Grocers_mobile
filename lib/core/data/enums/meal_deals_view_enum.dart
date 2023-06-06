import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

enum ListViewType {
  mapView,
  listView,
  gridView;

  String get title {
    switch (this) {
      case ListViewType.mapView:
        return AppLocale.current.map_view;
      case ListViewType.listView:
        return AppLocale.current.grid_view;
      case ListViewType.gridView:
        return AppLocale.current.list_view;
    }
  }

  String get titleInStores {
    switch (this) {
      case ListViewType.mapView:
        return AppLocale.current.list_view;
      case ListViewType.listView:
        return AppLocale.current.map_view;
      case ListViewType.gridView:
        return '';
    }
  }
}
