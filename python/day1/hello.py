# ===== Part A =====
# Q1
print("Hello, Data Engineering!")

# Q2
name = "Aman"
city = "Pune"
age = 25
print(f"Naam: {name}, Shehar: {city}, Umar: {age}")

# Q3
x = 10
y = 3.5
z = "SQL"
flag = True
nothing = None
print(type(x))
print(type(y))
print(type(z))
print(type(flag))
print(type(nothing))

# Q4
a = 17
b = 5
print(a + b, a - b, a * b, a / b, a // b, a % b, a ** b)   # 22 12 85 3.4 3 2 1419857

# Q5
age = 25
salary = 60000
print(age > 18 and salary >= 50000)     # True
print(not (salary > 100000))            # True
print(age == 25)                        # True
print(salary != 60000)                  # False

# Q6
print("25" + "5")                       # 255
print(int("25") + int("5"))             # 30
print(float("3.14"))                    # 3.14
print(str(100) + " rupees")             # 100 rupees
# print("25" + 5)                       # TypeError: can only concatenate str (not "int") to str

# Q7 (ek-ek karke chalao)
# print(namee)                          # NameError: name 'namee' is not defined
# print(10 / 0)                         # ZeroDivisionError: division by zero
# int("abc")                            # ValueError: invalid literal for int() with base 10: 'abc'
# print("hi"                            # SyntaxError

# Q8
price = 1234.5678
print(f"{price:.2f}")                   # 1234.57
print(f"{1000000:,}")                   # 1,000,000

# Q9
monthly = 60000
hike = 10
new_monthly = monthly + monthly * hike / 100
annual = new_monthly * 12
print(f"New monthly: {new_monthly:.2f}")    # New monthly: 66000.00
print(f"Annual: {annual:.2f}")              # Annual: 792000.00

# Q10
x = None
print(x is None)                        # True
print(x == 0)                           # False
print(None == None)                     # True   (SQL mein NULL = NULL ka result NULL aata tha)


# ===== Part B =====
# Q11  greeting.py
name = input("Naam batao: ")
print(f"Namaste, {name}!")

# Q12  simple_interest.py
principal = float(input("Principal: "))
rate = float(input("Rate: "))
time = float(input("Time: "))
si = principal * rate * time / 100
print(f"Simple Interest: {si}")

# Q13  calculator.py
a = float(input("Pehla number: "))
b = float(input("Doosra number: "))
print(f"Sum: {a + b}")
print(f"Difference: {a - b}")
print(f"Product: {a * b}")
print(f"Division: {a / b}")

# Q14  rectangle.py
length = int(input("Length: "))
breadth = int(input("Breadth: "))
print(f"Area: {length * breadth}")
print(f"Perimeter: {2 * (length + breadth)}")

# Q15  temperature.py
c = float(input("Celsius: "))
f = c * 9 / 5 + 32
print(f"{f:.1f}")

# Q16  time_convert.py
total = int(input("Seconds: "))
hours = total // 3600
rest = total % 3600
minutes = rest // 60
seconds = rest % 60
print(f"{hours} hr, {minutes} min, {seconds} sec")

# Q17  even_odd.py
number = int(input("Number: "))
print(number % 2 == 0)
