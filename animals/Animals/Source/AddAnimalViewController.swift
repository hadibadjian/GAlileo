//  Copyright © 2016 HB. All rights reserved.

class AddAnimalViewController: UIViewController,
UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var locationTextField: UITextField!
  @IBOutlet weak var categoryPickerView: UIPickerView!

  var animal: Animal?

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
    return 1
  }

  // MARK: - PickerView Delegate

  func pickerView(
    pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int) -> String? {
    return "Cat"
  }

  func pickerView(
    pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int) {
    animal?.category = "Cat"
  }
}

import UIKit
