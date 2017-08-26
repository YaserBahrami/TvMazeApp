import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let deliveryVC: ListViewController = ListViewController()
        self.view.backgroundColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.black

        let BaseNavigation = UINavigationController(rootViewController: deliveryVC)
        self.addChildViewController(BaseNavigation)
        self.view.addSubview(BaseNavigation.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
