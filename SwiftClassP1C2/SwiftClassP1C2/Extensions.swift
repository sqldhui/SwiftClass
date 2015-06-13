extension Int
{
    func toStringValue() -> String
    {
        return "\(self)"
    }
}

extension String
{
    enum BiologiCal
    {
        case Plants, Animals, Microbes, Unknown
    }
    var biological: BiologiCal
    {
        switch String(self).lowercaseString
        {
        case "rose", "lily", "orchid", "azalea", "apple": return .Plants
        case "horse", "ox", "sheep", "deer", "cat", "dog", "bear", "rabbit": return .Animals
        case "bacteria", "fungus", "viruses": return .Microbes
        default: return .Unknown
        }
    }
    
    func printStringrKinds() -> String
    {
        switch self.biological
        {
        case .Plants: return "plants"
        case .Animals: return "animals"
        case .Microbes: return "microbes"
        default: return "unknown"
        }
    }
}
