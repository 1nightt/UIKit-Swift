//
//  ViewController2.swift
//  Caffe_App
//
//  Created by Яна Шахмина on 06.06.2024.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var fioTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fioTextField.delegate = self
        countTextField.delegate = self
        numberTextField.delegate = self
    }

    @IBAction func entryButton(_ sender: UIButton) {
        if fioTextField.text!.isEmpty || countTextField.text!.isEmpty || numberTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Ошибка", message: "Введите все данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        let alertController = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let checkAction = UIAlertAction(title: "Чек", style: .default) { action in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let thirdController = storyBoard.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
            self.navigationController?.pushViewController(thirdController, animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(checkAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fioTextField {
            countTextField.becomeFirstResponder()
        } else if textField == countTextField {
            numberTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
