# NSDate-TimeOperators
Swift extensions for basic comparison and time operations on NSDate

## Comparisons

These extensions add the basic comparison operators <, >, <=, >=, ==, != to NSDate.

So instead of something like:
```
firstDate.compare(secondDate) == NSComparisonResult.OrderedAscending
```
you can just do
```
firstDate < secondDate
```

## Date component addition/subtraction

NSDateComponents can be a pain. ActiveSupport-like extensions enable you to do things like:

```
date - 1.day
date + 2.months
date += 1.year
```

Supported calendar types include seconds, minutes, hours, days, weeks, months and years.
