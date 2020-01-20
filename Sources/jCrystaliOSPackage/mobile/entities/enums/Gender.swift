public enum Gender : Int{
	case Macho = 0
	case Hembra = 1
	var rawName: String!{
		switch self{
			case .Macho : return "Macho"
			case .Hembra : return "Hembra"
		}
	}
	var id: Int{
		return self.rawValue
	}
	public static func fromId(_ id : Int) -> Gender{
		return Gender(rawValue: id)!
	}
	static let values = [Macho, Hembra]
}