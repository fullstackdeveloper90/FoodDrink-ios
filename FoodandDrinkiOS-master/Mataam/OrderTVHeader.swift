

import UIKit
import Cosmos

class OrderTVHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var cosVRate: CosmosView!

    @IBOutlet weak var imgLogo: UIImageView!
    
    override func awakeFromNib() {
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }
}
