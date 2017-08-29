
import UIKit

class NewAddressVC: UIViewController, UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate, UITextViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let addressMenu = ["Address Name", "Area*","Street*","Block*", "House Name/Number*","Floor*","Appartment/Office*","Extra Details (Add more details for delivery)"]
    let addressPlaceholder = ["Home, office,etc","Choose your city","Street name","","","1","0","Example"]
    
    var button = UIButton()
    var  isEdit = true
    var selectedCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "OrderTVFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "orderfooter")
        self.tableView.register(UINib(nibName: "NewAddressTVCell", bundle: nil), forCellReuseIdentifier: "NewAddressTVCell")
        self.tableView.register(UINib(nibName: "NewAddressNoteTVCell", bundle: nil), forCellReuseIdentifier: "NewAddressNoteTVCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        button = UIButton (type: .system)
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (customView: button)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        button.addTarget(self, action: #selector(self.changeBarButtonImage), for: .touchUpInside)
        changeBarButtonImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressMenu.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let emptyCell = UITableViewCell ()
        if indexPath.row != 7 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "NewAddressTVCell") as! NewAddressTVCell!
            cell?.selectionStyle = .none
            if indexPath.row == 1{
                cell?.imgvarrow.isHidden = false
            }
            cell?.lblTitle.text = addressMenu[indexPath.row]
            cell?.tfAddress.placeholder = addressPlaceholder[indexPath.row]
            cell?.tfAddress.delegate = self
            cell?.tfAddress.tag = indexPath.row
            
            if !isEdit {
                cell?.tfAddress.isEnabled = false
            }else{
                cell?.tfAddress.isEnabled = true
            }
            return cell!

        }else if indexPath.row == 7{

            let cell = tableView.dequeueReusableCell(withIdentifier: "NewAddressNoteTVCell") as! NewAddressNoteTVCell!
            cell?.selectionStyle = .none
            cell?.lblTitle.text = addressMenu[indexPath.row]
            cell?.txtVDetail.placeholder = addressPlaceholder[indexPath.row]
            cell?.txtVDetail.delegate = self
            cell?.txtVDetail.tag = indexPath.row
            
            if !isEdit {
                cell?.txtVDetail.isEditable = false
            }else{
                cell?.txtVDetail.isEditable = true
            }
            
            return cell!

        }else{
            return emptyCell
        }
        
    }
    
    // MARK: - Table view data delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "choosearea", sender: nil)
        }
    }
    
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "orderfooter") as! OrderTVFooter

        footer.btnCheckout.backgroundColor = GREEN_COLOR
        footer.btnCheckout.setTitle("Save address", for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onSaveAddress))
        footer.btnCheckout.addGestureRecognizer(tap)
        
        if !isEdit {
            footer.btnCheckout.isEnabled = false
        }else{
            footer.btnCheckout.isEnabled = true
        }

        
        return footer
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 7 {
            return 80
        }else {
            return 124
        }
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44.0
    }
    //MARK: - textfield delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedCell = textField.tag
        if textField.tag == 1 {
            performSegue(withIdentifier: "choosearea", sender: nil)
        }
    }
    //MARK: - textview delegate
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        selectedCell = textView.tag
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        selectedCell = textView.tag
    }
    //MARK: - MyFunc
    
    func onSaveAddress (){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            self.tableView.contentInset = contentInsets
            
            let index = IndexPath(row: selectedCell, section: 0) // use your index number or Indexpath
            self.tableView.scrollToRow(at: index,at: .bottom, animated: true)

        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }

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

    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
}
