
import UIKit

class AdvertismentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - IBActions
    
    @IBAction func onSkipAd(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: nil)
    }

}
