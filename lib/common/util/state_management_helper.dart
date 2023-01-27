import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';
import '../../presentation/blocs/redeem_code/redeem_code_bloc.dart';

class StateManagementHelper {
  static providers(Widget widget) {
    return MultiProvider(
      providers: [
        //bloc
        BlocProvider<RedeemCodeBloc>(create: (_) => sl<RedeemCodeBloc>()),

        //provider
        ChangeNotifierProvider(create: (_) => CustomSidebarProvider()),
        ChangeNotifierProvider(create: (_) => RedeemCodeProvider()),
      ],
      child: widget,
    );
  }
}
