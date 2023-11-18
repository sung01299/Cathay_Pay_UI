import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cathay_pay_ui/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeAPIServiceProvider = Provider<HomeAPIService>((ref) {
  final service = HomeAPIService();
  return service;
});

class HomeAPIService {
  HomeAPIService();

  // Future<List<Trip>> getTrips() async {
  //   try {
  //     final request = ModelQueries.list(Trip.classType);
  //     final response = await Amplify.API.query(request: request).response;

  //     final trips = response.data?.items;
  //     if (trips == null) {
  //       safePrint('getTrips errors: ${response.errors}');
  //       return const [];
  //     }
  //     trips.sort(
  //       (a, b) =>
  //           a!.startDate.getDateTime().compareTo(b!.startDate.getDateTime()),
  //     );
  //     return trips
  //         .map((e) => e as Trip)
  //         .where(
  //           (element) => element.endDate.getDateTime().isAfter(DateTime.now()),
  //         )
  //         .toList();
  //   } on Exception catch (error) {
  //     safePrint('getTrips failed: $error');

  //     return const [];
  //   }
  // }

  // Future<List<Trip>> getPastTrips() async {
  //   try {
  //     final request = ModelQueries.list(Trip.classType);
  //     final response = await Amplify.API.query(request: request).response;

  //     final trips = response.data?.items;
  //     if (trips == null) {
  //       safePrint('getPastTrips errors: ${response.errors}');
  //       return const [];
  //     }
  //     trips.sort(
  //       (a, b) =>
  //           a!.startDate.getDateTime().compareTo(b!.startDate.getDateTime()),
  //     );
  //     return trips
  //         .map((e) => e as Trip)
  //         .where(
  //           (element) => element.endDate.getDateTime().isBefore(DateTime.now()),
  //         )
  //         .toList();
  //   } on Exception catch (error) {
  //     safePrint('getPastTrips failed: $error');

  //     return const [];
  //   }
  // }

  // Future<void> addTrip(Trip trip) async {
  //   try {
  //     final request = ModelMutations.create(trip);
  //     final response = await Amplify.API.mutate(request: request).response;

  //     final createdTrip = response.data;
  //     if (createdTrip == null) {
  //       safePrint('addTrip errors: ${response.errors}');
  //       return;
  //     }
  //   } on Exception catch (error) {
  //     safePrint('addTrip failed: $error');
  //   }
  // }

  // Future<void> deleteTrip(Trip trip) async {
  //   try {
  //     await Amplify.API
  //         .mutate(
  //           request: ModelMutations.delete(trip),
  //         )
  //         .response;
  //   } on Exception catch (error) {
  //     safePrint('deleteTrip failed: $error');
  //   }
  // }

  // Future<void> updateTrip(Trip updatedTrip) async {
  //   try {
  //     await Amplify.API
  //         .mutate(
  //           request: ModelMutations.update(updatedTrip),
  //         )
  //         .response;
  //   } on Exception catch (error) {
  //     safePrint('updateTrip failed: $error');
  //   }
  // }

  Future<User> getUser(String userId) async {
    try {
      final request = ModelQueries.get(
        User.classType,
        UserModelIdentifier(id: userId),
      );
      final response = await Amplify.API.query(request: request).response;

      final user = response.data!;
      return user;
    } on Exception catch (error) {
      safePrint('getUser failed: $error');
      rethrow;
    }
  }
}