let isOdd x = x % 2 <> 0

let addOneIfOdd input =
    let result =
        if isOdd input then
            input + 1
        else
            input
    result

let result = addOneIfOdd 1

printfn "%i" result
