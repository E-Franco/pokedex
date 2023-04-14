import 'package:get_it/get_it.dart';
import 'package:pokedex/features/presentation/pages/home/home_controller.dart';

import 'common/core/client/client.dart';
import 'features/domain/usecases/get_pokemon_by_name_usecase.dart';
import 'features/domain/usecases/get_pokemons_usecase.dart';
import 'features/external/datasources/pokemon_datasource_impl.dart';
import 'features/infra/repositories/pokemon_repository_impl.dart';
import 'features/presentation/controllers/value_notifier_home_controller.dart';

final serviceLocator = GetIt.instance;

void setUp() {
  final client = HttpClientImpl();
  final datasource = PokemonDatasourceImpl(client: client);
  final repository = PokemonRepositoryImpl(datasource: datasource);
  final getPokemonByName = GetPokemonByNameUsecase(repository: repository);
  final getPokemons = GetPokemonsUsecase(repository: repository);
  final controller = ValueNotifierHomeController(getPokemons: getPokemons, getPokemonByName: getPokemonByName);

  controller.init();
  serviceLocator.registerSingleton<HomeController>(controller);
}
