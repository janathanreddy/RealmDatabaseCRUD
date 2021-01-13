//
//  ReadViewController.swift
//  RealmCrudFunctions
//
//  Created by Janarthan Subburaj on 12/01/21.
//

import UIKit
import RealmSwift


class ReadViewController: UIViewController {

    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?

    @IBOutlet var ItemLabel: UILabel!
    @IBOutlet var DateLabel: UILabel!

    private let realm = try! Realm()

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        ItemLabel.text = item?.item
        DateLabel.text = Self.dateFormatter.string(from: item!.date)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }

    @objc private func didTapDelete() {
        guard let myItem = self.item else {
            return
        }

        realm.beginWrite()
        realm.delete(myItem)
        try! realm.commitWrite()

        deletionHandler?()
        navigationController?.popToRootViewController(animated: true)
    }


}
