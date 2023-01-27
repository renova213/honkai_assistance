import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/blocs/redeem_code/redeem_code_bloc.dart';
import '../injection_container.dart';

class MultiBlocProviders {
  static blocs(Widget widget) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RedeemCodeBloc>(
          create: (_) => sl<RedeemCodeBloc>(),
        ),
      ],
      child: widget,
    );
  }
}
