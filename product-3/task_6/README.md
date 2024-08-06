# eCommerce Application

This is a simple eCommerce application built using Flutter. The app allows users to manage products effectively by providing functionalities to add, view, edit, and delete products. Each product includes essential details such as name, description, price, and an optional image.

## Features

- **Product Management:** Users can add new products, view all products, edit existing products, and delete products.
- **Clean Architecture:** The application follows Clean Architecture principles, ensuring a well-organized codebase that separates concerns effectively.
- **Test Driven Development (TDD):** The development process includes writing tests to ensure the reliability and correctness of the application.

## Architecture

The application is structured into different modules to enhance maintainability and scalability:

- **Core:** Contains shared components, entities, and error handling logic.
- **Features:** Includes feature-specific modules.
  - **Product:** Main module for managing products, including the data model, use cases, and repository.
- **Test:** Contains unit and widget tests for the application.

## Product Model

The `Product` entity includes the following properties:

- `id`: Unique identifier for each product
- `name`: Name of the product
- `description`: Description of the product
- `price`: Price of the product
- `imageUrl`: Optional URL for the product image

## Use Cases

The application implements the following use cases for product management:

- **InsertProduct:** Adds a new product to the inventory.
- **UpdateProduct:** Updates the details of an existing product.
- **DeleteProduct:** Removes a product from the inventory.
- **GetProduct:** Retrieves the details of a specific product.

## Testing

The application includes unit tests to validate the functionality of the product model and other components, ensuring that all features work as intended.

