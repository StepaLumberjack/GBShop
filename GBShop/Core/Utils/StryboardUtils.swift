
import UIKit

extension UIStoryboard {
    class func identifier(of type: AnyClass) -> String {
        return String(describing: type)
    }
    
    class func loadController(identifier: String, storyboardName: String, bundle: Bundle? = nil) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
}
