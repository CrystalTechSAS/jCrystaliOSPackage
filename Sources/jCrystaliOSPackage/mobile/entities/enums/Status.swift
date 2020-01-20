public enum Status : Int{
	case Enviado = 0
	case Aceptado = 1
	case Rechazada_Cuidador = 2
	case Rechazada_Usuario = 3
	case Vemcida = 4
	var rawName: String!{
		switch self{
			case .Enviado : return "Enviado"
			case .Aceptado : return "Aceptado"
			case .Rechazada_Cuidador : return "Rechazada_Cuidador"
			case .Rechazada_Usuario : return "Rechazada_Usuario"
			case .Vemcida : return "Vemcida"
		}
	}
	var id: Int{
		return self.rawValue
	}
	public static func fromId(_ id : Int) -> Status{
		return Status(rawValue: id)!
	}
	static let values = [Enviado, Aceptado, Rechazada_Cuidador, Rechazada_Usuario, Vemcida]
}