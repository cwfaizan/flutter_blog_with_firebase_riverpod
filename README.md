# flutter_blog_with_firebase_riverpod

A new Flutter project.

# Getting Started
## 1) Run commonds to add riverpod packages

flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner

You can now run the code-generator with:: dart run build_runner watch -d

## 1.1) optional packages
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint

Note:- Riverpod comes with an optional riverpod_lint package that provides lint rules to help you write better code, and provide custom refactoring options.

The package should already be installed if you followed the previous steps, but a separate step is necessary to enable it.

To enable riverpod_lint, you need add an analysis_options.yaml placed next to your pubspec.yaml and include the following:

analyzer:
  plugins:
    - custom_lint

## 2) Run commonds to add firebase packages

flutter pub add firebase_core
flutter pub add cloud_firestore
flutter pub add firebase_auth
flutter pub add firebase_storage

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
