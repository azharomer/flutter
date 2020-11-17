import 'package:shhnatycemexdriver/core/base_bloc/base_bloc.dart';
import 'package:shhnatycemexdriver/features/notification/data/models/notification-model.dart';

class NotificationSuccessState extends BaseSuccessState {
  List<NotificationModel> notificationsList = [];
  NotificationSuccessState({notificationsList});
  NotificationSuccessState copyWith({notificationsList}) {
    return NotificationSuccessState(
        notificationsList: notificationsList ?? this.notificationsList);
  }
}
