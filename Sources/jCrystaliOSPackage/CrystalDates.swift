import Foundation
public class CrystalDateTime{
    public static let SDF : DateFormatter = createDateFormatter("yyyyMMddHHmm", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalDateTime.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalDateTime.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalTime{
    public static let SDF : DateFormatter = createDateFormatter("HHmm", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalTime.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalTime.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalDate{
    public static let SDF : DateFormatter = createDateFormatter("yyyyMMddHHmm", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalDate.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalDate.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalDateSeconds{
    public static let SDF : DateFormatter = createDateFormatter("yyyyMMddHHmmss", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalDateSeconds.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalDateSeconds.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalTimeSeconds{
    public static let SDF : DateFormatter = createDateFormatter("HHmmss", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalTimeSeconds.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalTimeSeconds.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalDateMilis{
    public static let SDF : DateFormatter = createDateFormatter("yyyyMMddHHmmssSSS", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalDateMilis.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalDateMilis.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
public class CrystalTimeMilis{
    public static let SDF : DateFormatter = createDateFormatter("HHmmssSSS", "UTC")
    private let date : Date
    public init(_ text : String){
        date = CrystalTimeMilis.SDF.date(from: text)!
    }
    public init(){
        date = Date()
    }
    public init(date : Date){
        self.date = date
    }
    public func getDate() -> Date{
        return date;
    }
    public func format() -> String{
        return CrystalTimeMilis.SDF.string(from: date)
    }
    public func toSimpleTimeFormat() -> String{
        return SDF_SIMPLE_TIME.string(from: date);
    }
    public func toSimpleDateFormat() -> String{
        return SDF_SIMPLE_DATE.string(from: date);
    }
    public func toSimpleDateTextFormat() -> String{
        return SDF_SIMPLE_DATE_TEXT.string(from: date);
    }
    public func toSimpleDateTimeFormat() -> String{
        return SDF_SIMPLE_DATE_TIME.string(from: date);
    }
}
