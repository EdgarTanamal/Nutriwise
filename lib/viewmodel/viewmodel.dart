import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabets/model/survey.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diabets/repository/surveyRepository.dart';

import '../data/network/firebaseAuthServices.dart';
import '../model/user.dart';
import '../repository/userRepository.dart';
import '../shared/shared.dart';

part 'surveyViewModel.dart';
part 'loginViewModel.dart';
part 'homeViewModel.dart';