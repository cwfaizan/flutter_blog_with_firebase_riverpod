import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A class with some product validation methods
class PostValidator {
  const PostValidator();

  String? titleValidator(String? value) {
    if (value == null) {
      return 'Can\'t be empty'.hardcoded;
    }
    if (value.length < 4) {
      return 'Minimum length: 4 characters';
    }
    return null;
  }

  // this is the same as titleValidator
  String? descriptionValidator(String? value) => titleValidator(value);

  String? priceValidator(String? value) {
    if (value == null) {
      return 'Can\'t be empty'.hardcoded;
    }
    final price = double.tryParse(value);
    if (price == null) {
      return 'Not a valid number'.hardcoded;
    }
    if (price <= 0) {
      return 'Price must be greater than zero'.hardcoded;
    }
    if (price >= 100000) {
      return 'The price must be less than \$100,000'.hardcoded;
    }
    return null;
  }

  String? availableQuantityValidator(String? value) {
    if (value == null) {
      return 'Can\'t be empty'.hardcoded;
    }
    final availableQuantity = int.tryParse(value);
    if (availableQuantity == null) {
      return 'Not a valid number'.hardcoded;
    }
    if (availableQuantity < 0) {
      return 'Quantity must be zero or more'.hardcoded;
    }
    if (availableQuantity >= 1000) {
      return 'Quantity must be less than 1,000'.hardcoded;
    }
    return null;
  }
}

final postValidatorProvider = Provider<PostValidator>((ref) {
  return const PostValidator();
});