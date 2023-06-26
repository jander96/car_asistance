import 'package:equatable/equatable.dart';

class SheetViewState extends Equatable {
  final List<String> favorites;
  final bool isFavorite;

  const SheetViewState({this.favorites = const [], this.isFavorite = false});

  SheetViewState copyWith({List<String>? favorites, bool? isFavorite}) =>
      SheetViewState(
        favorites: favorites ?? this.favorites,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object?> get props => [favorites, isFavorite];
}
