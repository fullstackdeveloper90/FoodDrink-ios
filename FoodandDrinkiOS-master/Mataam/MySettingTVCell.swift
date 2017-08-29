
import UIKit

class MySettingTVCell: UITableViewCell {

    @IBOutlet weak var imgvSettingCell: UIImageView!
    @IBOutlet weak var lblSettingLabel: UILabel!
    @IBOutlet weak var switchNotification: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
