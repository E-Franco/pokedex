import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/core/contants/constants.dart';

class DetailsPokeballComponent extends StatelessWidget {
  const DetailsPokeballComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.pokeball,
      width: MediaQuery.of(context).size.width * .6,
      colorFilter: ColorFilter.mode(
        Colors.white.withOpacity(0.15),
        BlendMode.srcIn,
      ),
    );
  }
}
