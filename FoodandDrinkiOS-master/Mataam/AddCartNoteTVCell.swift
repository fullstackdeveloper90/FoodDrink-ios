
import UIKit

class AddCartNoteTVCell: UITableViewCell {

    @IBOutlet weak var txvCartNote: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        txvCartNote.placeholder = "Please cut sandwitch in two slices"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
