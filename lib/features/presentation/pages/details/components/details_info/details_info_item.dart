import 'package:flutter/material.dart';

import '../../../../../../common/core/contants/constants.dart';

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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.30,
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
