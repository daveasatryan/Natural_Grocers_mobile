import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

class TableOfContentsModel {
  String title;
  int count;

  TableOfContentsModel({
    required this.title,
    required this.count,
  });

  static final List<TableOfContentsModel> _values = [
    TableOfContentsModel(title: AppLocale.current.events, count: 28),
    TableOfContentsModel(title: AppLocale.current.articles, count: 2),
    TableOfContentsModel(title: AppLocale.current.recipes_text, count: 11),
    TableOfContentsModel(title: AppLocale.current.natural_grocers_products, count: 18),
    TableOfContentsModel(title: AppLocale.current.deals, count: 4),
  ];

  static List<TableOfContentsModel> get getContentsTableModel => _values;
}
