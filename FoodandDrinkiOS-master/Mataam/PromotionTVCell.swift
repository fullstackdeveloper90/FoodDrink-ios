
import UIKit

class PromotionTVCell: UITableViewCell {
    @IBOutlet var vPromotion: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        vPromotion.layer.borderColor = UIColor.lightGray.cgColor
        vPromotion.layer.borderWidth = 1
        vPromotion.layer.cornerRadius = CGFloat(Corner_radious2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
