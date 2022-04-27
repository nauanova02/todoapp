//
//  ViewController.swift
//  TodoApp
//
//  Created by gumball on 4/26/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTableView: UITableView!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func enterTodo(_ sender: UITextField) {
        write(todo: sender.text!)
    }
    
    
    private func write(todo: String) {
        try! realm.write {
            let _todo = Todo()
            _todo.todo = todo
            realm.add(_todo)
        }
        self.todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let todos = realm.objects(Todo.self)
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todos = realm.objects(Todo.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TodoTableViewCell
        let object = todos[indexPath.row]
        cell.todoLabel.text = object.todo
        return cell
    }
    
}

