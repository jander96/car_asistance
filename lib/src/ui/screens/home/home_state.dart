import '../../../domain/model/affiliate_model.dart';

class HomeViewState {
  final bool isLoading;
  final Stream<List<Affiliate>> streamOfAffiliates;

  HomeViewState(
      {this.streamOfAffiliates = const Stream.empty(), this.isLoading = true});

  copyWith({
    Stream<List<Affiliate>>? streamOfAffiliates,
    bool? isLoading,
  }) =>
      HomeViewState(
          streamOfAffiliates: streamOfAffiliates ?? this.streamOfAffiliates,
          isLoading: isLoading ?? this.isLoading);
}
