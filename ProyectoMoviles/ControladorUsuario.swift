//
//  ControladorUsuario.swift
//  ProyectoMoviles
//
//  Created by DAMII on 25/10/23.
//

import UIKit
import CoreData

class ControladorUsuario: NSObject {
    
    
    
    func registrarUsuario(bean:Usuario){
            let delegate=UIApplication.shared.delegate as! AppDelegate
            let contextoBD=delegate.persistentContainer.viewContext
        
            let tabla = UsuarioEntity(context: contextoBD)
            tabla.codigo = Int16(bean.codigo)
            tabla.nombre = bean.nombre
            tabla.apellido = bean.apellidos
            tabla.dni = bean.dni
            tabla.correo = bean.correo
            tabla.nombreUsuario = bean.nombreUsuario
            tabla.password = bean.password
            do{
                try contextoBD.save()
                print("Usuario Registrado")
            }catch let ex as NSError{
                print(ex.localizedDescription)
            }
        }
    func iniciarSesion(nombreUsuario: String, password: String) -> Bool {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UsuarioEntity")
        
        fetchRequest.predicate = NSPredicate(format: "nombreUsuario == %@ AND password == %@", nombreUsuario, password)
        
        do {
            let result = try contextoBD.fetch(fetchRequest)
            return !result.isEmpty
        } catch {
            print("Error al buscar usuario: \(error)")
            return false
        }
    }



    

}
