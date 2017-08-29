
import UIKit

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
