//
//  StudentsTableViewController.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    let parser = DataAPI()
    var students = [Student]()
    var marks = [Mark]()
    var studentName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(StudentsTableViewCell.nib(), forCellReuseIdentifier: StudentsTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        //Using our api data object to initialize our data object
        parser.getData {
            data in
            self.students = data

            //Reload UI on Main thread:
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Hide cell if student name is missing
        //Can also map/transform the data source to prevent the cell
        let model = students[indexPath.row]
        if model.studentName != nil {
            return 140
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Students".localized()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = students[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: StudentsTableViewCell.cellIdentifier, for: indexPath) as! StudentsTableViewCell

        cell.configure(with: StudentsCellViewModel(studentName: model.studentName ?? "", studentRollNumber: model.studentRollNumber, studentAge: model.studentAge))
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        marks = students[indexPath.row].marks
        studentName = students[indexPath.row].studentName!
        performSegue(withIdentifier: "Show Report Card", sender: nil)
    }

    // MARK: - Navigation, passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if (segue.identifier == "Show Report Card") {
            let showReportCardViewController: ReportCardTableViewController = segue.destination as! ReportCardTableViewController
            showReportCardViewController.marks = marks
            showReportCardViewController.studentName = studentName
        }

    }

}
