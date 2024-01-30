part of 'bmr_cubit.dart';

abstract class BmrEvent {}

class CalculateBmr extends BmrEvent {
  final int weight;
  final int height;
  final int age;
  final bool isMale;

  CalculateBmr({required this.weight, required this.height, required this.age, required this.isMale});
}