
import UIKit

extension UIViewController {
    func addEndEditingTapHandler() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(sender:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func tapGestureHandler(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
