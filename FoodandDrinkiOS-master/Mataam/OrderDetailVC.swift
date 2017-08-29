
import UIKit

class OrderDetailVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = CGFloat(Corner_radious2)
        btnCancel.layer.cornerRadius = CGFloat(Corner_radious2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTVCell", for: indexPath)
        return cell
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: -tableview delegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        view.backgroundColor = UIColor.lightGray
        
        label.text="Order details:"
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func onCloseBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}

class OrderDetailTVCell: UITableViewCell {
    @IBOutlet var imgvFoodItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgvFoodItem.layer.borderColor = UIColor.lightGray.cgColor
        imgvFoodItem.layer.borderWidth = 1
    }
}
