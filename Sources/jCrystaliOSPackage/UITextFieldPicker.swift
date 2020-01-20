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
extension UITextField{
    @discardableResult public func addSinglePicker<T>(options : [(T, String)]) -> SingleUIPickerView<T>{
        let picker = SingleUIPickerView<T>()
        picker.setup(textField : self, options: options)
        self.inputView = picker
        return picker
    }
    public func addDatePicker(_ target: Any?, action : Selector){
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.backgroundColor = UIColor.white
        self.inputView = datePickerView
        datePickerView.addTarget(target, action : action, for: UIControl.Event.valueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
    @objc func doneDatePicker (sender:UIBarButtonItem){
        if let delegate = self.delegate{
            delegate.textFieldShouldReturn?(self)
        }
    }
}
public class SingleUIPickerView<T> : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate{
    var options : [(T, String)] = []
    var textField : UITextField!
    var listener : ((T)->())!
    var selected : T!
    func setup(textField : UITextField, options : [(T, String)]){
        self.options = options
        self.textField = textField
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.white
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    @objc func donePicker (sender:UIBarButtonItem)
    {
        if selected == nil{
            selectFirst()
        }
        if let delegate = textField.delegate{
            delegate.textFieldShouldReturn?(textField)
        }
    }
    @discardableResult
    func selectFirst() -> SingleUIPickerView<T>{
        if options.count > 0{
            pickerView(self, didSelectRow: 0, inComponent: 0)
        }
        return self
    }
    @discardableResult
    func select(label : String) -> UIPickerView{
        if let ind = options.firstIndex(where: {$0.1 == label}){
            pickerView(self, didSelectRow: ind, inComponent: 0)
        }
        return self
    }
    @discardableResult
    public func addListener(listener : @escaping ((T)->()))  -> SingleUIPickerView<T>{
    	self.listener = listener
        return self
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row < options.count{
            selected = options[row].0
            textField.text = options[row].1
            if let del = listener{
                del(options[row].0)
            }
        }
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row].1
    }
}
