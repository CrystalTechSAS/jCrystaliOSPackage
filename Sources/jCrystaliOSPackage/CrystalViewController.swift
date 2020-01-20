/*
 * The MIT License
 *
 * Copyright (c) 2018-2019 German Augusto Sotelo Arevalo
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import UIKit

public var ERROR_DIALOG_TITLE = "Error"
public var INFO_DIALOG_TITLE = "Information"
var lastViewHeight = CGFloat.infinity
public extension UIViewController{
    func showAlert(_ text: String, handler: ((UIAlertAction) -> Void)? = nil){
        present(createAlert(text, handler: handler), animated: true, completion: nil)
    }
    func showInfo(_ text: String, titulo: String = INFO_DIALOG_TITLE, handler: ((UIAlertAction) -> Void)? = nil){
        present(createAlert(text, titulo: titulo, handler: handler), animated: true, completion: nil)
    }
    func finish(){
        self.dismiss(animated: true, completion: nil)
    }
    func defaultOnError(_ error : RequestError){
        DispatchQueue.main.async(execute: {
            self.hideActivityIndicator()
            if error.tipoError == TipoError.UNAUTHORIZED{
                //LoginManager.logout()
                //self.performSegue(withIdentifier: "goBack", sender: self)
            }
            if let mjs = error.mensaje{
                self.present(createAlert(mjs), animated: true, completion: nil)
            }else{
                if(error.tipoError == TipoError.NO_INTERNET){
                    self.present(createAlert("You don't have internet. Please try again", titulo: ERROR_DIALOG_TITLE), animated: true, completion: nil)
                }else{
                    self.present(createAlert("There was a problem during this operation. Please try again", titulo: ERROR_DIALOG_TITLE), animated: true, completion: nil)
                }
            }
        })
    }
    func showActivityIndicator(){
		if let activityIndicator = view.viewWithTag(99999999) as? UIActivityIndicatorView{
        }else{
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            activityIndicator.tag = 99999999;
            view.addSubview(activityIndicator)
            activityIndicator.frame = view.bounds
            activityIndicator.startAnimating()
        }    }
    func hideActivityIndicator(){
        if let activityIndicator = view.viewWithTag(99999999) as? UIActivityIndicatorView{
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    //KeyboardUtils
    func register(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func unregister(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWasShown(notification: NSNotification){
        let info = notification.userInfo!
        if let keyboard = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.origin{
            let frame = view.frame
            lastViewHeight = frame.height
            let point = view.convert(keyboard, from: nil)
            view.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: min(frame.height, point.y))
            view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillBeHidden(notification: NSNotification){
        if CGFloat.infinity != lastViewHeight{
            let frame = view.frame
        		view.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: lastViewHeight)
        }
    }
}
public func createAlert(_ text: String, titulo: String = INFO_DIALOG_TITLE, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController{
    let alert = UIAlertController(title: titulo, message: text, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
    alert.view.setNeedsLayout()
    return alert
}
