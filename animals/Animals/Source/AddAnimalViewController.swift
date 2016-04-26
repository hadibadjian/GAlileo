//  Copyright © 2016 HB. All rights reserved.

protocol AddAnimal {
  func add(animal: Animal?)
}

class AddAnimalViewController: UIViewController,
UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var locationTextField: UITextField!
  @IBOutlet weak var categoryPickerView: UIPickerView!

  var animal: Animal?
  let categories = ["Cat", "Dog", "Reptile", "Bird"]

  var delegate: AddAnimal?

  override func viewDidLoad() {
    super.viewDidLoad()

    nameTextField.delegate = self
    locationTextField.delegate = self
    categoryPickerView.delegate = self
    categoryPickerView.dataSource = self

    animal = Animal()
  }

  @IBAction func doneButtonPressed(sender: AnyObject) {
    animal?.name = nameTextField.text
    animal?.location = locationTextField.text

    delegate?.add(animal)

    self.dismissViewControllerAnimated(true, completion: nil)
  }

  // MARK: - TextField Delegate

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  // MARK: - PickerView DataSource

  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }

  // MARK: - PickerView Delegate

  func pickerView(
    pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int) -> String? {
    return categories[row]
  }

  func pickerView(
    pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int) {
    animal?.category = categories[row]
  }
}

import UIKit
