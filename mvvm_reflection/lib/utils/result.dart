// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Utility class to wrap result data
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Exception error) = Error._;

  /// Folds the results to a single value, using the provided functions for each case.
  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Exception error) onError,
  }) {
    if (this is Ok<T>) {
      return onOk((this as Ok<T>).value);
    } else if (this is Error<T>) {
      return onError((this as Error<T>).error);
    } else {
      throw Exception('Unknown Result type');
    }
  }

  /// Maps the result to a new [Result] of type [R], using the provided functions for each case.
  Result<R> map<R>({
    required R Function(T value) onOk,
    required Exception Function(Exception error) onError,
  }) {
    if (this is Ok<T>) {
      return Result.ok(onOk((this as Ok<T>).value));
    } else if (this is Error<T>) {
      return Result.error(onError((this as Error<T>).error));
    } else {
      throw Exception('Unknown Result type');
    }
  }
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// Returned error in result
  final Exception error;

  @override
  String toString() => 'Result<$T>.error($error)';
}
