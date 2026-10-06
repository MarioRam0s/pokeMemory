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

  void updateTypes(Map<String, bool> items) {
    state = AsyncValue.data(state.value!.copyWith(types: items));
  }
}

class FilterState {
  int limit = 150;
  Map<String, bool> generation = {
    'first': false,
    'second': false,
    'third': false,
    'fourth': false,
    'fifth': true,
    'sixth': false,
    'seventh': false,
    'eighth': false,
    'ninth': false,
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
