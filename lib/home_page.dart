//import 'package:check_internet_connection_using_bloc/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is ConnectedState) {
            return _buildTextWidget( state.message);
          } else if (state is NotConnectedState) {
            return _buildTextWidget(state.message);
          }
          return _buildTextWidget('Not Connected');
        },
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
