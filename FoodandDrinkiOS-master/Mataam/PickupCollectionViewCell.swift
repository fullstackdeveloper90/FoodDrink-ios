
import UIKit

class PickupCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgvLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgvLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgvLogo.layer.borderWidth = 1

    }

}
