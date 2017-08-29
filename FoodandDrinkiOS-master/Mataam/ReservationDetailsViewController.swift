
import UIKit

class ReservationDetailsViewController: UIViewController {

    @IBOutlet weak var real_view: UIView!
    @IBOutlet weak var close_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: my functions
    func initViews() {
        real_view.layer.cornerRadius = 5
        close_btn.layer.cornerRadius = 5
    }

    @IBAction func close_Act(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
