//
//  main.swift
//  task2-type-casting-and-nested-types
//
//  Created by Erik Valencia Cardona on 27/09/26.
//

import Foundation


struct School {
    
    enum SchoolRole {
        case student
        case teacher
        case administrator
    }
    
    class Person {
        let name: String
        let role: SchoolRole
        
        init(name: String, role: SchoolRole){
            self.name = name
            self.role = role
        }
    }
    
    private var people: [Person] = []
    
    subscript(role: SchoolRole) -> [Person] {
        return people.filter{$0.role == role}
    }
    

    mutating func addPerson(_ person: Person) {
        people.append(person)
    }
    
}

func countStudents(in school: School) -> Int { return school[.student].count}
func countTeachers(in school: School) -> Int { return school[.teacher].count}
func countAdministrators(in school: School) -> Int { return school[.administrator].count}


var school = School()

school.addPerson(School.Person(name: "Erik", role: .student))
school.addPerson(School.Person(name: "Gabi", role: .student))
school.addPerson(School.Person(name: "Matias", role: .teacher))
school.addPerson(School.Person(name: "Londoño", role: .teacher))
school.addPerson(School.Person(name: "Eriko", role: .administrator))

print("Número de estudiantes: \(countStudents(in: school))")
print("Número de profesores: \(countTeachers(in: school))")
print("Número de adminsitradores: \(countAdministrators(in: school))")
