# 1. シンボルの作成
sym1 = :ruby
sym2 = :"hello world"  # スペースを含む場合
sym3 = "dynamic".to_sym # 文字列から変換

puts sym1  # => :ruby
puts sym2  # => :"hello world"
puts sym3  # => :dynamic

# 2. シンボルと文字列の相互変換
str = "ruby"
sym = :ruby

puts str.to_sym  # => :ruby
puts sym.to_s    # => "ruby"

# 3. シンボルの比較
puts :ruby == :ruby       # => true
puts :ruby.equal?(:ruby)  # => true
puts "ruby" == "ruby"     # => true
puts "ruby".equal?("ruby") # => false（異なるオブジェクト）

# 4. シンボルの一覧
puts Symbol.all_symbols.take(10)  # 最初の10個を表示

# 5. シンボルをキーとしたハッシュ
person = { name: "Alice", age: 30, city: "Tokyo" }
puts person[:name] # => "Alice"

# または古い形式（=> を使う方法）
person = { :name => "Alice", :age => 30, :city => "Tokyo" }
puts person[:city] # => "Tokyo"
