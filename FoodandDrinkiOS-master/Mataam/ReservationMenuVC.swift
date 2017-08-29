
import UIKit
import SwipeCellKit

class ReservationMenuVC: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    enum ActionDescriptor {
        case detail, reorder, rate, cancel
        
        func title(forDisplayMode displayMode: ButtonDisplayMode) -> String? {
            guard displayMode != .imageOnly else { return nil }
            
            switch self {
            case .detail: return " DETAILS"
            case .reorder: return "RE-ORDER"
            case .rate: return "   RATES"
            case .cancel: return "  CANCEL"
            }
        }
        
        func image(forStyle style: ButtonStyle, displayMode: ButtonDisplayMode) -> UIImage? {
            guard displayMode != .titleOnly else { return nil }
            
            let name: String
            switch self {
            case .detail: name = "preview"
            case .reorder: name = "clockwise"
            case .rate: name = "star"
            case .cancel: name = "cancelorder"
            }
            
            return UIImage(named: style == .backgroundColor ? name : name + "-circle")
        }
        
        var color: UIColor {
            switch self {
            case .detail: return ORANGE_C
            case .reorder: return GREEN_C
            case .rate: return YELLOW_C
            case .cancel: return RED_C
            }
        }
    }
    
    enum ButtonDisplayMode {
        case titleAndImage, titleOnly, imageOnly
    }
    
    enum ButtonStyle {
        case backgroundColor, circular
    }

    
    @IBOutlet var tvReservation: UITableView!

    var defaultOptions = SwipeTableOptions()
    var isSwipeRightEnabled = true
    var buttonDisplayMode: ButtonDisplayMode = .titleAndImage
    var buttonStyle: ButtonStyle = .backgroundColor
    
    var rowCount = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        tvReservation.tableFooterView = UIView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowCount == 0 {
            rowCount = 4
            return 1
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MyReservationTableViewCell"
        let cell = tvReservation.dequeueReusableCell(withIdentifier: cellIdentifier) as! MyReservationTableViewCell!
        
        cell?.delegate = self
        cell?.selectedBackgroundView = createSelectedBackgroundView()
        
        switch indexPath.row {
        case 0:
            cell?.lblStatus.text = "Under Process"
            cell?.lblStatus.textColor = UIColor.orange
        case 1:
            cell?.lblStatus.text = "Completed"
            cell?.lblStatus.textColor = UIColor.green
            
        case 2:
            cell?.lblStatus.text = "Under Process"
            cell?.lblStatus.textColor = UIColor.orange
            
        case 3:
            cell?.lblStatus.text = "Completed"
            cell?.lblStatus.textColor = UIColor.green
            
        default:
            break
        }
        
        return cell!
    }

    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    
    // MARK: - My Func
    func createSelectedBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }
    
    func resetData() {
        
    }

}

extension ReservationMenuVC: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .left {
            return[]
        } else {
            switch indexPath.row {
            case 0:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservdetail", sender: nil)
                }

                configure(action: detail, with: .detail)
                
                let cancel = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.rowCount = self.rowCount - 1
                    self.tvReservation.reloadData()
                }

                configure(action: cancel, with: .cancel)
                
                return [cancel,detail]
            case 1:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let rate = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservrate", sender: nil)
                }
                configure(action: rate, with: .rate)
                
                return [rate,detail]
            case 2:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let cancel = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.rowCount = self.rowCount - 1
                    self.tvReservation.reloadData()
                }
                
                configure(action: cancel, with: .cancel)
                
                return [cancel,detail]
            case 3:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let rate = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "reservrate", sender: nil)
                }
                configure(action: rate, with: .rate)
                
                return [rate,detail]
                
            default:
                return []
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.transitionStyle = defaultOptions.transitionStyle
        
        switch buttonStyle {
        case .backgroundColor:
            options.buttonSpacing = 5
        case .circular:
            options.buttonSpacing = 4
            options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
        }
        
        return options
    }
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        action.image = descriptor.image(forStyle: buttonStyle, displayMode: buttonDisplayMode)
        
        switch buttonStyle {
        case .backgroundColor:
            action.backgroundColor = descriptor.color
        case .circular:
            action.backgroundColor = .clear
            action.textColor = descriptor.color
            action.font = .systemFont(ofSize: 13)
            action.transitionDelegate = ScaleTransition.default
        }
    }
}

class MyReservationTableViewCell: SwipeTableViewCell {

    @IBOutlet var lblStatus: UILabel!
    @IBOutlet var imgvItem: UIImageView!
    
    override func awakeFromNib() {
        setupIndicatorView()
    }
    
    func setupIndicatorView() {
        imgvItem.layer.borderWidth = 1
        imgvItem.layer.borderColor = UIColor.lightGray.cgColor

    }
}
