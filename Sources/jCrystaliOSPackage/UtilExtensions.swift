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

extension UIScrollView : UITextFieldDelegate,UITextViewDelegate{
    public func register(_ vc : UIViewController){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    public func unregister(_ vc : UIViewController){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc public func keyboardWasShown(notification: NSNotification){
        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        self.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height+60, right: 0.0)
        self.scrollIndicatorInsets = self.contentInset
    }
    @objc public func keyboardWillBeHidden(notification: NSNotification){
        self.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0, right: 0.0)
        self.scrollIndicatorInsets = self.contentInset
    }
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var aRect : CGRect = self.superview!.frame
        aRect.origin.y -= self.contentInset.bottom
        if (!aRect.contains(textField.frame.origin)){
            self.scrollRectToVisible(textField.frame.offsetBy(dx: 0, dy: 0), animated: true)
        }
        return true
    }
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        var aRect : CGRect = self.superview!.frame
        aRect.origin.y -= self.contentInset.bottom
        if (!aRect.contains(textView.frame.origin)){
            self.scrollRectToVisible(textView.frame.offsetBy(dx: 0, dy: 0), animated: true)
        }
        return true
    }
    
	public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextView = textField.superview?.viewWithTag(textField.tag + 1){
            if let nextField = nextView as? UITextField {
                nextField.becomeFirstResponder()
            }else if let nextField = nextView as? UIButton{
                textField.resignFirstResponder()
                nextField.sendActions(for: .touchUpInside)
            }
        }else if let tableView = self as? UITableView{
            let nextView = tableView.viewWithTag(textField.tag + 1)
            if let nextField = nextView as? UITextField {
                nextField.becomeFirstResponder()
            }else if let nextField = nextView as? UIButton{
                textField.resignFirstResponder()
                nextField.sendActions(for: .touchUpInside)
            }
        }else{
            var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder!.next
                if let viewController = parentResponder as? UIViewController, viewController.navigationController != nil {
                    let ni = viewController.navigationItem
                    if let ri = ni.rightBarButtonItem, ri.tag == textField.tag + 1{
                        ri.target?.perform(ri.action, with: nil)
                    }
                    break;
                }
            }
            textField.resignFirstResponder()
        }
        return false
    }
    
    public func textViewShouldReturn(_ textView: UITextView) -> Bool {
        if let nextView = textView.superview?.viewWithTag(textView.tag + 1){
            if let nextField = nextView as? UITextField {
                nextField.becomeFirstResponder()
            }else if let nextField = nextView as? UIButton{
                textView.resignFirstResponder()
                nextField.sendActions(for: .touchUpInside)
            }
        }else if let tableView = self as? UITableView{
            let nextView = tableView.viewWithTag(textView.tag + 1)
            if let nextField = nextView as? UITextField {
                nextField.becomeFirstResponder()
            }else if let nextField = nextView as? UIButton{
                textView.resignFirstResponder()
                nextField.sendActions(for: .touchUpInside)
            }
        }else{
            var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder!.next
                if let viewController = parentResponder as? UIViewController, viewController.navigationController != nil {
                    let ni = viewController.navigationItem
                    if let ri = ni.rightBarButtonItem, ri.tag == textView.tag + 1{
                        ri.target?.perform(ri.action, with: nil)
                    }
                    break;
                }
            }
            textView.resignFirstResponder()
        }
        return false
    }
}

extension String{
	 public func isValidEmail() -> Bool {        
    	let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    	let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    	return emailTest.evaluate(with: self)
	}
}
