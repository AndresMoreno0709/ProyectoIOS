//
//  ViewController.swift
//  ProyectoMoviles
//
//  Created by DAMII on 25/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNombreUsuario: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func btnIniciarSesion(_ sender: UIButton) {
        guard let nombreUsuario = txtNombreUsuario.text, !nombreUsuario.isEmpty,
              let password = txtContraseña.text, !password.isEmpty else {
            // Mostrar un mensaje de error al usuario indicando que los campos están vacíos
            let alert = UIAlertController(title: "Error", message: "Por favor, completa ambos campos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        let controladorUsuario = ControladorUsuario()
        if controladorUsuario.iniciarSesion(nombreUsuario: nombreUsuario, password: password) {
            // Iniciar sesión exitosa, navegar a la pantalla de bienvenida
            performSegue(withIdentifier: "inicio", sender: self)
        } else {
            // Mostrar un mensaje de error específico indicando que el usuario no existe
            let alert = UIAlertController(title: "Error", message: "El usuario no existe.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnRegistrarCuenta(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevoUsuario", sender: nil)
        
        
    }
    
}

