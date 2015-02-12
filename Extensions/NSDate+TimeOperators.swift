import Foundation

// MARK: Date Comparison

func == (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedSame)
}

func != (left: NSDate, right: NSDate) -> Bool {
    return !(left == right)
}

func < (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedAscending)
}

func > (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedDescending)
}

func <= (left: NSDate, right: NSDate) -> Bool {
    return !(left > right)
}

func >= (left: NSDate, right: NSDate) -> Bool {
    return !(left < right)
}

//MARK: Date Utility Classes

class CalendarType {
    var calendarUnit : NSCalendarUnit
    var amount : Int
    
    init(amount : Int) {
        self.calendarUnit = NSCalendarUnit.allZeros
        self.amount = amount
    }
    
    init(amount: Int, calendarUnit: NSCalendarUnit) {
        self.calendarUnit = calendarUnit
        self.amount = amount
    }
    
    func dateComponents() -> NSDateComponents {
        return NSDateComponents()
    }
    
    func copy() -> CalendarType {
        return CalendarType(amount: self.amount, calendarUnit: self.calendarUnit)
    }
}

class MonthCalendarType : CalendarType {
    
    override init(amount : Int) {
        super.init(amount: amount)
        self.calendarUnit = .MonthCalendarUnit
    }
    
    override func dateComponents() -> NSDateComponents {
        let components = super.dateComponents()
        components.month = self.amount
        return components
    }
    
}

class YearCalendarType : CalendarType {
    
    override init(amount : Int) {
        super.init(amount: amount, calendarUnit: .YearCalendarUnit)
    }
    
    override func dateComponents() -> NSDateComponents {
        let components = super.dateComponents()
        components.year = self.amount
        return components
    }
    
}

//MARK: Extensions to get NSTimeIntervals and CalendarTypes from Ints

extension Int {
    
    var seconds : NSTimeInterval {
        return NSTimeInterval(self)
    }
    
    var second : NSTimeInterval {
        return self.seconds
    }
    
    var minutes : NSTimeInterval {
        return self.seconds * 60
    }
    
    var minute : NSTimeInterval {
        return self.minutes
    }
    
    var hours : NSTimeInterval {
        return self.minutes * 60
    }
    
    var hour : NSTimeInterval {
        return self.hours
    }
    
    var days : NSTimeInterval {
        return self.hours * 24
    }
    
    var day : NSTimeInterval {
        return self.days
    }
    
    var weeks : NSTimeInterval {
        return self.days * 7
    }
    
    var week : NSTimeInterval {
        return self.weeks
    }
    
    var months : MonthCalendarType {
        return MonthCalendarType(amount: self)
    }
    
    var month : MonthCalendarType {
        return self.months
    }
    
    var years : YearCalendarType {
        return YearCalendarType(amount: self)
    }
    
    var year : YearCalendarType {
        return self.years
    }
    
}

// MARK: Date Addition/Subtraction Operators

func - (left: NSDate, right: NSTimeInterval) -> NSDate {
    return left.dateByAddingTimeInterval(-right)
}

func -= (inout left: NSDate, right: NSTimeInterval) {
    left = left.dateByAddingTimeInterval(-right)
}

func + (left: NSDate, right: NSTimeInterval) -> NSDate {
    return left.dateByAddingTimeInterval(right)
}

func += (inout left: NSDate, right: NSTimeInterval) {
    left = left.dateByAddingTimeInterval(right)
}

func - (left: NSDate, right: CalendarType) -> NSDate {
    
    let calendarType = right.copy()
    calendarType.amount = -calendarType.amount
    let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    return calendar.dateByAddingComponents(calendarType.dateComponents(), toDate: left, options: NSCalendarOptions.allZeros)!
}

func -= (inout left: NSDate, right: CalendarType) {
    left = left - right
}

func + (left: NSDate, right: CalendarType) -> NSDate {
    let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    return calendar.dateByAddingComponents(right.dateComponents(), toDate: left, options: NSCalendarOptions.allZeros)!
}

func += (inout left: NSDate, right: CalendarType) {
    left = left + right
}
