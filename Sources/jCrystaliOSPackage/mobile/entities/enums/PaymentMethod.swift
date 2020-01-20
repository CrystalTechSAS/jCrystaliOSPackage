public enum PaymentMethod : Int{
	case Credit_Card = 0
	case Cash = 1
	var rawName: String!{
		switch self{
			case .Credit_Card : return "Credit_Card"
			case .Cash : return "Cash"
		}
	}
	var id: Int{
		return self.rawValue
	}
	public static func fromId(_ id : Int) -> PaymentMethod{
		return PaymentMethod(rawValue: id)!
	}
	static let values = [Credit_Card, Cash]
}