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
public class SimpleStore{
	static func get(_ key : String, _ defValue : String! = nil) -> String!{
		let preferences = UserDefaults.standard
		if preferences.object(forKey: key) != nil{
			return preferences.string(forKey: key) ?? defValue
		}
		return defValue
	}
	static func getDouble(_ key : String, _ defValue : Double! = nil) -> Double!{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return preferences.double(forKey: key)
        }
        return defValue
    }
    static func getInt64(_ key : String, _ defValue : Int64! = nil) -> Int64!{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return (preferences.object(forKey: key) as? NSNumber)?.int64Value ?? defValue
        }
        return defValue
    }
    static func getDate(_ key : String, _ defValue : Date! = nil) -> Date!{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return Date(timeIntervalSince1970: preferences.double(forKey: key))
        }
        return defValue
    }
	static func put(_ key : String, string : String!){
		let preferences = UserDefaults.standard
		preferences.set(string, forKey: key)
		preferences.synchronize()
	}
	static func put(_ key : String, double : Double!){
        let preferences = UserDefaults.standard
        preferences.set(double, forKey: key)
        preferences.synchronize()
    }
    static func put(_ key : String, int64 : Int64!){
        let preferences = UserDefaults.standard
        preferences.set(NSNumber(value: int64), forKey: key)
        preferences.synchronize()
    }
    static func put(_ key : String, date : Date!){
        let preferences = UserDefaults.standard
        preferences.set(date.timeIntervalSince1970, forKey: key)
        preferences.synchronize()
    }
}
