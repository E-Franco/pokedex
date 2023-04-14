import 'package:flutter/material.dart';

import '../../../../../service_locator.dart';
import '../home_controller.dart';

class HomeTryAgainComponent extends StatelessWidget {
  const HomeTryAgainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Something went wrong',
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: _tryAgain,
            child: const Text(
              'Try again',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _tryAgain() {
    serviceLocator.get<HomeController>().fetchPokemons();
  }
}
