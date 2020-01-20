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
func createDateFormatter(_ format : String, _ timeZone : String!) -> DateFormatter{
    let ret = DateFormatter()
    ret.dateFormat=format
    ret.locale = Locale(identifier: "en_US")
    if timeZone != nil{
		ret.timeZone = TimeZone(abbreviation: timeZone)
    }
    return ret
}
let SDF_SIMPLE_TIME = createDateFormatter("HH:mm", nil)
let SDF_SIMPLE_DATE = createDateFormatter("dd/MM/yyyy", nil)
let SDF_SIMPLE_DATE_TEXT = createDateFormatter("dd 'de' MMMM 'de' yyyy", nil)
let SDF_SIMPLE_DATE_TIME = createDateFormatter("dd/MM/yyyy HH:mm", nil)
                
public func jsonQuote(_ textNN: String) -> String {
        if !textNN.isEmpty{
            var ret : String = "\""
            var b : Character = Character("\0")
            let scalars = textNN.unicodeScalars
            var pos = 0
            for c in textNN{
                switch (c) {
                    case "\\":
                        ret += "\\\\"
                        break
                    case "\"":
                        ret += "\\\""
                        break;
                    case "/":
                        if (b == "<") {
                            ret += "\\"
                        }
                        ret.append(c)
                        break;
                case "\u{8}":
                        ret += "\\b"
                        break;
                    case "\t":
                        ret += "\\t"
                        break;
                    case "\n":
                        ret += "\\n"
                        break;
                    case "\u{C}":
                        ret += "\\f"
                        break;
                    case "\r":
                        ret += "\\r"
                        break;
                    default:
                        if (c < " " || (c >= "\u{0080}" && c < "\u{00a0}") || (c >= "\u{2000}" && c < "\u{2100}")) {
                            ret += "\\u" + String(format: "%04X", scalars[scalars.index(scalars.startIndex, offsetBy: pos)].value)
                        } else {
                            ret.append(c)
                        }
                }
                b = c
                pos += 1
            }
            return ret + "\""
        }
        return "\"\""
}
public func jsonQuote(_ a : [Int64]) -> String{
    var ret = "["
    if a.count > 0{
        ret += "\(a[0])"
        for i in 1 ..< a.count {
	        ret += ",\(a[i])"
	    }
    }
    
    return ret + "]"
}
public func jsonQuote(_ a : [Int]) -> String{
    var ret = "["
    if a.count > 0{
        ret += "\(a[0])"
        for i in 1 ..< a.count {
	        ret += ",\(a[i])"
	    }
    }
    return ret + "]"
}
public func jsonQuote(_ a : [Double]) -> String{
    var ret = "["
    if a.count > 0{
		ret += "\(a[0])"
		for i in 1 ..< a.count {
	        ret += ",\(a[i])"
	    }
    }
    return ret + "]"
}
public func jsonQuote(_ a : [Bool]) -> String{
    var ret = "["
    if a.count > 0{
        ret += "\(a[0])"
        for i in 1 ..< a.count {
            ret += ",\(a[i])"
        }
    }
    return ret + "]"
}
public func jsonQuote(_ a : [String]) -> String{
    var ret = "["
    if a.count >= 1{
		ret += "\(jsonQuote(a[0]))"
        for i in 1 ..< a.count {
            ret += ",\(jsonQuote(a[i]))"
        }
    }
    return ret + "]"
}
