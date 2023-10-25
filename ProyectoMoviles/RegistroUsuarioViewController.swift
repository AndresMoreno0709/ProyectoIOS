//
//  RegistroUsuarioViewController.swift
//  ProyectoMoviles
//
//  Created by DAMII on 25/10/23.
//

import UIKit
import DropDown
import CoreData
class RegistroUsuarioViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    
    
    @IBOutlet weak var txtNombres: UITextField!
    
    
    @IBOutlet weak var txtApellidos: UITextField!
    
    
    @IBOutlet weak var txtDni: UITextField!
    
    
    @IBOutlet weak var txtCorreo: UITextField!
    
    
    @IBOutlet weak var txtNombreUsuario: UITextField!
    
    
    @IBOutlet weak var txtContraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        if let codigo = txtCodigo.text, !codigo.isEmpty,
                   let nombre = txtNombres.text, !nombre.isEmpty,
                   let apellido = txtApellidos.text, !apellido.isEmpty,
                   let dni = txtDni.text, !dni.isEmpty,
                    let correo = txtCorreo.text, !correo.isEmpty,
                    let nousu = txtNombreUsuario.text, !nousu.isEmpty,
                    let pss = txtContraseña.text, !pss.isEmpty{
                    if !codigoExiste(codigo) {
                        let cod = Int(codigo) ?? 0
                        let nom = nombre
                        let ape = apellido
                        let dni = dni
                        let correo = correo
                        let nousu=nousu
                        let pss=pss
                        let obj = Usuario(codigo: cod, nombre: nom, apellidos: ape, dni: dni, correo: correo, nombreUsuario: nousu, password: pss)
                        ControladorUsuario().registrarUsuario(bean: obj)
                        
                        //let notificationName = Notification.Name("Nuevo")
                        //NotificationCenter.default.post(name: notificationName, object: nil)
                        self.navigationController?.popViewController(animated: true)
                    } else {
                        // Muestra una alerta al usuario indicando que el código ya existe
                        let alertController = UIAlertController(title: "Código Existente", message: "El código ingresado ya existe ", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                } else {
                    // Muestra una alerta al usuario indicando que los campos están vacíos
                    let alertController = UIAlertController(title: "Campos Vacíos", message: "completa todos los campos", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            // Función para verificar si el código ya existe en la base de datos
            func codigoExiste(_ codigo: String) -> Bool {
                let delegate = UIApplication.shared.delegate as! AppDelegate
                let contextoBD = delegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
                fetchRequest.predicate = NSPredicate(format: "codigo == %@", codigo)
                
                do {
                    let results = try contextoBD.fetch(fetchRequest)
                    return !results.isEmpty
                } catch {
                    print("Error existe en la base de datos: \(error)")
                    return false
                }
            
        
    }
    
    
    
}
