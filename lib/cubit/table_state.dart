part of 'table_cubit.dart';

class TableState extends AppState {
  final List<User> user;

  TableState(
      {required bool isLoading, required bool isInitialize, required this.user})
      : super(isLoading: isLoading, isInitialize: isInitialize);

  copyWith({bool? isLoading, bool? isInitialize, List<User>? user}) {
    return TableState(
        isLoading: isLoading ?? this.isLoading,
        isInitialize: isInitialize ?? this.isInitialize,
        user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, isInitialize, user];
}
