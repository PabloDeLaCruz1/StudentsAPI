//
//  ReportCardTableViewController.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import UIKit

class ReportCardTableViewController: UITableViewController {
    var marks = [Mark]()
    var studentName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ReportCardTableViewCell.nib(), forCellReuseIdentifier: ReportCardTableViewCell.cellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return studentName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return marks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportCardTableViewCell.cellIdentifier, for: indexPath) as! ReportCardTableViewCell

        let model = marks[indexPath.row]
        cell.configure(with: ReportCardCellViewModel(subject: model.subject, score: model.score))

        return cell
    }
}
