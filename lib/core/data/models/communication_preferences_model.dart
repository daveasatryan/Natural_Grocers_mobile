import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';

class CommunicationPreferencesModel {
  static final List<String> _values = [
    AppLocale.current.loyalty_point_rewards,
    AppLocale.current.exclusive_coupons,
    AppLocale.current.delicious_recipes,
    AppLocale.current.educational_resources,
    AppLocale.current.preferred_store_events,
    AppLocale.current.surveys,
  ];

  static List<String> get getCommunicationPreferences => _values;
}
