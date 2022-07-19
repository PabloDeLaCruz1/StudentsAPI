//
//  Student.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import Foundation


// MARK: - Student
struct Student: Codable {
    let studentRollNumber, studentAge: Int
    let studentName: String?
    let marks: [Mark]
}

// MARK: - Mark
struct Mark: Codable {
    let subject: Subject
    let score: Int
}

enum Subject: String, Codable {
    case chemistry = "Chemistry"
    case mathematics = "Mathematics"
    case physics = "Physics"
}

