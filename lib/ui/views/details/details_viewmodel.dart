import 'package:fastfood_menu_app/app/locator.dart';
import 'package:fastfood_menu_app/models/deal_model.dart';
import 'package:fastfood_menu_app/services/deal_service.dart';
import 'package:stacked/stacked.dart';

class DetailsViewModel extends BaseViewModel {
  final dealService = locator<DealService>();

  Deal get deal => dealService.dealIndexToShow!;
}
