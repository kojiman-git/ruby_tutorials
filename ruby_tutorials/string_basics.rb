# 1. 文字列の作成
str1 = "Hello, World!"
str2 = 'Hello, Ruby!'

# ダブルクォートとシングルクォートの違い
name = "Alice"
puts "Hello, #{name}"  # => Hello, Alice
puts 'Hello, #{name}'  # => Hello, #{name}（変数展開されない）

# 2. 文字列の結合
str1 = "Hello"
str2 = "World"
puts str1 + ", " + str2 + "!"  # => Hello, World!
puts "#{str1}, #{str2}!"       # => Hello, World!
puts str1.concat(", ", str2, "!") # => Hello, World!

# 3. 文字列の分割
sentence = "Ruby is awesome"
words = sentence.split
puts words.inspect # => ["Ruby", "is", "awesome"]

csv = "apple,banana,grape"
fruits = csv.split(",")
puts fruits.inspect # => ["apple", "banana", "grape"]

# 4. 文字列の長さと取得
str = "こんにちは"
puts str.length  # => 5（文字数）
puts str.bytesize # => 15（バイト数）

# 5. 文字列の置換
str = "I love Python"
puts str.sub("Python", "Ruby")  # => "I love Ruby"
puts str.gsub("o", "0")         # => "I l0ve Pyth0n"

# 6. 文字列の大文字・小文字変換
str = "Hello Ruby"
puts str.upcase    # => "HELLO RUBY"
puts str.downcase  # => "hello ruby"
puts str.capitalize # => "Hello ruby"
puts str.swapcase  # => "hELLO rUBY"

# 7. 文字列の検索
str = "Ruby is fun"
puts str.include?("Ruby")  # => true
puts str.start_with?("Ruby") # => true
puts str.end_with?("fun")    # => true
puts str.index("is")         # => 5
puts str.match(/is/)         # => #<MatchData "is">

# 8. 文字列の削除・トリム
str = "  Hello, Ruby!  "
puts str.strip  # => "Hello, Ruby!"
puts str.lstrip # => "Hello, Ruby!  "
puts str.rstrip # => "  Hello, Ruby!"

str2 = "---Hello---"
puts str2.delete("-") # => "Hello"

# 9. 文字列の繰り返し
puts "Ruby! " * 3 # => "Ruby! Ruby! Ruby! "

# 10. 文字列の逆順
puts "Ruby".reverse # => "ybuR"

# 11. 文字列を数値に変換
puts "42".to_i  # => 42
puts "3.14".to_f # => 3.14
puts "abc".to_i  # => 0

# 12. 文字列をシンボルに変換
puts "hello".to_sym  # => :hello
