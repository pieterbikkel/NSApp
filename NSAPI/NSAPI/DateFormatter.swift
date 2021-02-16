import Foundation

extension DateFormatter {
    public static let RFC3339: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "nl")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = .current
        dateFormatter.timeStyle = .short
        
        return dateFormatter
    }()
}


//let dateFormatter = DateFormatter()
//dateFormatter.locale = Locale(identifier: "nl")
//dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//
///* 39 minutes and 57 seconds after the 16th hour of December 19th, 1996 with an offset of -08:00 from UTC (Pacific Standard Time) */
//let string2 = "1996-12-19T16:39:57-08:00"
//let string = "2021-02-13T01:30:00+0100"
//let date = dateFormatter.date(from: string)
//
//let formatter = DateFormatter()
//formatter.timeZone = TimeZone.current
//formatter.locale = .current
//formatter.timeStyle = .short
//let newDate = formatter.string(from: date ?? Date())
