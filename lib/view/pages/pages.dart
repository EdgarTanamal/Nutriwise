import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:diabets/model/survey.dart';
import 'package:diabets/view/pages/resultPage.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:diabets/shared/shared.dart';
import 'package:diabets/view/widgets/widgets.dart';
import 'package:diabets/viewmodel/viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:diabets/model/survey.dart';
import 'package:diabets/shared/shared.dart';
import 'package:diabets/view/widgets/widgets.dart';
import 'package:diabets/viewmodel/viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';  // <-- Add this import
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:test/expect.dart';



part 'register_page.dart';
part 'login_page.dart';
part 'splashscreen_page.dart';
part 'home_page.dart';
part 'article_page.dart';
part 'history_daily_meal_page.dart';
part 'introScreen.dart';
part 'surveyScreen.dart';
part 'notification_page.dart';
