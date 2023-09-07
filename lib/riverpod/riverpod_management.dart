import 'package:flutter/material.dart';
import 'package:modelss/riverpod/birthday_riverpod.dart';
import 'package:modelss/riverpod/getIp_riverpod.dart';
import 'package:modelss/riverpod/home_riverpod.dart';
import 'package:modelss/riverpod/login_riverpod.dart';
import 'package:modelss/riverpod/post_create_riverpod.dart';
import 'package:modelss/riverpod/posts_riverpod.dart';
import 'package:modelss/riverpod/signup_riverpod.dart';

final login = LoginRiverpod();
final home = HomeRiverpod();
final signup = SignupRiverpod();
final getIp = GetIpsRiverpod();
final bday = BirthdayRiverpod();
final posts = PostsRiverpod();
final postCreate = PostCreateRiverpod();
