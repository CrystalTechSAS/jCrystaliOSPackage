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

public class DBUtils{
    private static let coma = [UInt8](",".utf8)
    public static func getPath(_ partKey: String!, _ key: String, append : Bool = false)-> URL!{
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var path = dir
            if let partKeyNN = partKey {
                path = path.appendingPathComponent(partKeyNN)
                do{
                    try FileManager.default.createDirectory(atPath: path.path, withIntermediateDirectories: append, attributes: nil)
                }
                catch{
                    if DEBUG {
                    }
                    return nil
                }
            }
            return path.appendingPathComponent(key)
        }
        return nil
    }
    public static func getOutputStream(_ partKey: String!, _ key: String, append : Bool = false)-> OutputStream!{
        if let path = DBUtils.getPath(partKey, key) {
            if let outputstream = OutputStream.init(url: path, append: append) {
                return outputstream
            }
        }
        return nil
    }
    @discardableResult public static func store(partKey: String!, key: String, _ storer: (OutputStream)->())->Bool{
        if let outputstream = getOutputStream(partKey, "V" + key) {
            outputstream.open()
            storer(outputstream);
            outputstream.close()
            return true
        }
        return false
    }
    @discardableResult public static func store<T>(partKey : String!, key: String, values: [T], storer: (OutputStream, T)->())->Bool{
        if values.count == 0 {
            DBUtils.deleteList(partKey : partKey, key : key)
            return true
        }
        else{
            if let outputstream = getOutputStream(partKey, "L" + key) {
                outputstream.open()
                for value in values{
                    outputstream.write(DBUtils.coma, maxLength: DBUtils.coma.count)
                    storer(outputstream, value)
                }
                outputstream.close()
                return true
            }
            return false
        }
        
    }
    public static func retrieve<T>(partKey: String!, key: String, converter : ([String: AnyObject])->(T))-> T!{
        do{
            if let path = DBUtils.getPath(partKey, "V" + key) {
                let text = try String(contentsOf: path, encoding: String.Encoding.utf8)
                if let data = text.data(using: .utf8) {
                    if let jsondata = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                        return converter(jsondata)
                    }
                }
            }
        }
        catch {}
        return nil
    }
    public static func retrieveList<T>(_ partKey: String!, _ key: String, _ creator: (_ json : [String: AnyObject]) -> T) -> [T]!{
        do{
            if let path = DBUtils.getPath(partKey, "L" + key) {
                let text = try String(contentsOf: path, encoding: String.Encoding.utf8)
                if text.count > 0 {
                    let index = text.index(text.startIndex, offsetBy: 1)
                    if let data = ("[" + String(text[index...])  + "]").data(using: .utf8) {
                        if let jsondata = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                            var ret = [T]()
                            for e in 0 ..< jsondata.count{
                                ret.append(creator(jsondata[e]))
                            }
                            return ret
                        }
                    }
                }
            }
        }
        catch {}
        return nil
    }
    public static func delete(partKey: String!, key: String){
        if let path = DBUtils.getPath(partKey, "V" + key) {
            do{
                try FileManager.default.removeItem(at: path)
            }
            catch{}
        }
    }
    public static func deleteList(partKey: String!, key: String){
        if let path = DBUtils.getPath(partKey, "L" + key) {
            do{
                try FileManager.default.removeItem(at: path)
            }
            catch{}
        }
    }
}
