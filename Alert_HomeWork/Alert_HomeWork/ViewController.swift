import Foundation
import UIKit

/*
 1.Написать свое мини приложение на первом экране две кнопки "сложение" и "угадай число"
 2. При попадании на этот экран запрашивать ФИО через алер и отображать в UILabel
 3. По нажатию на "сложение" открывать Алерт который просит ввести число 1 и число 2 и кнопка посчитать выводит результат в любом виде юзеру
 4. При нажатии на кнопку "угадай число" нужно придумать игру где нужно угадать число
 5. Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
 6. Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете контролеру а контролер отдаст это в модель которая из буквосочетания "leohl" вернет слово "hello" контролеру а контролер отдаст это лейблу и отобразит это на экране
 7. Все кодом пишем!
 */

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alertName(tittle: "Введение имя", message: "Будьте внимательны", style: .alert)
    }
    
    //MARK: - Button
    @IBAction func summButton(_ sender: UIButton) {
        summAlert(title: "Введите числа", message: "Будьте внимательны", style: .alert)
    }
    @IBAction func randomButton(_ sender: UIButton) {
        randomAlert(tittle: "Введите число", message: "Будьте внимательны", style: .alert)
    }
    
    //MARK: - AlertName
    func alertName(tittle: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.nameLabel.text! = text?.text ?? ""
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Имя"
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Summ Alert
    func summAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let closeButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let actionSum = UIAlertAction(title: "Посчитать", style: .default) { (actionSum) in
            if let fisrtText = alertController.textFields?.first?.text, let secondText = alertController.textFields?[1].text{
                if let firstNumber = Int(fisrtText), let secondNumber = Int(secondText) {
                    let summ = firstNumber + secondNumber
                    self.sumLabel.text = "Сумма: \(summ)"
                } else {
                    self.sumLabel.text = "Будьте внимательны"
                }
            }
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Цифра 1"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Цифра 2"
        }
        
        alertController.addAction(actionSum)
        alertController.addAction(closeButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Random Alert
    func randomAlert(tittle: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: style)
        let closeButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let action = UIAlertAction(title: "Играть", style: .default) { (action) in
            let randomInt = Int.random(in: 0...9)
            if let text = alertController.textFields?.first?.text {
                if let number = Int(text) {
                    if number == randomInt && number >= 1 && number <= 9 {
                        self.randomLabel.text = "Вы угадали"
                    } else {
                        self.randomLabel.text = "Не угадали"
                    }
                }
            } else {
                self.randomLabel.text = "Будьте внимательны"
            }
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите число от 1 до 9"
        }
        
        alertController.addAction(closeButton)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}



