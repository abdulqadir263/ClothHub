# ClothHub Coding Style & MVVM Architecture Guide

This document captures the coding style and architecture conventions used in ClothHub so you can reuse the same approach in another Flutter project.

---

## 1) Core Stack and Architectural Direction

ClothHub is built with:
- **Flutter + Dart**
- **GetX** for state management, dependency injection, and routing
- **Firebase** (Auth + Firestore) as backend
- **MVVM** with a clear separation of concerns

High-level direction:
- Keep UI in **Views**
- Keep screen/business logic in **ViewModels** (`GetxController`)
- Keep backend/data access in **Repositories**
- Keep pure data structures in **Models**
- Keep cross-cutting setup in `app/` (routes, theme, utilities, services)

---

## 2) Folder and Module Organization

Project-level structure:

- `lib/app/`
  - `routes/`: named routes and page mappings
  - `services/`: app-level services (example: auth-based navigation)
  - `themes/`: centralized theme and reusable UI builders
  - `utils/`: constants and helpers
- `lib/data/`
  - `models/`: DTO/domain-like classes (`fromMap`, `toMap`)
  - `repositories/`: Firebase/Cloudinary read-write logic
- `lib/modules/`
  - feature modules (auth, products, cart, orders, profile, admin, user_home)
  - each module usually contains:
    - `views/` for screens/widgets
    - `..._viewmodel.dart` for logic/state
    - `..._binding.dart` for dependency registration

### Practical convention
Organize by **feature first**, then MVVM pieces inside each feature.

---

## 3) MVVM Layer Responsibilities

## Model (data/models)
- Represents app data only.
- Uses immutable fields (`final`).
- Provides serialization mapping:
  - `factory ...fromMap(Map<String, dynamic>)`
  - `Map<String, dynamic> toMap()`
- Adds safe defaults where useful (`''`, `0`, etc.) to reduce null issues.

## Repository (data/repositories)
- Single responsibility: data source operations.
- No widget/UI code.
- Encapsulates Firebase calls (`collection`, `doc`, `snapshots`, `update`, etc.).
- Returns:
  - `Future<...>` for one-time operations
  - `Stream<List<Model>>` for realtime data

## ViewModel (modules/**/...viewmodel.dart)
- Extends `GetxController`.
- Holds reactive state using `.obs` / `Rxn`.
- Gets dependencies via `Get.find<RepositoryOrService>()`.
- Handles:
  - validation
  - async workflows
  - loading state
  - user feedback via `Get.snackbar`
  - route actions when needed
- Uses lifecycle methods like `onInit()` for startup logic (bind streams/load data).

## View (modules/**/views/*.dart)
- Focuses on presentation and user interaction.
- Retrieves ViewModel via `Get.find<...ViewModel>()`.
- Uses `Obx` to reflect reactive state.
- Keeps UI declarative and mostly free of business logic.

---

## 4) Dependency Injection Pattern (GetX)

Two DI layers are used:

1. **App bootstrap** (`main.dart`, `initDependencies()`):
   - Registers core repositories/services globally.
   - Some viewmodels are registered globally (e.g., shared/permanent ones).

2. **Feature bindings** (`..._binding.dart`):
   - Registers feature-local dependencies per route.
   - Typical pattern:
     - `Get.lazyPut<Repository>(() => Repository())`
     - `Get.lazyPut<ViewModel>(() => ViewModel())`

Common registration choices:
- `Get.lazyPut(..., fenix: true)` for lazy recreation.
- `Get.put(..., permanent: true)` for state that should survive app lifetime.

---

## 5) Routing Style

Routing is centralized:
- `app_routes.dart`: route string constants
- `app_pages.dart`: `GetPage` route map + bindings

Conventions:
- Use named routes (`Get.toNamed`, `Get.offAllNamed`).
- Attach module binding in `GetPage` to ensure dependencies are available.
- Route names are kebab-case path strings (example: `/forgot-password`).

---

## 6) Reactive State Style

Common state declarations in ViewModels:
- `var isLoading = false.obs;`
- `var items = <Model>[].obs;`
- `Rxn<Type> optional = Rxn<Type>();`

Common stream handling pattern:
1. Set loading true
2. Get stream from repository
3. Bind stream to reactive list (`items.bindStream(stream)`)
4. Listen for completion/error to update loading flags

Computed properties are exposed through getters (example: cart totals/count).

---

## 7) Async and Error-Handling Style

Preferred flow in ViewModel actions:
1. Validate input early and return fast on invalid values
2. Set loading state
3. `try / catch / finally` around async work
4. Show user-facing feedback with `Get.snackbar`
5. Reset loading in `finally`

This keeps UX predictable and avoids dangling loading indicators.

---

## 8) UI and Theming Conventions

UI style is centralized through `AppTheme`:
- color tokens (`primary`, `accent`, `bg`)
- sizing tokens (`defaultRadius`, `buttonHeight`, spacing helpers)
- reusable builders (`primaryButton`, `secondaryButton`, `inputField`, `appCard`)
- typography via Google Fonts + text style constants

View conventions:
- Stateless when possible
- Stateful only for local UI-only concerns (e.g., password visibility)
- use `const` where possible
- keep repetitive UI in dedicated widgets under `widgets/`

---

## 9) Naming and File Conventions

Observed naming style:
- Classes: `PascalCase` (`LoginViewModel`, `ProductRepository`)
- Files: `snake_case.dart`
- ViewModel files usually end in `_viewmodel.dart`
- Binding files usually end in `_binding.dart`
- Route constants in a dedicated `AppRoutes` class
- Repository methods are verb-based: `get`, `add`, `update`, `delete`, `create`

---

## 10) Data Flow Blueprint (Realtime Pattern)

Typical realtime path:

**Firestore snapshots → Repository stream → ViewModel Rx state → View (`Obx`)**

Typical command path:

**View action → ViewModel validation/orchestration → Repository write → UI feedback/navigation**

---

## 11) Reusable Template for New Features

When adding a feature in another project using this style:

1. Create module folder under `lib/modules/<feature>/`
2. Add:
   - `views/<feature>_view.dart`
   - `<feature>_viewmodel.dart`
   - `<feature>_binding.dart`
3. Create/extend model(s) in `lib/data/models/`
4. Create/extend repository in `lib/data/repositories/`
5. Register route constant + `GetPage` + binding
6. Keep UI in view, logic in viewmodel, backend in repository
7. Use `.obs` + `Obx` for reactive updates
8. Use shared `AppTheme` components and spacing/text conventions

---

## 12) Recommended Rules to Keep Consistency in Your New Project

To match ClothHub style closely:

- Keep **GetX + MVVM + feature folders** as the default architecture.
- Never call Firebase directly from views.
- Keep each ViewModel focused on one feature/screen domain.
- Keep repository methods thin and explicit (one clear data responsibility).
- Keep validation and user feedback in ViewModel methods.
- Standardize route definitions and avoid inline/random route strings.
- Create one shared theme utility class and reuse it everywhere.
- Prefer reactive streams for live collections and `.obs` state for UI flags.

---

## 13) What to Improve While Keeping the Same Style

If you want the same style but cleaner in your new project:

- Keep consistent import style (prefer one style: package imports or relative imports).
- Avoid duplicate registrations between app bootstrap and bindings unless intentional.
- Replace `print` debugging with a logging utility.
- Use route constants in all navigations instead of hardcoded route strings.
- Add stronger lint rules once the baseline is stable.

These improvements preserve the ClothHub architecture while making long-term maintenance easier.

