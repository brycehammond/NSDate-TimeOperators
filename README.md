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

