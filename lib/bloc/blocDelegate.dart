import 'package:doggr2/bloc/authentification/authentification_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*import 'package:doggr2/bloc/authentification/authentification_bloc.dart';
import 'package:doggr2/bloc/blocDelegate.dart';*/
import 'package:doggr2/repositories/userRepository.dart';
/*import 'package:doggr2/ui/pages/home.dart';*/
import 'package:flutter/material.dart';
/*import 'package:flutter_bloc/flutter_bloc.dart';*/

import 'authentification/authentification_event.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    if (cubit is Bloc) {
      super.onError(cubit, error, stackTrace);
      print(error);
    } else {
      super.onError(cubit, error, stackTrace);
      print(error);
    }

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}
