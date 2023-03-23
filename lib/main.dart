import 'package:flutter/material.dart';
import 'Constants/Constants.dart';
import 'Controller/DioClient/DioClient.dart';
import 'Controller/Services/ServerPageeService.dart';
import 'Controller/cubit_and_bloc/Authentication_cubit/ServerCubit.dart';
import 'Pages/LuckyJet5_Splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerCubit>(
          create: (context) => ServerCubit(
            apiRepository: ServerPageeService(
              apiService: DioClient(Globals.BaseURL),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => LuckyJet_5_Splash(),
        },
      ),
    );
  }
}
