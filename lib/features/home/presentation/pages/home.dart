import 'package:flutter/material.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/pages/notification.dart';
import 'package:shhnatycemexdriver/features/trip/presentation/pages/trip.dart';

class HomeWidget extends StatefulWidget {
  static const routeName = 'HomeWidget';

  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvData =
        ModalRoute.of(context).settings.arguments;
    this.selectedIndex = rcvData['id'];
    return DefaultTabController(
        initialIndex: selectedIndex,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: PreferredSize(
                child: TabBar(
                  labelColor: Colors.red,
                  indicatorColor: Colors.red,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'My Trip',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                preferredSize: Size.fromHeight(9.0)),
          ),
          body: TabBarView(
            children: <Widget>[
              NotificationWidget(),
              TripWidget()
              // NotificationWidget(),
              // TripLocation(),
            ],
          ),
        ));
  }
}
