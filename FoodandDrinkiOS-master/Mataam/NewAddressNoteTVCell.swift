import UIKit

class NewAddressNoteTVCell: UITableViewCell {

    @IBOutlet weak var vTextView: UIView!
    @IBOutlet weak var txtVDetail: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtVDetail.placeholder = "Example"
        vTextView.layer.borderWidth = 1
        vTextView.layer.borderColor = UIColor.lightGray.cgColor
        vTextView.layer.cornerRadius = CGFloat(Corner_radious2)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
