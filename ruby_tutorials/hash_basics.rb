# ハッシュの基本的な作成
# キーと値のペアでデータを格納します
hash = { name: "Alice", age: 25, city: "Tokyo" }
puts hash[:name] # => "Alice"（シンボルをキーとして値を取得）

# 新しいキーと値を追加
hash[:job] = "Engineer"
puts hash # => {:name=>"Alice", :age=>25, :city=>"Tokyo", :job=>"Engineer"}

# 値の更新
hash[:age] = 26
puts hash[:age] # => 26

# キーや値の存在確認
puts hash.key?(:name) # => true
puts hash.value?("Tokyo") # => true

# ハッシュのループ処理
hash.each do |key, value|
  puts "#{key}: #{value}"
end
# => name: Alice
#    age: 26
#    city: Tokyo
#    job: Engineer

# すべてのキーと値を取得
keys = hash.keys # => [:name, :age, :city, :job]
values = hash.values # => ["Alice", 26, "Tokyo", "Engineer"]
puts keys.inspect
puts values.inspect

# ハッシュの削除
hash.delete(:job) # 指定したキーとその値を削除
puts hash # => {:name=>"Alice", :age=>26, :city=>"Tokyo"}

# デフォルト値の設定
default_hash = Hash.new("N/A")
puts default_hash[:nonexistent_key] # => "N/A"

# ハッシュのマージ
another_hash = { country: "Japan", hobby: "Reading" }
merged_hash = hash.merge(another_hash)
puts merged_hash # => {:name=>"Alice", :age=>26, :city=>"Tokyo", :country=>"Japan", :hobby=>"Reading"}

# selectメソッド: 条件に合うペアを抽出
adults = merged_hash.select { |key, value| key == :age && value >= 20 }
puts adults # => {:age=>26}

# transform_keys / transform_values: キーや値の変換
transformed_keys = hash.transform_keys { |key| key.to_s.upcase }
puts transformed_keys # => {"NAME"=>"Alice", "AGE"=>26, "CITY"=>"Tokyo"}

transformed_values = hash.transform_values { |value| value.to_s + "!" }
puts transformed_values # => {:name=>"Alice!", :age=>"26!", :city=>"Tokyo!"}

# 多重代入でキー・値の取り出し
name, age = hash.values_at(:name, :age)
puts "Name: #{name}, Age: #{age}" # => "Name: Alice, Age: 26"

# 空のハッシュか確認
empty_hash = {}
puts empty_hash.empty? # => true
puts hash.empty? # => false
