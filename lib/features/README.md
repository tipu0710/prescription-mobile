# Feature Structure Guideline

Each feature in `lib/features/` should follow this structure:

## Data Layer (`data/`)
-   **`datasources/`**: Interfaces and implementations for remote (API) and local (DB) data access.
-   **`models/`**: DTOs (Data Transfer Objects) that extend Entities and handle JSON serialization/deserialization.
-   **`repositories/`**: Implementation of repositories defined in the Domain layer.

## Domain Layer (`domain/`)
-   **`entities/`**: Pure business objects. Should not depend on any other layer or external libraries (e.g., no JSON annotations).
-   **`repositories/`**: Interfaces for repositories.
-   **`usecases/`**: Encapsulate specific business logic logic (e.g., GetUser, Login).

## Presentation Layer (`presentation/`)
-   **`controllers/`**: State management (Riverpod Notifiers).
-   **`pages/`**: Full screens/pages.
-   **`widgets/`**: Reusable widgets specific to the feature.
