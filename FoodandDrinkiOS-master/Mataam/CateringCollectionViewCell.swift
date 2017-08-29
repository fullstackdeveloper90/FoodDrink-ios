
import UIKit

class CateringCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }

}
