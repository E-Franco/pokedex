import 'package:flutter/material.dart';

import '../../../../../common/core/contants/colors.dart';
import 'components/home_appbar.dart';
import 'components/home_pokemon_list.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: const [
          HomeAppBar(),
          Expanded(
            child: HomePokemonList(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
