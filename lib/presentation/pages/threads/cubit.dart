part of 'index.dart';

abstract class ThreadsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThreadsInitial extends ThreadsState {}

class ThreadsLoading extends ThreadsState {}

class ThreadsSuccess extends ThreadsState {
  final List<Thread> threads;

  ThreadsSuccess(this.threads);

  @override
  List<Object?> get props => [threads];
}

class ThreadsError extends ThreadsState {
  final String error;

  ThreadsError(this.error);

  @override
  List<Object?> get props => [error];
}

@lazySingleton
class ThreadsCubit extends Cubit<ThreadsState> {
  final ListThreads _listThreads;

  ThreadsCubit({
    required ListThreads listThreads,
  })  : _listThreads = listThreads,
        super(ThreadsInitial());

  Future<void> loadThreads() async {
    emit(ThreadsLoading());
    try {
      final result = await _listThreads.call();
      emit(ThreadsSuccess(result));
    } catch (e) {
      emit(ThreadsError(e.toString()));
    }
  }
}
