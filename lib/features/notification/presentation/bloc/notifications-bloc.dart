import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/core/base_bloc/base_bloc.dart';
import 'package:shhnatycemexdriver/features/notification/data/models/notification-model.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/bloc/notifications-events.dart';
import 'package:shhnatycemexdriver/features/notification/presentation/bloc/notifications-state.dart';

class NotificationBloc extends Bloc<BaseEvent, NotificationSuccessState> {
  NotificationBloc(NotificationSuccessState initialState) : super(initialState);
  @override
  Stream<NotificationSuccessState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState

    if (event is Yield) {
      if (event.state is NotificationSuccessState) {
        yield event.state;
      }
    }
    if (event is GetAllNotificationEvent) {
      /**
      *  @TODO:: here we need to calll get all notificatiion 
      repository instead of static array
      */
      // NotificationModel obj1 = new NotificationModel(
      //     title: 'Cemex Trip', subTitle: 'it is new Cemex Trip');
      // NotificationModel obj2 = new NotificationModel(
      //     title: 'Galaxy Trip', subTitle: 'it is new Galaxy Trip');

      // List<NotificationModel> arr = [obj1, obj2];
      this.add(Yield(state.copyWith(notificationsList: [])));
    }
  }
}
