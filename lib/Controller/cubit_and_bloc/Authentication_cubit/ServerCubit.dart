import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../Services/ServerPageeService.dart';

part 'ServerState.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({required this.apiRepository}) : super(ServerInitial());
  final ServerPageeService apiRepository;
  bool Secretary_Login = false;

  GetQuestion(String lang) async {
    emit(ServerLoading());

    final respoonse = await apiRepository.GettingQuestion(lang);
    print(respoonse.data);

    emit(ServerSuccess(response: respoonse));
  }

  GetAnswers(String lang) async {
    emit(ServerLoading2());
    final respoonse = await apiRepository.GettingAnswers(lang);
    print(respoonse.data);
    emit(ServerSuccess2(response: respoonse));
  }
}
