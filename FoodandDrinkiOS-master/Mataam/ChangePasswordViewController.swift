
import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var apply_btn: UIButton!
    @IBOutlet weak var cancel_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: My Functions
    
    func initViews() {
        cancel_btn.layer.cornerRadius = 5
        apply_btn.layer.cornerRadius = 5
    }

    //MARK: - IBAction
    @IBAction func apply_act(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancel_btn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }

}
