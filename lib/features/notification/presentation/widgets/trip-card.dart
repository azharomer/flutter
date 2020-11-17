import 'package:flutter/material.dart';
import 'package:shhnatycemexdriver/features/trip_detail/presentation/pages/trip-detail.dart';

Widget displayCardDetail(context, String title, String subtitle) {
  return Card(
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
        color: Colors.transparent,
        onPressed: () {
          Navigator.pushNamed(context, TripDetail.routeName);
        },
      ),
    ),
  );
}
