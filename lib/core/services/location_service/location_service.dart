// import 'dart:developer';
// import 'package:shhnatycemexdriver/core/errors/base_error.dart';
// import 'package:shhnatycemexdriver/core/errors/unexpected_error.dart';
// import 'package:dartz/dartz.dart';
// import 'package:location/location.dart';

// class LocationService {
//   Location location = new Location();

//   /**
//    * this function for check and request location GPS service in Android
//    */
//   Future<Either<BaseError, bool>> checkAndRequestLocationService() async {
//     bool _serviceEnabled;
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return Left(UnExpectedError());
//       } else {
//         return Right(true);
//       }
//     } else {
//       return Right(true);
//     }
//   }

// /**
//    * this function for check has permission for  location GPS service in IOS
//    */
//   Future<Either<BaseError, bool>> checkPermissionGranted() async {
//     PermissionStatus _permissionGranted;
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return Left(UnExpectedError());
//       } else {
//         return Right(true);
//       }
//     } else {
//       return Right(true);
//     }
//   }

//   /**
//    * this method get current user Location
//    */
//   Future<Either<BaseError, LocationData>> getCurrentLocation() async {
//     try {
//       LocationData _locationData;

//       final serviceEnabledResult = await checkAndRequestLocationService();
//       if (serviceEnabledResult.isLeft()) return Left(UnExpectedError());

//       final hasPermissionResult = await checkPermissionGranted();
//       if (hasPermissionResult.isLeft()) return Left(UnExpectedError());

//       _locationData = await location.getLocation();
//       return Right(_locationData);
//     } catch (error) {
//       return Left(UnExpectedError());
//     }
//   }
// }
