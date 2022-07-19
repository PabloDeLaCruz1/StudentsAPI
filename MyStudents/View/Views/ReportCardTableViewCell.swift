//
//  ReportCardTableViewCell.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import UIKit

class ReportCardTableViewCell: UITableViewCell {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var score: UILabel!
    //static for shared properties and methods
    static let cellIdentifier = "ReportCardTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: "ReportCardTableViewCell", bundle: nil)
    }

    //MARK: configure
    public func configure(with viewModel: ReportCardCellViewModel) {
        subject.text = viewModel.subject.rawValue.localized()
        score.text = String(viewModel.score)
    }

}
