import 'package:fastfood_menu_app/ui/views/details/details_view.dart';
import 'package:fastfood_menu_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/error_message.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.initialization(),
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
              floatingActionButton: Container(
                margin: EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      elevation: 10,
                      onPressed: () => model.createNotification(),
                      label: Text(
                        'Random Notification Generator',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      backgroundColor: Color(0xFF121212),
                    ),
                  ],
                ),
              ),
              appBar: customAppBar(),
              body: model.hasError
                  ? const ErrorMessage()
                  : model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 22, left: 20, right: 20, bottom: 2),
                          itemCount: model.data.length,
                          itemBuilder: (BuildContext context, int ind) {
                            return GestureDetector(
                              onTap: () {
                                model.setDealToShow(model.data[ind]);
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailsView()))
                                    .then((value) => model.setDealToShow(null));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.amber[800],
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 8,
                                      color: Colors.black.withOpacity(0.3),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Deal ' +
                                                (model.data[ind].index + 1)
                                                    .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 30),
                                          Text(
                                            model.itemListMaker(
                                                model.data[ind].items),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          model.data[ind].price,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
            ));
  }

  AppBar customAppBar() {
    return AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Center(
          child: Text(
            'FastFood Deals',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
