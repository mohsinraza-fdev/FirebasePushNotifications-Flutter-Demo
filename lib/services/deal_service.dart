import 'package:fastfood_menu_app/models/deal_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DealService {
  Deal? _dealIndexToShow;
  Deal? get dealIndexToShow => _dealIndexToShow;
  set dealIndexToShow(Deal? value) {
    _dealIndexToShow = value;
  }
}
