import 'package:equatable/equatable.dart';

class FavoriteViewState extends Equatable {
  final List<String> favorites;
  final bool isFavorite;

  const FavoriteViewState({this.favorites = const [], this.isFavorite = false});

  FavoriteViewState copyWith({List<String>? favorites, bool? isFavorite}) =>
      FavoriteViewState(
        favorites: favorites ?? this.favorites,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object?> get props => [favorites, isFavorite];
}
