
import UIKit

class RestaurantReviewTVC: UITableViewCell {

    @IBOutlet weak var vContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
