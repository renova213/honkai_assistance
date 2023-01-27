import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/redeem_code/redeem_code_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<RedeemCodeBloc>(context, listen: false)
            .add(GetRedeemCodeEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Placeholder());
  }
}
