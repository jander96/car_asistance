class HomeViewState {
  final bool isLoading;
  final int counter;

  HomeViewState({this.isLoading = true, this.counter = 0});

  copyWith({
    bool? isLoading,
    int? counter,
  }) => HomeViewState(
      isLoading: isLoading ?? this.isLoading,
      counter: counter ?? this.counter
  );
}