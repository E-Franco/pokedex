import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/features/presentation/pages/home/home_controller.dart';
import 'package:pokedex/service_locator.dart';

class DetailsPortraitComponent extends StatelessWidget {
  DetailsPortraitComponent({
    super.key,
    required this.pokemon,
    required this.onNextPressed,
    required this.onPreviousPressed,
    required this.isFirst,
    required this.isLast,
  });

  final PokemonEntity pokemon;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final bool isFirst, isLast;
  final controller = serviceLocator.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: isFirst ? 0 : 1,
              child: IconButton(
                onPressed: isFirst ? null : onPreviousPressed,
                icon: const Icon(Icons.chevron_left),
                color: Colors.white,
                iconSize: 32,
              ),
            ),
            Hero(
              tag: pokemon.id,
              child: CachedNetworkImage(
                imageUrl: pokemon.image,
                width: 200,
                height: 200,
              ),
            ),
            Opacity(
              opacity: isLast ? 0 : 1,
              child: IconButton(
                onPressed: isLast ? null : onNextPressed,
                icon: const Icon(Icons.chevron_right),
                color: Colors.white,
                iconSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
