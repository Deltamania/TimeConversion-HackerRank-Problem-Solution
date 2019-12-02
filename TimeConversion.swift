import Foundation

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s: String) -> String {

    //Seperating hour minutes and second , AM-PM is in last part
    var parts = s.components(separatedBy: ":")
    var s1 = ""
    
    if parts[2].contains("A") && parts[0] == "12" {
        parts[0] = "00"
    }
    
    if parts[2].contains("P") && parts[0] != "12" {
        var hour = Int(parts[0])!
        hour += 12
        parts[0] = String(hour)
    }
    
    //Removing AM-PM
    for _ in 0...1 {
        parts[2].removeLast()
    }
    
    s1 = parts[0] + ":" + parts[1] + ":" + parts[2]
    
    print(s1)
    
    return s1

}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
