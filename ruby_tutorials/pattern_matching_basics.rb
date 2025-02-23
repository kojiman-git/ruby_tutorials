# basics_pattern_matching.rb

# 1. 基本的なパターンマッチ
# 配列の各要素を変数に分解する
value = [1, 2, 3]

case value
in [a, b, c]  # 配列の要素を a, b, c にマッチさせる
  puts "a=#{a}, b=#{b}, c=#{c}"
else
  puts "No match found"
end

# 2. 変数のバインドと条件付きパターン
# 条件を追加して、特定の値のみ処理する
user = { name: "Alice", age: 15 }  # 条件を満たさないデータ

case user
in { name: "Alice", age: age } if age > 20  # name が "Alice" で、age が 20 以上の場合にマッチ
  puts "Alice is older than 20"
else
  puts "User does not meet the condition"
end

# 3. ネストした構造のマッチング
# ネストしたハッシュから特定のキーを取り出す
data = { user: { id: 2, name: "Charlie" }, role: "guest" }  # 役職が admin ではない

case data
in { user: { id: user_id, name: user_name }, role: "admin" }
  puts "Admin User: #{user_name} (ID: #{user_id})"
else
  puts "User is not an admin"
end

# 4. `*` を使った可変長マッチング
# 配列の一部の要素を固定し、残りを別の変数にまとめる
numbers = [1]  # 要素が1つしかないためマッチしない

case numbers
in [first, *middle, last]  # 最初の要素を first, 最後の要素を last, 間の要素を middle に格納
  puts "First: #{first}, Last: #{last}, Middle: #{middle}"
else
  puts "Pattern does not match"
end

# 5. `=>` を使った変数バインド
# マッチしたデータ全体を変数に格納
point = [10]  # 2要素の配列でないためマッチしない

case point
in [x, y] => coords
  puts "Coordinates: #{coords}, x=#{x}, y=#{y}"
else
  puts "Point format is incorrect"
end

# 6. `find` などと組み合わせた活用
# 配列の中から特定の条件にマッチする要素を探す
users = [
  { id: 1, name: "Alice", role: "user" },
  { id: 2, name: "Charlie", role: "guest" }  # admin がいない
]

admin = users.find { |user| user in { role: "admin" } }  # role が "admin" の要素を検索
if admin
  puts "Admin found: #{admin}"
else
  puts "No admin found"
end

# 7. `begin` 節内でのパターンマッチ
# TypeError を考慮したエラーハンドリング
data = { name: "Eve", age: "unknown" }  # age が Integer ではない

begin
  case data
  in { name: name, age: Integer }  # age が Integer であることを要求
    puts "#{name} is #{age} years old"
  else
    puts "Invalid data format"
  end
rescue TypeError  # age が Integer でない場合にエラーをキャッチ
  puts "Type mismatch error"
end

# 8. クラスとマッチング
# `deconstruct_keys` を定義することで、カスタムクラスでもパターンマッチを利用可能にする
class Dog
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # パターンマッチで使用するキーの情報を返す
  def deconstruct_keys(keys)
    { name: @name }
  end
end

class Cat
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # パターンマッチで使用するキーの情報を返す
  def deconstruct_keys(keys)
    { name: @name }
  end
end

class Bird  # 追加: DogでもCatでもないクラス
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def deconstruct_keys(keys)
    { name: @name }
  end
end

pet = Bird.new("Tweety")  # DogでもCatでもないペット

case pet
in Dog(name:)
  puts "This is a dog named #{name}"
in Cat(name:)
  puts "This is a cat named #{name}"
else
  puts "Unknown pet type: #{pet.class}"
end

# 9. `in` を二重に使うパターンマッチ
# 配列とハッシュがネストした複雑なデータ構造を分解する
data = [
  { id: 1, user: { name: "Alice", age: 30 } },
  { id: 2, user: { name: "Bob", age: 25 } }
]

case data
in [{ id: id1, user: user1 }, { id: id2, user: user2 }]
  case user1
  in { name: name1, age: age1 }
    puts "User 1: #{name1} (#{age1} years old)"
  end

  case user2
  in { name: name2, age: age2 }
    puts "User 2: #{name2} (#{age2} years old)"
  end
else
  puts "Data structure does not match"
end
