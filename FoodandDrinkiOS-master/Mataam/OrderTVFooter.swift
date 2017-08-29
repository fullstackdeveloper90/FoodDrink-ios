
import UIKit

class OrderTVFooter: UITableViewHeaderFooterView {

    @IBOutlet weak var btnCheckout: UIButton!

    override func draw(_ rect: CGRect) {
        btnCheckout.layer.cornerRadius = CGFloat(Corner_radious2)
    }


}
