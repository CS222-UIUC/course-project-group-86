//
//  ImportViewController.swift
//  PhotoRoulette
//
//  Created by Yu Jun Yam on 10/12/22.
//
import UIKit
import Parse

class ImportViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var PhotoView: UIImageView!
    
    @IBAction func ImportButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            PhotoView.image = image
            let resized = resizeImage(im: image, size: CGSizeMake(30, 30))
            let imageData = PhotoView.image!.pngData()! as NSData
            let file = PFFileObject(name: "gameImage.png", data: imageData as Data)
            PFUser.current()?["gameImage"] = file;
            PFUser.current()?.saveInBackground()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func resizeImage (im: UIImage, size: CGSize) -> UIImage {
        let resized = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        resized.contentMode = UIView.ContentMode.scaleAspectFill
        resized.image = im;
        
        UIGraphicsBeginImageContext(size);
        resized.layer.render(in: UIGraphicsGetCurrentContext()!);
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return newImage;
    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
