import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class VerificationLoadInProgress extends VerificationState {}

class VerificationLoadSuccess extends VerificationState {
  final bool isBoycotted;

  VerificationLoadSuccess({required this.isBoycotted});

  @override
  List<Object> get props => [isBoycotted];
}

class VerificationLoadFailure extends VerificationState {
  final String error;

  VerificationLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
