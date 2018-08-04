
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    let requestFactory = RequestFactory()
    var logout: LogoutResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabbarController = self.tabBarController as! TabBarController
        self.id.text = tabbarController.id
        self.username.text = tabbarController.username
        self.firstname.text = tabbarController.firstname
        self.lastname.text = tabbarController.lastname
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        let auth: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        auth.logout { response in
            switch response.result {
            case .success(let logout):
                self.logout = logout
                print(logout)
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "logout", sender: self)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func unwindBack(_ sender: UIStoryboardSegue) {
        
    }
}
