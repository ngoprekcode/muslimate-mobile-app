import 'package:injectable/injectable.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class GetMaintenanceModeUseCase {
  final AuthRepository repository;
  GetMaintenanceModeUseCase(this.repository);

  Future<bool> call() async {
    return await repository.getIsMaintenanceModeActive();
  }
}