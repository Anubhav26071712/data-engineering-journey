salaries = [95000, 82000, 60000, 55000, 70000, 52000, 48000, 65000, 58000, 45000,
            42000, 88000, 62000, 57000, 72000, 51000, 47000, 78000, 44000, 67000]

# ===== PART A: Functions =====
# Q1
def greet(name):
    return f"Namaste, {name}!"
print(greet("Riya"))                       # Namaste, Riya!

# Q2
def add(a, b):
    return a + b
print(add(7, 5))                           # 12
print(add(2.5, 3))                         # 5.5

# Q3
def is_even(n):
    return n % 2 == 0
print(is_even(10))                         # True
print(is_even(7))                          # False

# Q4
def salary_band(salary):
    if salary >= 75000:
        return "High"
    elif salary >= 55000:
        return "Medium"
    else:
        return "Low"

for s in [95000, 60000, 42000, 75000, 74999]:
    print(f"{s} -> {salary_band(s)}")

# Q5
def power(base, exp=2):
    return base ** exp
print(power(5))                            # 25
print(power(2, 10))                        # 1024
print(power(exp=3, base=2))                # 8

# Q6
def min_max(a, b, c):
    return min(a, b, c), max(a, b, c)
print(min_max(5, 12, 9))                   # (5, 12)
lo, hi = min_max(5, 12, 9)
print(f"Min: {lo}, Max: {hi}")             # Min: 5, Max: 12

# Q7
def show_square(n):
    print(n * n)

def get_square(n):
    return n * n

x = show_square(4)                         # 16 print hota hai
print(x)                                   # None
y = get_square(4)
print(y)                                   # 16

# Q8
def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result
print(factorial(5))                        # 120
print(factorial(0))                        # 1
print(factorial(7))                        # 5040

# Q9
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

primes = []
for n in range(1, 51):
    if is_prime(n):
        primes.append(n)
print(primes)                              # [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
print(len(primes))                         # 15

# ===== PART B: List ke basics =====
cities = ["Delhi", "Pune", "Mumbai", "Chennai", "Kochi"]

# Q10
print(cities[0])                           # Delhi
print(cities[-1])                          # Kochi
print(cities[2])                           # Mumbai
print(cities[1:4])                         # ['Pune', 'Mumbai', 'Chennai']
print(cities[:2])                          # ['Delhi', 'Pune']
print(cities[::2])                         # ['Delhi', 'Mumbai', 'Kochi']
print(cities[::-1])                        # ['Kochi', 'Chennai', 'Mumbai', 'Pune', 'Delhi']
print(len(cities))                         # 5

# Q11 (naye cities pe, taaki Q10 ki list na bigde)
cities2 = ["Delhi", "Pune", "Mumbai", "Chennai", "Kochi"]
cities2.append("Jaipur")
cities2.insert(1, "Agra")
cities2.remove("Mumbai")
print(cities2.pop())                       # Jaipur
print(cities2)                             # ['Delhi', 'Agra', 'Pune', 'Chennai', 'Kochi']

# Q12
numbers = [42, 7, 19, 3, 88, 25]
print(sorted(numbers))                     # [3, 7, 19, 25, 42, 88]
print(sorted(numbers, reverse=True))       # [88, 42, 25, 19, 7, 3]
print(numbers)                             # [42, 7, 19, 3, 88, 25]
print(numbers.sort())                      # None
print(numbers)                             # [3, 7, 19, 25, 42, 88]

# Q13
numbers = [42, 7, 19, 3, 88, 25]
print(sum(numbers), len(numbers), max(numbers), min(numbers),
      round(sum(numbers) / len(numbers), 2))   # 184 6 88 3 30.67

# Q14
letters = ["a", "b", "a", "c", "a", "b"]
print(letters.count("a"))                  # 3
print("c" in letters)                      # True
print(letters.index("b"))                  # 1
print("z" in letters)                      # False

# Q15
a = [1, 2, 3]
b = a                                      # nayi list nahi, ek hi list ke do naam
b.append(4)
print(a)                                   # [1, 2, 3, 4]
c = a.copy()
c.append(5)
print(a)                                   # [1, 2, 3, 4]
print(c)                                   # [1, 2, 3, 4, 5]

# Q16
print("Delhi,Pune,Mumbai".split(","))      # ['Delhi', 'Pune', 'Mumbai']
print("-".join(["2026", "11", "17"]))      # 2026-11-17

# ===== PART C: List + loops =====
# Q17
print(sum(salaries), len(salaries), sum(salaries) / len(salaries), max(salaries), min(salaries))
# 1238000 20 61900.0 95000 42000

# Q18
total = 0
biggest = salaries[0]
smallest = salaries[0]
for s in salaries:
    total += s
    if s > biggest:
        biggest = s
    if s < smallest:
        smallest = s
print(total, biggest, smallest)            # 1238000 95000 42000

# Q19
above = []
for s in salaries:
    if s > 60000:
        above.append(s)
print(above)                               # [95000, 82000, 70000, 65000, 88000, 62000, 72000, 78000, 67000]
print(len(above))                          # 9

# Q20
print(sorted(salaries, reverse=True)[:5])  # [95000, 88000, 82000, 78000, 72000]
print(sorted(salaries)[:3])                # [42000, 44000, 45000]

# Q21  (salary_band Q4 se)
high = 0
medium = 0
low = 0
for s in salaries:
    band = salary_band(s)
    if band == "High":
        high += 1
    elif band == "Medium":
        medium += 1
    else:
        low += 1
print("High", high)                        # High 4
print("Medium", medium)                    # Medium 9
print("Low", low)                          # Low 7

# Q22
new_salaries = []
for s in salaries:
    new_salaries.append(round(s * 1.10, 2))
print(new_salaries[:3])                    # [104500.0, 90200.0, 66000.0]
print(round(sum(new_salaries), 2))         # 1361800.0

# Q23
nums = [3, 1, 3, 2, 1, 4, 2, 5]
unique = []
for x in nums:
    if x not in unique:
        unique.append(x)
print(unique)                              # [3, 1, 2, 4, 5]
print(len(nums) - len(unique))             # 3

# Q24
def second_highest(values):
    unique = []
    for v in values:
        if v not in unique:
            unique.append(v)
    unique.sort(reverse=True)
    if len(unique) < 2:
        return None
    return unique[1]

print(second_highest([50, 90, 90, 70]))    # 70
print(second_highest(salaries))            # 88000
print(second_highest([5, 5]))              # None
print(sorted([50, 90, 90, 70], reverse=True)[1])   # 90  (galat, duplicate ki wajah se)

# Q25
def is_palindrome(text):
    text = text.lower()
    return text == text[::-1]
print(is_palindrome("madam"))              # True
print(is_palindrome("Racecar"))            # True
print(is_palindrome("hello"))              # False

# Q26
employees = [["Rahul", "Engineering", 95000],
             ["Karan", "Sales", 70000],
             ["Rohit", "HR", 58000],
             ["Divya", "Finance", 88000],
             ["Arjun", "Marketing", 72000]]
for row in employees:
    if row[2] > 70000:
        print(row[0])                      # Rahul, Divya, Arjun
total = 0
top_name = ""
top_salary = 0
for row in employees:
    total += row[2]
    if row[2] > top_salary:
        top_salary = row[2]
        top_name = row[0]
print(total)                               # 383000
print(top_name)                            # Rahul

# ===== PART D: Tuple =====
# Q27
t = (10, 20, 30)
print(t[1])                                # 20
# t[0] = 99                                # TypeError: 'tuple' object does not support item assignment
print(type((5)))                           # <class 'int'>
print(type((5,)))                          # <class 'tuple'>

# Q28
point = (3, 4)
x, y = point
print(x, y)                                # 3 4
a, b = 5, 9
a, b = b, a
print(a, b)                                # 9 5

# Q29
staff = [("Rahul", 95000), ("Karan", 70000), ("Rohit", 58000)]
total = 0
for name, sal in staff:
    print(f"{name}: {sal}")
    total += sal
print(total)                               # 223000

# Q30
cities = ["Delhi", "Pune", "Mumbai", "Chennai", "Kochi"]
for i, city in enumerate(cities, start=1):
    print(f"{i}. {city}")
