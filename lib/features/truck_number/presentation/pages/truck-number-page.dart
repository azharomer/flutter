import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/core/constants.dart';
import 'package:shhnatycemexdriver/core/services/navigation_service/navigation_service.dart';
import 'package:shhnatycemexdriver/features/login/presentation/pages/login-page.dart';
import 'package:flutter/material.dart';
import 'package:shhnatycemexdriver/features/truck_number/presentation/bloc/truck-number-bloc.dart';
import 'package:shhnatycemexdriver/features/truck_number/presentation/bloc/truck-number-event.dart';
import 'package:shhnatycemexdriver/features/truck_number/presentation/bloc/truck-number-state.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:shhnatycemexdriver/core/app_shared_prefs.dart';
import 'package:shhnatycemexdriver/features/truck_number/data/models/truck-number.dart';

class TruckNumberWidget extends StatefulWidget {

  static const routeName = 'TruckNumberWidget';

  TruckNumberWidgetState createState() => TruckNumberWidgetState();
}

class TruckNumberWidgetState extends State<TruckNumberWidget> {

  TruckNumberBloc _bloc;
  TextEditingController truckIdController = TextEditingController();
  Map<String, String> selectedValueMap = Map();
  TruckNumberModel truckNumberModel = new TruckNumberModel(TruckNumber: '', SapTruckNumber: '', FirebaseToken: '');

  @override
  void initState() {
    _bloc.add(GetTruckNumberListEvent());
    selectedValueMap['server'] = null;

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var name = '';
    // TODO: implement build
    return Scaffold(
      body: new SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(SHHNATY_BACK_GROUND),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
          child: BlocConsumer(
              cubit: _bloc,
              builder: (context, state) {
                /// e.g. if loading return laoder
                /// if sucssess return green widget
                /// if state is Error state retrn ErrorWidget

              if(state is TruckSuccessState)
              {
                return Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.width / 3 * 2, 0, 0),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: Colors.grey,
                              primaryColorDark: Colors.grey,
                            ),
                            child: getSearchableDropdown(state.truckNumberList),
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      ),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width,
                              child: new RaisedButton(
                                elevation: 5.0,
                                color: Colors.blue[700],
                                child: new Text("GET STARTED",
                                    style: new TextStyle(
                                        fontFamily: 'Manjari',
                                        fontSize: 15.0,
                                        color: Colors.white)),
                                onPressed: () {
                                  _bloc.add(SelectTruckNumberEvent(truckNumberModel));
                                },
                              ),
                            )),
                      )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      ),
                    ],
                  ),

                );
              }
              return Container();
              },
              listener: (context, state) {

                /// if state is first run ->>> go to TruckNumberPage
                /// if state is notFirstRun ->>> go to Login Page

                if (state is TruckSuccessState)
                  Navigator.pushReplacementNamed(
                      context, LoginWidget.routeName);
                // gNavigationService.pushNamed(LoginWidget.routeName);
              })
          // start displaying data

          //  end of displaying data
          ),
    ),
    );
  }
  Widget getSearchableDropdown(List<TruckNumberModel> listData) {
    List<DropdownMenuItem> items = [];
    listData.map((item) => items.add(new DropdownMenuItem(child: new Text(item.TruckNumber,),value:item,) ));

    return new SearchableDropdown(
      items: items,
      value: truckNumberModel,
      isCaseSensitiveSearch: false,
      hint: new Text(
          'Select One'
      ),
      searchHint: new Text(
        'Select Truck',
        style: new TextStyle(
            fontSize: 20
        ),
      ),
      onChanged: (value) {
        setState(() {
          truckNumberModel= value;
        });
      },
    );
  }
}
