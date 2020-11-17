import 'package:shhnatycemexdriver/core/repositories/core_repository.dart';
import 'package:shhnatycemexdriver/features/truck_number/data/models/truck-number.dart';
import 'package:shhnatycemexdriver/core/results/result.dart';
import 'package:shhnatycemexdriver/core/models/empty_response_model.dart';
import 'dart:convert';
import 'package:shhnatycemexdriver/core/constants.dart';

class GetTruckNumberRepositoryImplementation  {


  Future<Result<List<TruckNumberModel> >> getAllAvailableTruck( ) async{
    List<TruckNumberModel> trucks = [];
    // TODO: implement getAllAvailableTruck
    final response = await CoreRepository.request(url: trunksUrl,method: HttpMethod.GET, converter: null);
      if(response.hasDataOnly) {
        final res =response.data;
        final data = json.decode(res.body);
        data.map((truck)=> trucks.add(TruckNumberModel.fromJson(truck))).toList();
        print(trucks);
        return Result(data: trucks);
      }
      if(response.hasErrorOnly) {
        return Result(error: response.error);
      }
  }

  /**
   * register truck number for the first time app was opened .
   */
  @override
  Future<Result<EmptyResultModel>> registerTruckNumber (
      TruckNumberModel truckNumberModel) async {
    // TODO: implement registerTruckNumber
    final response = await CoreRepository.request(url: trunksUrl,method: HttpMethod.POST, converter: null, data: truckNumberModel.toJson());
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
