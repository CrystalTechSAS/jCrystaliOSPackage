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
import Foundation

extension OutputStream{
	public func print(_ data : Data){
        let encodedDataArray = [UInt8](data)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ string : String){
        let encodedDataArray = [UInt8](string.utf8)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ int : Int){
        let encodedDataArray = [UInt8]("\(int)".utf8)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ int64 : Int64){
        let encodedDataArray = [UInt8]("\(int64)".utf8)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ double : Double){
        let encodedDataArray = [UInt8]("\(double)".utf8)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ bool : Bool){
        let encodedDataArray = [UInt8]("\(bool)".utf8)
        write(encodedDataArray, maxLength: encodedDataArray.count)
    }
    public func print(_ s1 : String, _ s2 : String) {
        print(s1)
        print(s2)
    }
    public func print(_ s1 : String, _ s2 : Int ) {
        print(s1)
        print(s2)
    }
    public func print(_ s1 : String, _ s2 : Int64) {
        print(s1)
        print(s2)
    }
    public func print(_ s1 : String, _ s2 : Bool ) {
        print(s1)
        print(s2)
    }
    public func print(_ s1 : String, _ s2 : Double) {
        print(s1)
        print(s2)
    }
    public func print(_ s1 : String, _ s2 : String, _ s3 : String) {
        print(s1)
        print(s2)
        print(s3)
    }
    public func print(_ s1 : String, _ s2 : Int64 , _ s3 : String) {
        print(s1)
        print(s2)
        print(s3)
    }
    public func print(_ s1 : String, _ s2 : String, _ s3 : String, _ s4 : String) {
        print(s1)
        print(s2)
        print(s3)
        print(s4)
    }
}
