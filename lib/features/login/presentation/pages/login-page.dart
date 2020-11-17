import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:shhnatycemexdriver/features/home/presentation/pages/home.dart';
import 'package:shhnatycemexdriver/features/login/data/models/user.dart';
import 'package:shhnatycemexdriver/features/login/presentation/bloc/login-bloc.dart';
import 'package:shhnatycemexdriver/features/login/presentation/bloc/login-events.dart';
import 'package:shhnatycemexdriver/features/login/presentation/bloc/login-state.dart';

class LoginWidget extends StatefulWidget {
  static const routeName = 'LoginWidget';

  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  LoginBloc _bloc;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _userNameValidate = false;
  bool _passwordValidate = false;
  UserModel user = new UserModel(UserName: '', Password: '', BarcodeNumber: '');
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = LoginBloc(LoginSuccessState());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  _scan(context) async {
    await FlutterBarcodeScanner.scanBarcode(
            "#FF7F00", "Cancel", true, ScanMode.QR)
        .then((value) => {
              Navigator.pushReplacementNamed(context, HomeWidget.routeName,
                  arguments: {"id": 0})
            });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          onPressed: () => _scan(context),
          child: Icon(Icons.qr_code_scanner),
        ),
        body: BlocConsumer(
            cubit: _bloc,
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(SHHNATY_BACK_GROUND),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 60, 0, 0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Theme(
                                      data: new ThemeData(
                                        primaryColor: Colors.grey,
                                        primaryColorDark: Colors.grey,
                                      ),
                                      child: TextFormField(
                                          controller: userNameController,
                                          onChanged: (value) => {
                                            this.user?.UserName =
                                                userNameController.text.toString()
                                          },
                                          autofocus: true,
                                          style: TextStyle(
                                            color: Colors.white,
                                            decorationColor: Colors.black,
                                          ),
                                          decoration: new InputDecoration(
                                            // labelText: 'User Name',
                                            hintText: 'User Name',
                                            hintStyle: TextStyle(color: Colors.white),
                                            labelStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white,
                                            focusColor: Colors.white,
                                            hoverColor: Colors.white,
                                            errorText:'',
                                          ),
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return 'Please enter value';
                                            }
                                            return null;
                                          }
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Theme(
                                      data: new ThemeData(
                                        primaryColor: Colors.grey,
                                        primaryColorDark: Colors.grey,
                                      ),
                                      child: TextFormField(
                                        obscureText: true,
                                        controller: passwordController,
                                        onChanged: (value) => {
                                          this.user?.Password =
                                              passwordController.text.toString()
                                        },
                                        autofocus: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                          decorationColor: Colors.black,
                                        ),
                                        decoration: new InputDecoration(
                                          // labelText: 'Password',
                                            hintText: 'Password',
                                            labelStyle: TextStyle(color: Colors.white),
                                            hintStyle: TextStyle(color: Colors.white),
                                            fillColor: Colors.white,
                                            focusColor: Colors.white,
                                            hoverColor: Colors.white),
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return 'Please enter value';
                                            }
                                            return null;
                                          }
                                      ),
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
                                              child: new Text("Login",
                                                  style: new TextStyle(
                                                      fontFamily: 'Manjari',
                                                      fontSize: 15.0,
                                                      color: Colors.white)),
                                              onPressed: () {
                                                if(!_formKey.currentState.validate()) {
                                                  return;
                                                }
                                                if (_formKey.currentState.validate()) {
                                                  // If the form is valid, display a Snackbar.
                                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                                                  print(this.user?.UserName);
                                                  print(this.user?.Password);
                                                  _bloc.add(LoginEvent(userModel: this.user));
                                                }
                                                // Navigator.pushReplacementNamed(
                                                //     context, '/tabs',
                                                //     arguments: {"id": 0});
                                              },
                                            ),
                                          )),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                ),
                              ],
                      )
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is LoginSuccessState)
                Navigator.pushReplacementNamed(context, HomeWidget.routeName,
                    arguments: {"id": 0});
            }));
  }
}
