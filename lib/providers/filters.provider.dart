import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = AsyncNotifierProvider<FilterNotifier, FilterState>(
  FilterNotifier.new,
);

class FilterNotifier extends AsyncNotifier<FilterState> {
  @override
  Future<FilterState> build() async {
    return FilterState();
  }

  void updateGenerations(Map<String, bool> generations) {
    state = AsyncValue.data(state.value!.copyWith(generation: generations));
  }
}

class FilterState {
  int limit = 150;
  Map<String, bool> generation = {
    'primary': false,
    'secondary': false,
    'tertiary': false,
    'quaternary': false,
    'quinary': true,
    'senary': false,
    'septenary': false,
    'octonary': false,
    'nonary': false,
  };
  Map<String, bool> types = {
    'normal': false,
    'fire': false,
    'water': false,
    'electric': false,
    'grass': false,
    'ice': false,
    'fighting': false,
    'poison': false,
    'ground': false,
    'flying': false,
    'psychic': false,
    'bug': false,
    'rock': false,
    'ghost': false,
    'dragon': false,
    'dark': false,
    'steel': false,
    'fairy': false,
  };
  bool isFavorite = false;
  bool isAll = true;
  String search = '';

  FilterState copyWith({
    int? limit,
    Map<String, bool>? generation,
    Map<String, bool>? types,
    bool? isFavorite,
    bool? isAll,
    String? search,
  }) {
    return FilterState()
      ..limit = limit ?? this.limit
      ..generation = generation ?? this.generation
      ..types = types ?? this.types
      ..isFavorite = isFavorite ?? this.isFavorite
      ..isAll = isAll ?? this.isAll
      ..search = search ?? this.search;
  }
}
