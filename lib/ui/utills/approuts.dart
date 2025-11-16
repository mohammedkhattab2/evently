import 'package:evently/ui/screens/addevent/add_event.dart';
import 'package:evently/ui/screens/event_details/event_daetails.dart';
import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/ui/screens/login/login.dart';
import 'package:evently/ui/screens/register/register.dart';
import 'package:evently/ui/screens/reset%20password/reset_password.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/screens/updateEvent/update_event.dart';
import 'package:flutter/material.dart';

abstract final class Approuts {
  static Route get login {
    return MaterialPageRoute(builder: (_) => const Login());
  }

  static Route get home {
    return MaterialPageRoute(builder: (_) => const Home());
  }

  static Route get register {
    return MaterialPageRoute(builder: (_) => const Register());
  }

  static Route get resetPassword {
    return MaterialPageRoute(builder: (_) => const ResetPassword());
  }

  static Route get addEvent {
    return MaterialPageRoute(builder: (_) => const AddEvent());
  }

  static Route updateEvent(EventDm event) {
    return MaterialPageRoute(builder: (_) => UpdateEvent(event));
  }
}
