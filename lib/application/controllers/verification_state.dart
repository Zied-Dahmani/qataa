import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class VerificationLoadInProgress extends VerificationState {}

class VerificationLoadSuccess extends VerificationState {
  final bool isBlacklisted;

  VerificationLoadSuccess({required this.isBlacklisted});

  @override
  List<Object> get props => [isBlacklisted];
}

class VerificationLoadFailure extends VerificationState {
  final String error;

  VerificationLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
