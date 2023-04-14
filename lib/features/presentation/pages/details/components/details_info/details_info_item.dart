import 'package:flutter/material.dart';
import 'package:pokedex/common/core/contants/constants.dart';

class DetailsInfoItem extends StatelessWidget {
  const DetailsInfoItem({
    super.key,
    required this.info,
    required this.content,
  });

  final String info;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 8),
          Expanded(child: content),
          Text(
            info,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mediumGray,
            ),
          ),
        ],
      ),
    );
  }
}
