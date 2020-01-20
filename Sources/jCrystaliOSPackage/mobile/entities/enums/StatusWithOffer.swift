public enum StatusWithOffer : Int{
	case Created = 0
	case Started = 1
	case Finished = 2
	case Finished_but_not_paid = 3
	case Retry_payment = 4
	case Paid = 5
	case Cancelled = 6
	case Cancelled_and_paid = 7
	case Cancelled_but_not_paid = 8
	var rawName: String!{
		switch self{
			case .Created : return "Created"
			case .Started : return "Started"
			case .Finished : return "Finished"
			case .Finished_but_not_paid : return "Finished_but_not_paid"
			case .Retry_payment : return "Retry_payment"
			case .Paid : return "Paid"
			case .Cancelled : return "Cancelled"
			case .Cancelled_and_paid : return "Cancelled_and_paid"
			case .Cancelled_but_not_paid : return "Cancelled_but_not_paid"
		}
	}
	var id: Int{
		return self.rawValue
	}
	public static func fromId(_ id : Int) -> StatusWithOffer{
		return StatusWithOffer(rawValue: id)!
	}
	static let values = [Created, Started, Finished, Finished_but_not_paid, Retry_payment, Paid, Cancelled, Cancelled_and_paid, Cancelled_but_not_paid]
}