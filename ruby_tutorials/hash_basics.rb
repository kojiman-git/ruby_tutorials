# ----------------------------------------
# ハッシュとは？
# ----------------------------------------
# - ハッシュ（Hash）は、キーと値のペアでデータを格納するデータ構造です。
# - 各キーは一意であり、対応する値を素早く取得できます。
# - Ruby のハッシュはシンボルや文字列などをキーとして使用できます。
# - データの管理や検索が効率的に行えるため、多くの場面で活用されます。

# ----------------------------------------
# ハッシュの基本操作
# ----------------------------------------
# - ハッシュの作成、要素の追加・更新・削除、ループ処理、デフォルト値の設定、
#   変換・マージ・展開について学びます。

# ----------------------------------------
# ハッシュの作成
# ----------------------------------------
hash = { name: "Alice", age: 25, city: "Tokyo" }
puts hash[:name] # => "Alice"（シンボルをキーとして値を取得）

# ----------------------------------------
# 要素の追加・更新
# ----------------------------------------
hash[:job] = "Engineer" # 新しいキーと値を追加
puts hash # => {:name=>"Alice", :age=>25, :city=>"Tokyo", :job=>"Engineer"}

hash[:age] = 26 # 値の更新
puts hash[:age] # => 26

# ----------------------------------------
# キーや値の存在確認
# ----------------------------------------
puts hash.key?(:name) # => true
puts hash.value?("Tokyo") # => true

# ----------------------------------------
# ハッシュのループ処理
# ----------------------------------------
hash.each do |key, value|
  puts "#{key}: #{value}"
end
# => name: Alice
#    age: 26
#    city: Tokyo
#    job: Engineer

# ----------------------------------------
# すべてのキーと値の取得
# ----------------------------------------
keys = hash.keys # => [:name, :age, :city, :job]
values = hash.values # => ["Alice", 26, "Tokyo", "Engineer"]
puts keys.inspect
puts values.inspect

# ----------------------------------------
# 要素の削除
# ----------------------------------------
hash.delete(:job) # 指定したキーとその値を削除
puts hash # => {:name=>"Alice", :age=>26, :city=>"Tokyo"}

# ----------------------------------------
# デフォルト値の設定
# ----------------------------------------
default_hash = Hash.new("N/A")
puts default_hash[:nonexistent_key] # => "N/A"

# ----------------------------------------
# ハッシュのマージ
# ----------------------------------------
another_hash = { country: "Japan", hobby: "Reading" }
merged_hash = hash.merge(another_hash)
puts merged_hash # => {:name=>"Alice", :age=>26, :city=>"Tokyo", :country=>"Japan", :hobby=>"Reading"}

# ----------------------------------------
# 条件に合うペアの抽出 (select)
# ----------------------------------------
adults = merged_hash.select { |key, value| key == :age && value >= 20 }
puts adults # => {:age=>26}

# ----------------------------------------
# キーや値の変換 (transform_keys, transform_values)
# ----------------------------------------
transformed_keys = hash.transform_keys { |key| key.to_s.upcase }
puts transformed_keys # => {"NAME"=>"Alice", "AGE"=>26, "CITY"=>"Tokyo"}

transformed_values = hash.transform_values { |value| value.to_s + "!" }
puts transformed_values # => {:name=>"Alice!", :age=>"26!", :city=>"Tokyo!"}

# ----------------------------------------
# 多重代入でキー・値の取り出し
# ----------------------------------------
name, age = hash.values_at(:name, :age)
puts "Name: #{name}, Age: #{age}" # => "Name: Alice, Age: 26"

# ----------------------------------------
# ハッシュの空チェック
# ----------------------------------------
empty_hash = {}
puts empty_hash.empty? # => true
puts hash.empty? # => false

# ----------------------------------------
# ハッシュの展開 (スプラット演算子 **)
# ----------------------------------------
# 1. ハッシュの展開でマージ
hash1 = { name: "Alice", age: 25 }
hash2 = { city: "Tokyo", country: "Japan" }
merged_hash = { **hash1, **hash2 }
puts "Merged hash: #{merged_hash.inspect}"
# => {:name=>"Alice", :age=>25, :city=>"Tokyo", :country=>"Japan"}

# 2. ハッシュを引数として展開
def print_user_info(name:, age:, city:)
  "Name: #{name}, Age: #{age}, City: #{city}"
end

user_info = { name: "Bob", age: 30, city: "Osaka" }
puts print_user_info(**user_info)
# => "Name: Bob, Age: 30, City: Osaka"