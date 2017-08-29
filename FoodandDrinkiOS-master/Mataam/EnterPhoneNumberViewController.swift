
import UIKit

class EnterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var apply_btn: UIButton!
    @IBOutlet weak var cancel_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: My Functions
    func initViews() {
        apply_btn.layer.cornerRadius = 5
        cancel_btn.layer.cornerRadius = 5
    }

    @IBAction func apply_act(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    @IBAction func cancel_act(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }

}
