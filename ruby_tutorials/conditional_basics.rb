# 基本的なif文
age = 18

if age >= 20
  puts "You are an adult."
else
  puts "You are not an adult yet."
end
# => "You are not an adult yet."

# elsifを使った条件分岐
score = 85

if score >= 90
  puts "Grade: A"
elsif score >= 80
  puts "Grade: B"
elsif score >= 70
  puts "Grade: C"
else
  puts "Grade: F"
end
# => "Grade: B"

# unless文（条件がfalseのとき実行）
logged_in = false

unless logged_in
  puts "Please log in."
end
# => "Please log in."

# 条件演算子（三項演算子）
age = 25
message = age >= 20 ? "Adult" : "Not an adult"
puts message
# => "Adult"

# case文（複数条件の分岐）
day = "Saturday"

case day
when "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
  puts "Weekday"
when "Saturday", "Sunday"
  puts "Weekend"
else
  puts "Invalid day"
end
# => "Weekend"

# 条件のネスト（if文の中にif文）
user_logged_in = true
is_admin = false

if user_logged_in
  if is_admin
    puts "Welcome, admin!"
  else
    puts "Welcome, user!"
  end
else
  puts "Please log in."
end
# => "Welcome, user!"

# 比較演算子と論理演算子の利用
temperature = 15

if temperature > 30
  puts "It's hot."
elsif temperature >= 20 && temperature <= 30
  puts "It's warm."
else
  puts "It's cold."
end
# => "It's cold."

# ワンライナーのif文
name = "Alice"
puts "Hello, #{name}!" if name
# => "Hello, Alice!"

# unlessをワンライナーで使う
authenticated = false
puts "Access denied!" unless authenticated
# => "Access denied!"

# Rubyの真偽値について
# nilとfalse以外は全て「真」とみなされます
value = 0
if value
  puts "This is true."
end
# => "This is true."

# case文で範囲を使う
score = 75

case score
when 90..100
  puts "Excellent"
when 70..89
  puts "Good"
when 50..69
  puts "Average"
else
  puts "Fail"
end
# => "Good"

# if修飾子で短い条件を書く
count = 5
puts "Count is low" if count < 10
# => "Count is low"

