import 'package:flutter/material.dart';

import '../../../../../common/core/contants/colors.dart';

class HomeLoadingComponent extends StatelessWidget {
  const HomeLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.black.withOpacity(.2),
          )
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.zero,
      alignment: FractionalOffset.center,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
