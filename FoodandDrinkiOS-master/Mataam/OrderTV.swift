
import UIKit

class OrderTV: UITableViewController {

    var serviceType = 1
    var isEdit = false
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        button = UIButton (type: .system)
//        button.setTitle("Edit", for: .normal)
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (customView: button)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        button.addTarget(self, action: #selector(self.changeBarButtonImage), for: .touchUpInside)

        
        self.tableView.translatesAutoresizingMaskIntoConstraints = true
        
        self.tableView.register(UINib(nibName: "OrderTVHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "orderheader")
        self.tableView.register(UINib(nibName: "OrderTVFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "orderfooter")
        
        self.tableView.register(UINib(nibName: "OrderSummaryTVC", bundle: nil), forCellReuseIdentifier: "OrderSummaryTVC")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryTVC") as! OrderSummaryTVC!
        
        if isEdit {
            cell?.btnPlus.isEnabled = true
            cell?.btnMinus.isEnabled = true

        }else {
            cell?.btnPlus.isEnabled = false
            cell?.btnMinus.isEnabled = false
        }
        
        cell?.serviceType = self.serviceType
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if isEdit {
            return true
        }else {
            return false
        }
    }

    // MARK: - Table view data delegate
    
    
    // Header
    
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "orderheader") as! OrderTVHeader
        switch serviceType {
        case 1:
            header.cosVRate.settings.filledColor = GREEN_COLOR
            header.cosVRate.settings.filledBorderColor = GREEN_COLOR
        case 2:
            header.cosVRate.settings.filledColor = BLUE_COLOR
            header.cosVRate.settings.filledBorderColor = BLUE_COLOR
        case 3:
            break
        case 4:
            header.cosVRate.settings.filledColor = ORANGE_COLOR
            header.cosVRate.settings.filledBorderColor = ORANGE_COLOR
        default:
            break
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "orderfooter") as! OrderTVFooter
        
        switch serviceType {
        case 1:
            footer.btnCheckout.backgroundColor = GREEN_COLOR
        case 2:
            footer.btnCheckout.backgroundColor = BLUE_COLOR
        case 3:
            break
        case 4:
            footer.btnCheckout.backgroundColor = ORANGE_COLOR
        default:
            break
        }

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onProceedToCheckout))
        footer.btnCheckout.addGestureRecognizer(tap)
        return footer

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 132.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44.0
    }

    //MARK: - MyFunc
    
    func onProceedToCheckout (){
        self.performSegue(withIdentifier: "checkout", sender: self)
    }
    
    func initUI () {
    self.tableView.reloadData()
    }

    func changeBarButtonImage () {
        
        if isEdit {
            button.setImage(UIImage(named: "pencil"), for: .normal)
        }else{
            button.setImage(UIImage(named: "checkmark"), for: .normal)
        }
        isEdit = !isEdit
        tableView.reloadData()
    }
    //MARK: - IBAction
    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "checkout") {
            let searchVC = segue.destination as? DeliveryCheckoutVC
            searchVC?.serviceType = self.serviceType
        }
    }

}
