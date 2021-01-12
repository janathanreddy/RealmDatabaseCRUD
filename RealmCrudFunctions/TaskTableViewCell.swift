//
//  TaskTableViewCell.swift
//  RealmCrudFunctions
//
//  Created by Janarthan Subburaj on 12/01/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var TaskNotes: UILabel!
    @IBOutlet weak var TaskDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
