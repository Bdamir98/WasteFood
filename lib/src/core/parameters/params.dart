import 'package:equatable/equatable.dart';

import '../entities/address_model.dart';

class Params extends Equatable {
  final Map<String, dynamic> filterMap;

  const Params({required this.filterMap});

  @override
  List<Object?> get props => [filterMap];
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegistrationParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final List<String> image;
  final String role;
  final AddressModel address;

  const RegistrationParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.image,
    required this.role,
    required this.address,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        password,
        image,
        role,
        address,
      ];
}
