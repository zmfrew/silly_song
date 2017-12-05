import Cocoa


//makes name lowercase and removes first character
func shortNameFromName(name: String) -> String {
    var lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let _ = lowercaseName.rangeOfCharacter(from: vowelSet) // may need to replace _ with "place"
    lowercaseName.remove(at: lowercaseName.startIndex)
    return String(lowercaseName)
}

//provides lyrics for silly song
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

//passes the shortened name and full name into the lyrics template to create the song
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let lyrics = lyricsTemplate
    .replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
    .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}

lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Zach")
