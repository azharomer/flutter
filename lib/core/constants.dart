import 'package:flutter/material.dart';
import 'package:shhnatycemexdriver/core/screen_utils/screen_utils.dart';

const String TAG = 'Abeer >>>>>>';
const APP_NAME = 'Shhnaty';
// URL
const String baseUrl = "http://jsonplaceholder.typicode.com";
const String trunksUrl = baseUrl + "/posts";


const FONT_FAMILY = 'Manjari';

const KEY_FIRST_START = '${APP_NAME}KEY_FIRST_START';
const KEY_FIRE_BASE_TOKEN = '${APP_NAME}KEY_FIRE_BASE_TOKEN';
const KEY_CALENDAR_ID = '${APP_NAME}CALENDAR_ID';


// ignore: non_constant_identifier_names
final HORIZONTAL_PADDING = ScreensHelper.fromWidth(4.5);

const SESSION_STATUS_DRAFT = 'Draft';
const SESSION_STATUS_CONFIRMED = 'Draft';
const SESSION_STATUS_CANCELLED = 'Draft';
const SESSION_STATUS_PENDING = 'Pending';
const SHHNATY_BACK_GROUND = 'assets/bg.png';

const EDIT_MODE = 'edit';
const ADD_MODE = 'add';

const USER_TYPE_PT = 'PT';
const USER_TYPE_CLIENT = 'Client';

// ignore: non_constant_identifier_names
final double GENERAL_HORIZONTAL_PADDING = ScreensHelper.fromWidth(4.5);
// ignore: non_constant_identifier_names
final BorderRadius GLOBAL_BORDER_RADIUS =
    BorderRadius.circular(ScreensHelper.fromWidth(1.5));

const int MIN_PASSWORD_LENGTH = 6;
const int CODE_LENGTH = 5;
