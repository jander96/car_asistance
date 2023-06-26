import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/repositories/affiliate_repository.dart';

import '../model/affiliate_model.dart';

class GetAffiliateByIdUseCase {
  final AffiliateRepository _repository;
  GetAffiliateByIdUseCase() : _repository = injector.get<AffiliateRepository>();

  Future<Affiliate> get(String id) => _repository.getAffiliateById(id);
}
