
import UIKit

class PopOverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

        let areaList = ["A-Z","Z-A","Newest first", "Oldest first", "Highest rated"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AreaCuisineCell"
        tableView.register(UINib(nibName: "AreaCuisineTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AreaCuisineTableViewCell!
        
        cell?.lblName.text = areaList[indexPath.row]
        return cell!
    }

    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Sort by:"
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell:AreaCuisineTableViewCell = tableView.cellForRow(at: indexPath) as! AreaCuisineTableViewCell
        cell.isHighlighted = false
        cell.imgvSelect.image = UIImage(named:"CheckBtn-Pressed")
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
