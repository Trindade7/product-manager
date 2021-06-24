part of 'app_cubit.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  loading,
}

class AppState extends Equatable {
  const AppState._({
    this.status = AppStatus.loading,
  });

  const AppState.authenticated() : this._(status: AppStatus.authenticated);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.loading() : this._();

  final AppStatus status;
  @override
  List<Object> get props => [status];
}
