part of 'product_bloc.dart';

class ProductEvent {}

class LoadProducts extends ProductEvent {}

class SelectCategory extends ProductEvent {
  final String? category;

  SelectCategory(this.category);
}
