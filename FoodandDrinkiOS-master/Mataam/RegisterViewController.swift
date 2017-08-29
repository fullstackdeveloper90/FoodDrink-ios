
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrvRegister: UIScrollView!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnPrivacyPolice: UIButton!
    
    @IBOutlet weak var imgvCheckbox: UIImageView!
    var isSelect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Translucent NavigationBar
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        // NavigationBar title color
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)

        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    //MARK: - IBActions
    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPrivacy(_ sender: Any) {
        if isSelect {
            imgvCheckbox.image = #imageLiteral(resourceName: "checkbox")
            isSelect = false
        }else{
            imgvCheckbox.image = #imageLiteral(resourceName: "checkboxp")
            isSelect = true
        }
    }
    @IBAction func onRegister(_ sender: Any) {
        performSegue(withIdentifier: "sms", sender: nil)
    }
    
    @IBAction func onPrivacyPolicyBtn(_ sender: Any) {
        performSegue(withIdentifier: "privacy", sender: nil)
    }
    @IBAction func onTermsBtn(_ sender: Any) {
        performSegue(withIdentifier: "privacy", sender: nil)
    }
    //MARK: - CustomFunc
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            scrvRegister.contentInset = contentInsets
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrvRegister.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
    {
        dismissKeyboard()
        return true
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
