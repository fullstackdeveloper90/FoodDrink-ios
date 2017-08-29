
import UIKit

class LanguageVC: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var isCheck = false
    var button = UIButton()
    var  isEdit = false

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        button = UIButton (type: .system)
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (customView: button)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        button.addTarget(self, action: #selector(self.changeBarButtonImage), for: .touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "languagecell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! LanguageCell!
        if indexPath.row == 0 {
            cell?.isEditing = false
            cell?.imgvCheckbox.isHidden = true
            cell?.lblLanguage.isHidden = true
        }else{
        if isCheck {
            cell?.imgvCheckbox.image = #imageLiteral(resourceName: "checkboxp")
        }else{
            cell?.imgvCheckbox.image = #imageLiteral(resourceName: "checkbox")
        }
        }
        cell?.selectionStyle = .none
        
        return cell!
    }

    //MARK: tableview delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEdit {
            isCheck = !isCheck
            tableView.reloadData()
        }

    }
    
    //MARK:- My func
    
    func changeBarButtonImage(){
        if !isEdit {
            button.setImage(UIImage(named: "checkmark"), for: .normal)
            isEdit = !isEdit
            self.isEditing = true
            tableView.reloadData()
        }else{
            button.setImage(UIImage(named: "pencil"), for: .normal)
            isEdit = !isEdit
            self.isEditing = false
            tableView.reloadData()
        }
    }

}
