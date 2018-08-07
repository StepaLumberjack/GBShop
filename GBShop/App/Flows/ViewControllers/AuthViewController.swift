import UIKit

class AuthViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    var userData: LoginResult!

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func authButtonPressed(_ sender: Any) {
        guard let userName = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let auth: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let login):
                self.userData = login
                print(login)
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showChoiceFromLogin", sender: self)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChoiceFromLogin" {
            let vc = segue.destination as! TabBarController
            vc.id = String(self.userData.user.id)
            vc.username = self.userData.user.login
            vc.firstname = self.userData.user.name
            vc.lastname = self.userData.user.lastname
        }
    }

}


