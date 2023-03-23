part of 'ServerCubit.dart';

abstract class ServerState {
  const ServerState();
}

class ServerInitial extends ServerState {
  @override
  List<Object> get props => [];
}

class ServerLoading extends ServerState {
  @override
  List<Object?> get props => [];
}

class ServerSuccess extends ServerState {
  final response;
  ServerSuccess({required this.response});
  @override
  List<Object> get props => [];
}


class ServerLoading2 extends ServerState {
  @override
  List<Object?> get props => [];
}

class ServerSuccess2 extends ServerState {
  final response;
  ServerSuccess2({required this.response});
  @override
  List<Object> get props => [];
}

class ServerError extends ServerState {
  final String failure;

  const ServerError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
