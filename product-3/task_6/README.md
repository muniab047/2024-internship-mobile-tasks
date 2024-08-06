#Project Overview
This e-commerce app is developed as part of an internship at A2SV. The focus is on mastering Flutter development using Test Driven Development (TDD), Clean Architecture, and the BLoC (Business Logic Component) pattern. This application serves as a practical example to apply and demonstrate these methodologies.

#Architecture
Clean Architecture
Clean Architecture organizes the project into distinct layers, each responsible for specific functionalities. This structure enhances the code's maintainability, scalability, and testability.

#Presentation Layer:
UI Components: The visual elements of the application.
#Domain Layer:
Entities: Fundamental classes representing the core business objects.
Use Cases: Contain the business logic and handle the data flow between the Repository and BLoC.
Data Layer:
#Repositories: Define the abstract operations for data manipulation.
Data Sources: Implement the data operations, such as accessing a local database or remote API.
#Data Flow
User Interaction: Users interact with the UI components in the Presentation Layer.
Business Logic Execution: Use Cases retrieve or update data through the Repository.
Data Operations: The Repository performs the actual data operations via Data Sources.
Folder Structure

task-6/
|───lib/
|    ├── data/
|    │   ├── models/
|    │   ├── repositories/
|    │   ├── data_sources/
|    │
|    ├── domain/
|    │   ├── entities/
|    │   ├── use_cases/
|    |   |── repositories/
|    │
|    ├── presentation/
|    │   ├── providers/
|    │   ├── pages/
|    │   ├── widgets/
|    │
|    ├── main.dart
|
|────test/


data/models: Defines the data models.
data/repositories: Implements repository patterns.
data/data_sources: Manages data sources like APIs and local storage.
domain/entities: Contains entity definitions.
domain/use_cases: Implements business logic.
presentation/blocs: Contains BLoC classes for state management.
presentation/pages: Includes the app's UI pages.
presentation/widgets: Contains reusable UI components.
main.dart: The app's entry point.
Test Driven Development (TDD)
Adopting TDD, the project development follows a cycle of writing tests, implementing functionality, and refactoring code. Tests are categorized by layers:

Unit Tests: Validate individual components like use cases, repositories, and BLoC.
Widget Tests: Ensure the correct behavior of UI components.
Integration Tests: Verify the complete interaction flow from the UI to data sources.
Dependencies
flutter_bloc: For managing state using the BLoC pattern.
provider: Facilitates dependency injection.
get_it: Implements the service locator pattern.
mockito: Mocks dependencies for testing.
flutter_test: Supports writing tests.
Conclusion
This document provides an overview of the e-commerce app's architecture, data flow, and development practices. Using Clean Architecture and TDD ensures the app is robust, maintainable, and scalable. The BLoC pattern enhances state management, making the app reactive and testable, aligning with best practices in Flutter development.

