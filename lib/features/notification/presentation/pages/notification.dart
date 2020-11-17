import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/features/notification/data/models/notification-model.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/bloc/notifications-bloc.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/bloc/notifications-events.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/bloc/notifications-state.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/widgets/trip-card.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidgetState createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> {
  NotificationBloc _bloc;
  NotificationModel obj1 = new NotificationModel(
      title: 'Cemex Trip', subTitle: 'it is new Cemex Trip');
  NotificationModel obj2 = new NotificationModel(
      title: 'Galaxy Trip', subTitle: 'it is new Galaxy Trip');

  List<Widget> notficationArray = [];
  void initState() {
    _bloc = NotificationBloc(NotificationSuccessState(notificationsList: []));
    this._bloc.add(GetAllNotificationEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  ListView DisplayNotificationList() {
    return ListView(children: this.notficationArray);
  }

  @override
  Widget build(BuildContext context) {
    this.notficationArray = [
      displayCardDetail(context, obj1.title, obj1.subTitle),
      displayCardDetail(context, obj2.title, obj2.subTitle)
    ];
    // TODO: implement build
    return Container(
        // start bloc
        child: BlocConsumer(
            cubit: _bloc,
            builder: (context, state) {
              return DisplayNotificationList();
            },
            listener: (context, state) {
              if (state is NotificationSuccessState) {
                // @TODO:: here set the returned notification list
                // this.notficationArray = state.notificationsList;
                // print('success ' + this.notficationArray.length.toString());
              }
            })
        // end of bloc
        );
  }
}
