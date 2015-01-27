---
  tags: methods, arrays, iteration, kids
  languages: ruby
  level: 2
  type: lab
---

## Deli Counter - Take a Number

### Instructions

A pretty important deli needs somebody to program the "Take a Number" feature for their counter.

At the beginning of the day, the deli line is empty and is represented by an empty array. For example:

`katz.line = []`

Write all of your code in deli_counter.rb

1. Build a method that a new customer will use when entering the deli. The method, `take_a_number` should accept the new person's name as an argument, add them to the line and tell them their position in line. And don't go being too programmer-y and give them their index. These are normal people. If they are 7th in line, tell them that. Don't get their hopes up by telling them they are number 6 in line.

2. Build a method `now_serving`. This method should call out (via `puts`) the next person in line and then remove them from the line. If there is nobody in line, it should say that "There is nobody waiting to be served!"

3. Build a method `line_status` that shows people their current place in line. If there is nobody in line, it should say "The line is currently empty."

Example usage:

  ```ruby
  katz = Deli.new("Katz")

  take_a_number("Ada") #=> 1
  take_a_number("Grace") #=> 2
  take_a_number("Kent") #=> 3

  katz.line_status #=> "The line is currently: 1. Ada 2. Grace 3. Kent"

  katz.now_serving #=> "Currently serving Ada."

  katz.line_status #=> "The line is currently: 1. Grace 2. Kent"

  take_a_number("Matz") #=> "3"

  katz.line_status #=> "The line is currently: 1. Grace 2. Kent 3. Matz"

  katz.now_serving #=> "Currently serving Grace."

  katz.line_status #=> "The line is currently: 1. Kent 2. Matz"
  ```

