
import UIKit

class ReservationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }

}
