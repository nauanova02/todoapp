//
//  Todo.swift
//  TodoApp
//
//  Created by gumball on 4/27/22.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var todo: String = ""
}
