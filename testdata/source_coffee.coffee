fizzbuzz = (num) ->
  if num % 15 == 0
    console.log 'FizzBuzz'
  else if num % 5 == 0
    console.log 'Buzz'
  else if num % 3 == 0
    console.log 'Fizz'
  else
    console.log num


fizzbuzz n for n in [1..10]
