# Sum using Loop
def sumUsingLoop(n):    
    counterLoop = 0 
    
    sum = 0
    counterLoop += 1
    
    for i in range(1, 1+n):
        counterLoop += 1

        sum += i
        counterLoop += 1

    counterLoop += 1  
    return sum, counterLoop

# Sum using Equation
def sumUsingEquation(n):    
    counterEquation = 0

    sum = 0
    counterEquation += 1
    
    sum = n*(n+1)/2
    counterEquation += 1
    
    counterEquation += 1   
    return sum, counterEquation

# Sum using Recursion
def sumUsingRecursion(n, counterRecursion):   
    # counterRecursion = 0

    counterRecursion += 1
    if(n == 1):
        counterRecursion += 1
        return 1, counterRecursion
    else:
        counterRecursion += 2
        a, counterRecursion = sumUsingRecursion(n - 1, counterRecursion)
        return n + a, counterRecursion
    

input = [100, 200, 300, 400, 500]

for i in input:

    sumLoop, counterLoop = sumUsingLoop(i)
    print("\nLoop Sum for {i}: ",sumLoop)
    print("Loop Counter for {i}: ",counterLoop)
    
    sumEquation, counterEquation = sumUsingEquation(i)
    print("Equation for {i}: ",sumEquation)
    print("Equation Counter for {i}: ",counterEquation)
    
    sumRecursion, counterRecursion = sumUsingRecursion(i, 0)
    print("Recursion for {i}: ",sumRecursion)
    print("Recursion Counter for {i}: ", counterRecursion)