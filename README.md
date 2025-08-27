# Pages Module

A AQuadic module for handling pages with DTOs, controller, and ready-to-use UI components.  
This module provides an easy way to list pages, handle taps, and work with generated DTOs.

---

## Installation

Add the package to your project by updating `pubspec.yaml`:

```yaml
dependencies:
  pages_module:
    git:
      url: https://github.com/aquadic/pages_module.git

````

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. Import the module

```dart
import 'package:pages_module/pages_module.dart';
```

## Example: PagesModule Class

```dart
class PagesModule {
  PagesModule._();

  static final instance = PagesModule._();
  final _dio = DioHelper.instance;

  Widget pages({
    required Widget Function(BuildContext, List<PageDto>) builder,
  }) {
    return PagesListView(dioInstance: _dio, builder: builder);
  }

  void onPageTap(BuildContext context, PageDto page) =>
      PagesListView.onPageTap(context, page);
}
```

---

### 2. Create an instance in your screen

```dart
final pageModule = PagesModule.instance;
```

### 3. Build pages list

```dart
pageModule.pages(
  builder: (context, pages) {
 // Your custom UI with the list of pages
 // And handle taps using pageModule.onPageTap(context, page);
  },
);
```
