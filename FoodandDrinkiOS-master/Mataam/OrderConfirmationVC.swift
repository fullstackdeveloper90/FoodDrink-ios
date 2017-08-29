

import UIKit

class OrderConfirmationVC: UIViewController {
    
    //IBOutlet
    @IBOutlet var TimeTitle: UILabel!
    
    @IBOutlet var AmountTitle: UILabel!
    
    
    @IBOutlet var lblRestaurant: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblAmount: UILabel!
    @IBOutlet var lblPayment: UILabel!
    @IBOutlet var lblNo: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblType: UILabel!
    
    @IBOutlet var btnOrder: UIButton!
    @IBOutlet var btnHome: UIButton!
    
    //Valiable
    var serviceType = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        updateUI(type:serviceType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - MyFunc
    func initUI() {
        btnOrder.layer.cornerRadius = CGFloat(Corner_radious2)
        btnHome.layer.cornerRadius = CGFloat(Corner_radious2)
    }

    func updateUI(type:Int) {
        switch type {
        case 3:
            TimeTitle.text = "Reservation Time"
            AmountTitle.text = "Deposit Amount"
            lblTime.text = "16/07/2017  17:30"
            btnHome.backgroundColor = RED_COLOR
        case 2:
            TimeTitle.text = "Pickup Time"
            btnHome.backgroundColor = BLUE_COLOR
        case 4:
            TimeTitle.text = "Catering Time"
            btnHome.backgroundColor = ORANGE_COLOR

        default:
            break
        }
    }
    
    //MARK: - IBAction
    @IBAction func onBtnHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func onBtnViewOrder(_ sender: Any) {
        performSegue(withIdentifier: "orderview", sender: nil)
    }
    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
}
