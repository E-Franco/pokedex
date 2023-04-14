import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/core/contants/constants.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.pokeball,
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            const Text(
              Labels.pokedex,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
