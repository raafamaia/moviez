//
//  AddMovieVC.swift
//  moviez
//
//  Created by R. Maia on 8/7/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var addImgBtn: UIButton!
    
    @IBOutlet weak var titleMovie: UITextField!
    @IBOutlet weak var descMovie: UITextField!
    @IBOutlet weak var plotMovie: UITextField!
    @IBOutlet weak var urlMovie: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img.clipsToBounds = true
        img.layer.cornerRadius = img.frame.size.width / 2
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    @IBAction func addImageBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovieBtnPressed(sender: AnyObject) {
        
        if let title = titleMovie.text where title != "", let desc = descMovie.text where desc != ""
            , let url = urlMovie.text where url != "", let plot = plotMovie.text where plot != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.title = title
            movie.desc = desc
            movie.url = url
            movie.plot = plot
            movie.setMovieImage(img.image!)
            
            context.insertObject(movie)
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        img.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        if img.image == nil {
            addImgBtn.setTitle("Add Image", forState: .Normal)
        }
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }

}
