
import UIKit

class RegisterViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var bio: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {

        guard let username = username.text else { return }
        guard let password = password.text else { return }
        guard let email = email.text else { return }
        guard let gender = gender.text else { return }
        guard let creditCard = creditCard.text else { return }
        guard let bio = bio.text else { return }
        
        let userData = UserData(
            id: 123,
            userName: username,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio)
        
        let register: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        register.register(userData: userData) { response in
            switch response.result {
            case .success(let register):
                print(register)
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showChoiceFromRegister", sender: self)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
