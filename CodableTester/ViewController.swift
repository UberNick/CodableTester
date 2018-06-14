//
//  ViewController.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import UIKit

enum ViewType {
    case json
    case object
}

enum ObjectType: String {
    case foo = "Foo"
    case bar = "Bar"
    case baz = "Baz"
}

class ViewController: UIViewController {

    @IBOutlet weak var fooButton: UIButton!
    @IBOutlet weak var barButton: UIButton!
    @IBOutlet weak var bazButton: UIButton!
    @IBOutlet weak var jsonButton: UIButton!
    @IBOutlet weak var objectButton: UIButton!
    @IBOutlet weak var decodeButton: UIButton!
    @IBOutlet weak var encodeButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    var viewType: ViewType = .json
    var objectType: ObjectType = .foo
    
    var json: String = ""
    var object: Any?
    
    //MARK: - Lifecycle / State Handling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func resetView() {
        json = determineJson(objectType)
        textView.text = determineText(viewType)
        enableControls(viewType, objectType: objectType)
    }
    
    func enableControls(_ viewType: ViewType, objectType: ObjectType) {
        fooButton.isEnabled = true
        barButton.isEnabled = true
        bazButton.isEnabled = true
        jsonButton.isEnabled = true
        objectButton.isEnabled = true
        encodeButton.isEnabled = true
        decodeButton.isEnabled = true
        textView.isEditable = true
        
        switch viewType {
        case .json:
            jsonButton.isEnabled = false
            encodeButton.isEnabled = false
        case .object:
            objectButton.isEnabled = false
            decodeButton.isEnabled = false
            textView.isEditable = false
        }
        
        switch objectType {
        case .foo: fooButton.isEnabled = false
        case .bar: barButton.isEnabled = false
        case .baz: bazButton.isEnabled = false
        }
    }
    
    func determineText(_ viewType: ViewType) -> String {
        switch viewType {
        case .json:
            return json
        case .object:
            return String(describing: object)
        }
    }
    
    func determineJson(_ objectType: ObjectType) -> String {
        guard let data = getJSONData(objectType.rawValue) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
    }

    //MARK: - Button Actions
    
    @IBAction func fooButtonClicked(_ sender: UIButton?) {
        objectType = .foo
        json = determineJson(objectType)
        object = nil
        resetView()
    }

    @IBAction func barButtonClicked(_ sender: UIButton?) {
        objectType = .bar
        json = determineJson(objectType)
        object = nil
        resetView()
    }

    @IBAction func bazButtonClicked(_ sender: UIButton?) {
        objectType = .baz
        json = determineJson(objectType)
        object = nil
        resetView()
    }

    @IBAction func jsonButtonClicked(_ sender: UIButton?) {
        viewType = .json
        resetView()
    }
    
    @IBAction func objectButtonClicked(_ sender: UIButton?) {
        viewType = .object
        resetView()
    }
    
    @IBAction func encodeButtonClicked(_ sender: UIButton?) {        
        switch objectType {
        case .foo: json = encodeJson(from: object as? Foo)
        case .bar: json = encodeJson(from: object as? Bar)
        case .baz: json = encodeJson(from: object as? Baz)
        }
        viewType = .json
        resetView()
    }
    
    @IBAction func decodeButtonClicked(_ sender: UIButton?) {
        json = textView.text
        
        switch objectType {
        case .foo: object = decodeObject(from: json, type: Foo.self)
        case .bar: object = decodeObject(from: json, type: Bar.self)
        case .baz: object = decodeObject(from: json, type: Baz.self)
        }
        
        viewType = .object
        resetView()
    }
    
    //MARK: - Other
    
    func getJSONData(_ fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url) {
            return data
        }
        return nil
    }

    func decodeObject<T: Decodable>(from json: String, type: T.Type) -> Any? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        guard let data = json.data(using: .utf8) else {
            return nil
        }
        do {
            return try decoder.decode(type, from: data)
        } catch {
            return error
        }
    }
    
    func encodeJson<T: Encodable>(from object: T) -> String {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        do {
            let data = try encoder.encode(object)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(describing: error)
        }
    }
}

