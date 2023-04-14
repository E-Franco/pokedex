import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/core/contants/constants.dart';
import '../../../../../common/core/extensions/extensions.dart';
import '../../../../../common/domain/entities/pokemon.dart';
import '../../../../../service_locator.dart';
import '../../../../core/factories/controllers/details_controller_factory.dart';
import '../../details/details_page.dart';
import '../home_controller.dart';

class HomePokemonCard extends StatelessWidget {
  const HomePokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _proceed(context),
      child: Container(
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Hero(
                        tag: pokemon.id,
                        child: CachedNetworkImage(imageUrl: pokemon.image),
                      ),
                    ),
                  ),
                  Text(
                    pokemon.name.upperCaseWords(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _proceed(BuildContext context) {
    final pokemons = serviceLocator.get<HomeController>().pokemons.value;
    final controller = makeDetailsController(pokemons, pokemon);
    

    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => DetailsPage(controller: controller),
      ),
    );
  }
}
