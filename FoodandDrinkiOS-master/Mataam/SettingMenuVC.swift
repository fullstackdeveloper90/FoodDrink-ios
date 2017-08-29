
import UIKit

class SettingMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvMySetting: UITableView!
    
    let menus = ["My Information", "Change Password", "Change Phone Number","My Address", "Notifications", "Language", "Privacy Policy", "Terms and Conditions", "Log out"]
    let imgMenu = ["user", "lock", "phone", "direction" ,"bell", "flag" ,"question", "italicCopy", "enterCopy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MySettingTVCell"
        
        tableView.register(UINib(nibName: "MySettingTVCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MySettingTVCell!
        
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        cell?.backgroundColor = UIColor.white
        cell?.lblSettingLabel.text = menus[indexPath.row]
        cell?.imgvSettingCell.image = UIImage(named:imgMenu[indexPath.row])
        cell?.switchNotification.isHidden = true
        if indexPath.row == 4 {
            cell?.switchNotification.isHidden = false
            cell?.accessoryType = .none
        }
        
        return cell!
    }
    
    // MARK: - Table view data delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "myinfo", sender: nil)
        case 1:
            performSegue(withIdentifier: "changepass", sender: nil)

        case 2:
            performSegue(withIdentifier: "changephone", sender: nil)

        case 3:
            performSegue(withIdentifier: "myaddress", sender: nil)

        case 4:
            break
        case 5:
            performSegue(withIdentifier: "language", sender: nil)

        case 6:
            performSegue(withIdentifier: "privacypolicy", sender: nil)
        case 7:
            performSegue(withIdentifier: "privacypolicy", sender: nil)
        case 8:
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

        default:
            break
        }

    }
    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }

}
