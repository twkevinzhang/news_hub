import 'package:flutter/material.dart';

@immutable
abstract class StateStatus<T> {
  final int? itemId;
  final T? data;
  final String? message;

  const StateStatus({
    this.itemId,
    this.data,
    this.message,
  });
}

class StateLoading<T> extends StateStatus<T> {
  const StateLoading({super.itemId});
}

class StateCompleted<T> extends StateStatus<T> {
  const StateCompleted({required super.data});
}

class StateInitial<T> extends StateStatus<T> {}

class StateError<T> extends StateStatus<T> {
  const StateError({required super.message});
}

class StateStatusLayout<T> extends StatelessWidget {
  final StateStatus<T> status;
  final Widget onErrorStatus;
  final void Function(String error)? onErrorListener;
  final Widget Function(BuildContext context, T data) onCompletedStatus;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const StateStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
    this.onErrorListener,
  });

  @override
  Widget build(BuildContext context) {
    if (status is StateError) {
      if (onErrorListener != null) {
        onErrorListener!(status.message!);
      }
    }
    if (status is StateCompleted) {
      return StreamBuilder(
        stream: Stream.value(status),
        builder: (context, snapshot) {
          return onCompletedStatus(context, status.data!);
        },
      );
    }
    if (status is StateError) {
      return onErrorStatus;
    }
    if (status is StateInitial) {
      return onInitialStatus;
    }
    if (status is StateLoading) {
      return onLoadingStatus;
    }
    return Container();
  }
}