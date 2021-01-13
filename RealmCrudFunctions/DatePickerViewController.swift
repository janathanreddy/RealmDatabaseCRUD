//
//  DatePickerViewController.swift
//  RealmCrudFunctions
//
//  Created by Janarthan Subburaj on 12/01/21.
//

import UIKit
import RealmSwift

class DatePickerViewController: UIViewController,UITextFieldDelegate {

    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    @IBOutlet var Textfield: UITextField!
    @IBOutlet var Datepicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        Textfield.becomeFirstResponder()
        Textfield.delegate = self
        Datepicker.setDate(Date(), animated: true)

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton() {
        if let text = Textfield.text, !text.isEmpty {
            let date = Datepicker.date

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print("Add something")
        }
    }
}
