
import UIKit

class NewAddressTVCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vTextField: UIView!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var imgvarrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vTextField.layer.borderWidth = 1
        vTextField.layer.borderColor = UIColor.lightGray.cgColor
        vTextField.layer.cornerRadius = CGFloat(Corner_radious2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
