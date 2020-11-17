import 'dart:convert';

import 'package:shhnatycemexdriver/core/constants.dart';
import 'package:shhnatycemexdriver/core/repositories/core_repository.dart';
import 'package:shhnatycemexdriver/core/results/result.dart';
import 'package:shhnatycemexdriver/core/models/empty_response_model.dart';
import 'package:shhnatycemexdriver/features/login/data/models/user.dart';
import 'package:shhnatycemexdriver/features/login/domain/repositories/user-repositories.dart';
import 'package:shhnatycemexdriver/features/truck_number/domain/repositories/truck-number-repositories.dart';
import 'package:shhnatycemexdriver/core/services/http_service/http_service.dart';

// TODO: I comment this class , till the API is ready @Abeer
class TruckNumberRepositoryImplementation implements UserRepository {
  final  httpCall = HttpService();

  @override
  Future<Result<EmptyResultModel>> loginUser (UserModel userModel) async {
    // TODO: implement LoginUser
    final response = await CoreRepository.request(url: trunksUrl,method: HttpMethod.POST, converter: null, data: userModel.toJson());
    if(response.hasDataOnly) {
      final res =response.data;
      final _data = json.decode(res.body);
      return Result(data: _data);
    }
    if(response.hasErrorOnly) {
      return Result(error: response.error);
    }
  }
}
