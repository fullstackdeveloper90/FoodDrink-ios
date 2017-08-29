
import UIKit

class PopAddressVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tvPopAddress: UITableView!

    var addressList = ["My Home","PaPa Home","Brother Home","SisterHome","PaPa Home","Brother Home","SisterHome"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tvPopAddress.layer.borderWidth = 1
        tvPopAddress.layer.cornerRadius = CGFloat(Corner_radious2)
        tvPopAddress.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "addresscell", for: indexPath)
        cell.textLabel?.text = addressList[indexPath.row]
        return cell
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: -tableview delegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//        let view = UIView()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        view.backgroundColor = UIColor.lightGray

//        let label = UILabel()
        label.text="Select Address"
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }

}
