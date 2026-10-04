class PokemonEntity {
  final int id;
  final String name;
  final int height;
  final String? image;
  final int weight;
  final List<Type> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
  });
}

class Type {
  final int slot;
  final Species type;

  Type({required this.slot, required this.type});
}

class Species {
  final String name;
  final String url;

  Species({required this.name, required this.url});
}
