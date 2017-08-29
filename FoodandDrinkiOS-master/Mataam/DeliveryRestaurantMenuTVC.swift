
import UIKit
import Cosmos

protocol PressPlusButton {
    func onPlusButton()
}

class DeliveryRestaurantMenuTVC: UITableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    var delegate: PressPlusButton?
    
    @IBOutlet weak var cosVRate: CosmosView!
    @IBOutlet weak var btnPlus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }
    
    @IBAction func onPlusButton(_ sender: Any) {
        delegate?.onPlusButton()
    }
}
