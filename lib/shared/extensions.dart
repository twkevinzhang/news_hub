import 'dart:ffi';
import 'dart:io';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension StringListEx on List<String> {
  String toUrl() {
    return join("/");
  }
}

extension FileEx on File {
  Stream<Pair<int, Uint8List?>> readAsProgress() async* {
    final fileSize = await length(); // 獲取文件總大小
    const chunkSize = 8192; // 每次讀取的塊大小
    final buffer = BytesBuilder(); // 用於收集所有數據
    final raf = openSync(); // 開啟文件

    try {
      int bytesRead = 0;
      while (true) {
        final chunk = raf.readSync(chunkSize); // 讀取文件塊
        if (chunk.isEmpty) break; // 文件結束

        buffer.add(chunk); // 收集數據
        bytesRead += chunk.length;

        // 發出進度和暫時的 null
        yield Pair(((bytesRead / fileSize) * 100).toInt(), null);
      }

      // 文件完全讀取後，發出完整數據
      yield Pair(100, buffer.toBytes());
    } finally {
      raf.closeSync(); // 確保文件關閉
    }
  }
}

extension Int64Ex on $fixnum.Int64 {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(toInt() * 1000);
  }
}

extension StringEx on String {
  String remove(String s) {
    return replaceAll(s, '');
  }

  String truncate(int maxLength, { omission = '...' }) {
    if (length >= length) {
      return this;
    }
    return replaceRange(length, length, omission);
  }
}

extension CubitEx<T> on Cubit<T> {

  // ref: https://github.com/felangel/bloc/issues/3069#issuecomment-1095547362
  void safeEmit(T state) {
    if (!isClosed) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      emit(state);
    }
  }
}

extension IntEx on int? {
  get isPositive {
    return this != null && this! > 0;
  }
}
