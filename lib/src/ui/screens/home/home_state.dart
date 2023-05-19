import 'package:equatable/equatable.dart';

import '../../../domain/model/affiliate_model.dart';

class HomeViewState extends Equatable {
  final bool isLoading;
  final List<Affiliate> affiliates;

  const HomeViewState(
      {this.affiliates = const [] , this.isLoading = false});

  copyWith({
    List<Affiliate> ? affiliates,
    bool? isLoading,
  }) =>
      HomeViewState(
          affiliates: affiliates ?? this.affiliates,
          isLoading: isLoading ?? this.isLoading);
          
            @override
            List<Object?> get props => [affiliates,isLoading];
            
}
