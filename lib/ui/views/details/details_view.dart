import 'package:fastfood_menu_app/ui/views/details/details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'widgets/order_button.dart';
import 'widgets/restaurant_title.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsViewModel>.nonReactive(
      viewModelBuilder: () => DetailsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    const RestaurantTitle(),
                    const SizedBox(height: 70),
                    Text(
                      'Deal ' + (model.deal.index + 1).toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ] +
                  itemToWidgets(model.deal.items) +
                  [
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        Text(
                          model.deal.price,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        )
                      ],
                    ),
                    const Spacer(),
                    const OrderButton()
                  ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> itemToWidgets(List<dynamic> items) {
    List<Widget> itemList = <Widget>[];
    for (var item in items) {
      itemList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item['name'],
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Text(
              'x' + item['quantity'].toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      );
    }
    return itemList;
  }
}
