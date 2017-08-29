
import UIKit

class MyAddressTVC: UITableViewController {

    var button = UIButton()
    var  isEdit = false
    var rowCount = 3
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    func changeBarButtonImage(){
        if !isEdit {
            button.setImage(UIImage(named: "checkmark"), for: .normal)
            isEdit = !isEdit
            self.isEditing = true
            rowCount = 3
            tableView.reloadData()
        }else{
            button.setImage(UIImage(named: "pencil"), for: .normal)
            isEdit = !isEdit
            self.isEditing = false
            rowCount = 2
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Home"
            break
        case 1:
            cell.textLabel?.text = "Office"
            break
        case 2:
            cell.textLabel?.text = "Add new address"
            break

        default:
            break
        }
        
        return cell

    }
    
    //MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "newaddress", sender: nil)
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if isEdit {
            switch indexPath.row {
            case 0:
                return .delete
            case 1:
                return .delete
            case 2:
                return .insert
            default:
                break
            }
        }
        return .none
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            performSegue(withIdentifier: "newaddress", sender: nil)
        }    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "newaddress") {
            let newAddressVC = segue.destination as? NewAddressVC

            if selectedIndex == 2 {
                newAddressVC?.isEdit = false
            }
            
        }
    }


}
