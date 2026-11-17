# ===== PART A: if / elif / else =====
# Q1
age = int(input("Umar: "))
if age >= 18:
    print("Adult")
else:
    print("Minor")

# Q2
n = int(input("Number: "))
if n > 0:
    print("Positive")
elif n < 0:
    print("Negative")
else:
    print("Zero")

# Q3
salary = int(input("Salary: "))
if salary >= 75000:
    print("High")
elif salary >= 55000:
    print("Medium")
else:
    print("Low")

# Q4
marks = int(input("Marks: "))
if marks >= 90:
    grade = "A"
elif marks >= 75:
    grade = "B"
elif marks >= 60:
    grade = "C"
elif marks >= 40:
    grade = "D"
else:
    grade = "F"
print(f"Grade: {grade}")

# Q5
year = int(input("Year: "))
if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
    print("Leap year")
else:
    print("Not a leap year")

# Q6
a = int(input("Pehla: "))
b = int(input("Doosra: "))
c = int(input("Teesra: "))
if a >= b and a >= c:
    largest = a
elif b >= c:
    largest = b
else:
    largest = c
print(largest)

# Q7
username = input("Username: ")
password = input("Password: ")
if username == "admin" and password == "1234":
    print("Login successful")
else:
    print("Invalid credentials")

# Q8
marks = int(input("Marks: "))
status = "Pass" if marks >= 40 else "Fail"
print(status)

# Q9
units = int(input("Units: "))
if units <= 100:
    bill = units * 5
elif units <= 200:
    bill = 100 * 5 + (units - 100) * 7
else:
    bill = 100 * 5 + 100 * 7 + (units - 200) * 10
print(f"Bill: {bill}")

# Q10
amount = float(input("Amount: "))
if amount >= 5000:
    discount = 20
elif amount >= 2000:
    discount = 10
else:
    discount = 0
final = amount - amount * discount / 100
print(f"Final amount: {final:.2f}")

# ===== PART B: for loop aur range =====
# Q11
for i in range(1, 11):
    print(i, end=" ")
print()

# Q12
n = 7
for i in range(1, 11):
    print(f"{n} x {i} = {n * i}")

# Q13
total = 0
for i in range(1, 101):
    total += i
print(total)                       # 5050

# Q14
total = 0
for i in range(2, 51, 2):
    total += i
print(total)                       # 650

# Q15
n = int(input("Number: "))
result = 1
for i in range(1, n + 1):
    result *= i
print(result)

# Q16
text = input("Text: ")
count = 0
for ch in text.lower():
    if ch in "aeiou":
        count += 1
print(count)

# Q17
for i in range(1, 16):
    if i % 15 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)

# Q18
n = 4
for i in range(1, n + 1):
    print("*" * i)

# Q19
salary = 60000
for year in range(1, 6):
    salary = salary * 1.10
    print(f"Year {year}: {salary:.2f}")

# ===== PART C: while, break, continue =====
# Q20
n = int(input("Number: "))
is_prime = n >= 2
for i in range(2, n):
    if n % i == 0:
        is_prime = False
        break
print("Prime" if is_prime else "Not prime")

# Q21
n = int(input("Number: "))
total = 0
while n > 0:
    total += n % 10
    n //= 10
print(total)

# Q22
n = int(input("Number: "))
count = 0
while n > 0:
    count += 1
    n //= 10
print(count)

# Q23
n = int(input("Number: "))
rev = 0
while n > 0:
    rev = rev * 10 + n % 10
    n //= 10
print(rev)

# Q24
secret = "sql123"
attempts = 0
while True:
    guess = input("Password: ")
    attempts += 1
    if guess == secret:
        print(f"Sahi! {attempts} attempts mein")
        break
    print("Galat, dobara koshish karo")

# Q25
for i in range(1, 11):
    if i % 3 == 0:
        continue
    print(i, end=" ")
print()

