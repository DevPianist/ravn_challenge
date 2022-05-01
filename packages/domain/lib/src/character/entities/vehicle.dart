import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template domain.vehicle}
/// Vehicle domain entity.
/// {@endtemplate}
@immutable
class Vehicle extends Equatable {
  /// {@macro domain.vehicle}
  const Vehicle({
    required this.id,
    required this.name,
  });

  /// `id` The vehicle's unique ID.
  final String id;

  /// `name` The name of the vehicle.
  final String name;

  @override
  String toString() => 'Vehicle(id: $id, name: $name)';

  @override
  List<Object?> get props => [id, name];
}
