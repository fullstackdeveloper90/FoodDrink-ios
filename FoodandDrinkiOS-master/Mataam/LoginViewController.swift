
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrvLogin: UIScrollView!
    @IBOutlet weak var btnLoggedIn: UIButton!
    
    var isSelect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        dismissKeyboard()
    }
    
    //MARK: - CustomFunc
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            scrvLogin.contentInset = contentInsets
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrvLogin.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
    {
        dismissKeyboard()
        return true
    }
    
    //MARK: - IBActions
    
    @IBAction func onLoggedIn(_ sender: Any) {
        
        if isSelect {
            btnLoggedIn.setImage(UIImage.init(named:"checkbox.png"), for: UIControlState.normal)
            isSelect = false
        }else{
            btnLoggedIn.setImage(UIImage.init(named:"checkboxp.png"), for: .normal)
            isSelect = true
        }
        
    }
    
    @IBAction func onLogin(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: nil)
    }
    
    @IBAction func onRegister(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: nil)
    }

}
