

import UIKit
import Cosmos

class RateViewController: UIViewController {

    @IBOutlet weak var scvRate: UIScrollView!
    @IBOutlet weak var vRate: UIView!
    @IBOutlet weak var cvRate: CosmosView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view22: UIView!
    
    @IBOutlet weak var tvRate: UITextView!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //MARK: - MyFunc
    func initUI() {
        self.vRate.layer.cornerRadius = CGFloat(Corner_radious2)
        self.view1.layer.cornerRadius = CGFloat(Corner_radious2)
        self.view2.layer.cornerRadius = CGFloat(Corner_radious2)
        self.view22.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnApply.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnCancel.layer.cornerRadius = CGFloat(Corner_radious2)
        self.tvRate.placeholder = "Leave a Review (optional)"
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            
            self.scvRate.contentInset = contentInsets
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.scvRate.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: - IBAction
    @IBAction func onApply(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
