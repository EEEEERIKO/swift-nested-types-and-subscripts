# Swift School Personnel System

A command-line school personnel management system built with Swift. The project demonstrates how nested types, subscripts, value types, reference types, and mutating methods can be used to organize students, teachers, and administrators.

## Overview

The system models a school and its personnel using a `School` structure. Each person has a name and an assigned role:

- Student
- Teacher
- Administrator

People can be added to the school, retrieved by role through a custom subscript, and counted using dedicated functions.

## Learning Objectives

This project demonstrates the following Swift concepts:

- Structures and classes
- Nested types
- Enumerations
- Custom subscripts
- Array filtering
- Access control
- Mutating methods
- Function parameters and return values
- Type inference
- String interpolation

## Implementation

### `School`

`School` is the main structure responsible for storing and managing personnel.

```swift
struct School {
    // Nested types and personnel management
}
```

Because `School` is a structure, the method that modifies its personnel collection is declared with the `mutating` keyword.

### `SchoolRole`

`SchoolRole` is an enumeration nested inside `School`. It defines the supported personnel categories:

```swift
enum SchoolRole {
    case student
    case teacher
    case administrator
}
```

Nesting the enum communicates that these roles belong specifically to the school domain.

### `Person`

`Person` is a class nested inside `School`. Each instance stores a person's name and role:

```swift
class Person {
    let name: String
    let role: SchoolRole

    init(name: String, role: SchoolRole) {
        self.name = name
        self.role = role
    }
}
```

### Personnel Storage

Personnel are stored in a private array:

```swift
private var people: [Person] = []
```

The `private` access level prevents external code from modifying the collection directly.

### Adding People

New personnel are added through the `addPerson(_:)` method:

```swift
mutating func addPerson(_ person: Person) {
    people.append(person)
}
```

### Role-Based Subscript

A custom subscript provides a concise way to retrieve people by role:

```swift
subscript(role: SchoolRole) -> [Person] {
    people.filter { $0.role == role }
}
```

This makes role-based access readable and expressive:

```swift
let students = school[.student]
let teachers = school[.teacher]
let administrators = school[.administrator]
```

### Counting Personnel

The project includes three functions that use the custom subscript:

```swift
func countStudents(in school: School) -> Int {
    school[.student].count
}

func countTeachers(in school: School) -> Int {
    school[.teacher].count
}

func countAdministrators(in school: School) -> Int {
    school[.administrator].count
}
```

## Example Usage

```swift
var school = School()

school.addPerson(School.Person(name: "Erik", role: .student))
school.addPerson(School.Person(name: "Gabi", role: .student))
school.addPerson(School.Person(name: "Matias", role: .teacher))
school.addPerson(School.Person(name: "Londoño", role: .teacher))
school.addPerson(School.Person(name: "Eriko", role: .administrator))

print("Número de estudiantes: \(countStudents(in: school))")
print("Número de profesores: \(countTeachers(in: school))")
print("Número de administradores: \(countAdministrators(in: school))")
```

## Expected Output

```text
Número de estudiantes: 2
Número de profesores: 2
Número de administradores: 1
```

## Project Structure

```text
swift-school-personnel-system/
├── task2-type-casting-and-nested-types/
│   └── main.swift
└── task2-type-casting-and-nested-types.xcodeproj/
```

## Requirements

- macOS
- Xcode
- Swift 5 or later

No external dependencies are required.

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/EEEEERIKO/swift-school-personnel-system.git
   ```

2. Open the project:

   ```bash
   cd swift-school-personnel-system
   open task2-type-casting-and-nested-types.xcodeproj
   ```

3. Select the project scheme in Xcode.
4. Build and run the project with **Command + R**.
5. Review the personnel counts in the Xcode console.

## Design Decisions

- `SchoolRole` and `Person` are nested inside `School` to keep related domain types grouped together.
- The personnel array is private to preserve encapsulation.
- A custom subscript provides concise, type-safe access to personnel grouped by role.
- `addPerson(_:)` is the controlled interface for updating the personnel list.
- Separate counting functions keep each operation simple and easy to understand.

## Possible Future Improvements

- Add unit tests for each personnel role.
- Prevent duplicate personnel records.
- Support removing or updating people.
- Add additional roles.
- Make `SchoolRole` conform to `CaseIterable`.
- Provide counts for all roles through a single summary method.
- Add persistence using JSON or a local database.

## Author

**Erik Valencia Cardona**

Swift learning project focused on nested types, custom subscripts, encapsulation, and personnel categorization.
