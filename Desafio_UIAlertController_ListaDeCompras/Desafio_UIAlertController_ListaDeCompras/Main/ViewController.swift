//
//  ViewController.swift
//  Desafio_UIAlertController_ListaDeCompras
//
//  Created by Grazi Berti on 28/10/20.
//

import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {
  
    
    @IBOutlet weak var tableViewList: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    let defaults = UserDefaults.standard
    
    
    
    //var arrayList: [String]  = ["Café", "Arroz", "Suco de Uva"]
    var arrayList = [List] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        arrayList.append(List(name: "Café"))
        arrayList.append(List(name: "Arroz"))
        arrayList.append(List(name: "Suco de Uva"))
        arrayList.append(List(name: "Melancia"))
        arrayList.append(List(name: "Óleo"))
        
        tableViewList.reloadData()
        
        
        
       
    }
    @IBAction func addItem(){
        let alert = UIAlertController(title: "IVY PARK MARKET",
                                              message: "",
                                              preferredStyle: .alert)
                
                
                alert.addTextField(configurationHandler: { textField in
                    textField.placeholder = "placeholder"
                    textField.tag = 10
                })
                
                let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                let addButton = UIAlertAction(title: "OK", style: .default) { _ in
                    if let textField = alert.textFields?.first, let text = textField.text {
                        
                        
                        self.arrayList.append(List(name: "\(text)"))
                        self.tableViewList.reloadData()
                    }
                }
                
                alert.addAction(cancelButton)
                alert.addAction(addButton)
                present(alert, animated: true, completion: nil)
            }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "IVY PARK MARKET",
                                      message: "",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Editar", style: .default, handler: {
            (action) in
            
            let alert = UIAlertController(title: "EDITAR",
                                                  message: "",
                                                  preferredStyle: .alert)
                    
                    
                    alert.addTextField(configurationHandler: { textField in
                        textField.placeholder = "placeholder"
                        textField.tag = 10
                    })
                    
                    let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    let addButton = UIAlertAction(title: "OK", style: .default) { _ in
                        if let textField = alert.textFields?.first, let text = textField.text {
                            
                            self.arrayList.remove(at: indexPath.row)
                            self.tableViewList.reloadData()
                            self.arrayList.append(List(name: "\(text)"))
                            self.tableViewList.reloadData()
                        }
                    }
                    
                    alert.addAction(cancelButton)
                    alert.addAction(addButton)
            
            self.present(alert, animated: true, completion: nil)
            
       }))
        
        
        alert.addAction(UIAlertAction(title: "Excluir", style: .default, handler: {
            (action) in
            
            self.arrayList.remove(at: indexPath.row)
            self.tableViewList.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
        
        
   }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListDetailableViewCell", for: indexPath) as! ListDetailableViewCell
        
        cell.setup(list: arrayList[indexPath.row])
        
        return cell
    }
    
    
}

