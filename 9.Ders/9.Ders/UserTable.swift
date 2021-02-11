//
//  UserTable.swift
//  9.Ders
//
//  Created by selin eylül bilen on 1/21/21.
//

import UIKit

class UserTable: UITableViewController {

    let db = DB()
    var arr:[UserSt] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        db.fncConnection()
        arr = db.userList()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = arr[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = arr[indexPath.row]
            let deleteRow = db.userDelete(uid: item.id)
            if ( deleteRow > 0){
                arr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        print(item.name)
        print(item.email)
    }
}
