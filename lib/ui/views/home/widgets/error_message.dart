import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';

class ErrorMessage extends ViewModelWidget<HomeViewModel> {
  const ErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please check your internet conenction'),
          ElevatedButton(
              onPressed: () {
                viewModel.initialise();
              },
              child: const Text('Refresh')),
        ],
      ),
    );
  }
}
