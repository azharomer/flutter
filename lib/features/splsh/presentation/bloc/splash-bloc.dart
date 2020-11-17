import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/features/splsh/presentation/bloc/splash-state.dart';
import 'package:shhnatycemexdriver/features/splsh/presentation/bloc/splash-event.dart';
import 'package:get_storage/get_storage.dart';


class SplashBloc extends Bloc<BaseSplashEvent, BaseSplashState> {
  SplashBloc(BaseSplashState initialState) : super(initialState);

  @override
  Stream<BaseSplashState> mapEventToState(BaseSplashEvent event) async* {
    // TODO: implement mapEventToState
    try {
      if(event is GetSplashEvent){
        yield SplashLoadingState();
        final box = GetStorage();
        bool isFirstRun = box.read('isFirstRun');
        if(isFirstRun) {
          yield SplashSuccessState(goToTruckNumberPage: true);
        } else {
          yield SplashSuccessState(goToLoginPage: true);
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
