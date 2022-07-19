//
//  StudentsTableViewCell.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentAge: UILabel!
    @IBOutlet weak var studentRollNumber: UILabel!
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var ageLb: UILabel!
    @IBOutlet weak var rollLb: UILabel!
    
    static let cellIdentifier = "StudentsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        rollLb.text = "Roll:".localized()
        nameLb.text = "Name:".localized()
        ageLb.text = "Age:".localized()
    }

    static func nib() -> UINib {
        return UINib(nibName: "StudentsTableViewCell", bundle: nil)
    }

//MARK: configure
    public func configure(with viewModel: StudentsCellViewModel) {
        studentName.text = viewModel.studentName
        studentAge.text = String(viewModel.studentAge) + " yrs".localized()
        studentRollNumber.text = String(viewModel.studentRollNumber)
    }
}

//Handle languages using localization
extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Main",
            bundle: .main,
            value: self,
            comment: self)
    }
}


