# ----------------------------------------
# 配列とは？
# ----------------------------------------
# - 配列（Array）は、複数の要素を順序を持って格納できるデータ構造です。
# - 各要素はインデックス（0から始まる番号）でアクセスできます。
# - Ruby の配列は、異なるデータ型の要素を混在させることも可能です。
# - 配列を活用することで、データを効率よく管理・操作することができます。

# ----------------------------------------
# 配列の作成
# ----------------------------------------
numbers = [1, 2, 3, 4, 5]
puts "元の配列: #{numbers.inspect}" # => [1, 2, 3, 4, 5]

# ----------------------------------------
# 要素の取得・変更
# ----------------------------------------
puts "先頭の要素: #{numbers.first}"    # => 1
puts "末尾の要素: #{numbers.last}"     # => 5
numbers[2] = 10  # 3番目の要素を変更
puts "変更後の配列: #{numbers.inspect}" # => [1, 2, 10, 4, 5]

# ----------------------------------------
# 要素の追加・削除
# ----------------------------------------
numbers.push(6)   # 配列の末尾に追加
puts "push後: #{numbers.inspect}" # => [1, 2, 10, 4, 5, 6]

numbers << 7      # ショートハンドで末尾に追加
puts "<< 追加後: #{numbers.inspect}" # => [1, 2, 10, 4, 5, 6, 7]

numbers.pop       # 末尾の要素を削除
puts "pop後: #{numbers.inspect}" # => [1, 2, 10, 4, 5, 6]

numbers.shift     # 先頭の要素を削除
puts "shift後: #{numbers.inspect}" # => [2, 10, 4, 5, 6]

numbers.unshift(0) # 先頭に要素を追加
puts "unshift後: #{numbers.inspect}" # => [0, 2, 10, 4, 5, 6]

# ----------------------------------------
# 配列の連結
# ----------------------------------------
array1 = [1, 2, 3]
array2 = [4, 5, 6]
concatenated_array = array1 + array2 # 非破壊的な連結
puts "+ 演算子による連結: #{concatenated_array.inspect}" # => [1, 2, 3, 4, 5, 6]

# concatメソッドによる破壊的な連結
array3 = [7, 8, 9]
array4 = [10, 11, 12]
array3.concat(array4)
puts "concat メソッドによる連結: #{array3.inspect}" # => [7, 8, 9, 10, 11, 12]

# ----------------------------------------
# 配列の集合演算
# ----------------------------------------
array5 = [1, 2, 3, 4]
array6 = [3, 4, 5, 6]

# 和集合（重複を取り除いて結合）
union_array = array5 | array6
puts "和集合 (| 演算子): #{union_array.inspect}" # => [1, 2, 3, 4, 5, 6]

# 差集合（左側の配列にのみ含まれる要素）
difference_array = array5 - array6
puts "差集合 (- 演算子): #{difference_array.inspect}" # => [1, 2]

# 積集合（共通する要素）
intersection_array = array5 & array6
puts "積集合 (& 演算子): #{intersection_array.inspect}" # => [3, 4]

# ----------------------------------------
# 配列の展開 (スプラット演算子 *)
# ----------------------------------------
expanded_array = [*array1, *array2]
puts "* 演算子による展開: #{expanded_array.inspect}" # => [1, 2, 3, 4, 5, 6]

# 配列を展開してメソッドの引数に渡す
def sum(a, b, c)
  a + b + c
end

result = sum(*array1)
puts "* 演算子でメソッド引数に展開: #{result}" # => 6

# 配列を展開して多重代入
first, *rest = [10, 20, 30, 40]
puts "先頭の要素: #{first}" # => 10
puts "残りの要素: #{rest.inspect}" # => [20, 30, 40]

# 配列を展開して他の配列に挿入
nested_array = [[*array1], [*array2]]
puts "ネストされた配列: #{nested_array.inspect}" # => [[1, 2, 3], [4, 5, 6]]

# 配列リテラルで展開
combined_array = [0, *array1, 99]
puts "展開を含む配列: #{combined_array.inspect}" # => [0, 1, 2, 3, 99]

# ----------------------------------------
# 配列の探索・確認
# ----------------------------------------
puts "配列に4は含まれるか？ #{numbers.include?(4)}" # => true
puts "10のインデックス: #{numbers.index(10)}" # => 2

# ----------------------------------------
# 配列の変換・選択 (map, select, reject)
# ----------------------------------------
squared_numbers = numbers.map { |num| num**2 }
puts "二乗した配列: #{squared_numbers.inspect}" # => [0, 4, 100, 16, 25, 36]

even_numbers = numbers.select(&:even?)
puts "偶数のみ: #{even_numbers.inspect}" # => [0, 2, 10, 4, 6]

odd_numbers = numbers.reject(&:even?)
puts "奇数のみ: #{odd_numbers.inspect}" # => [5]

# ----------------------------------------
# 繰り返し処理
# ----------------------------------------
numbers.each { |num| puts "数値: #{num}" }

# ----------------------------------------
# 可変長引数を使ったメソッド
# ----------------------------------------
def greet(*names)
  "#{names.join('と')}、こんにちは！"
end

puts greet('田中さん')
puts greet('田中さん', '鈴木さん')
puts greet('田中さん', '鈴木さん', '佐藤さん')

# ----------------------------------------
# 配列の並び替えと逆順 (sort, reverse)
# ----------------------------------------
sorted_numbers = [5, 3, 8, 1, 2].sort
puts "ソート後の配列: #{sorted_numbers.inspect}" # => [1, 2, 3, 5, 8]

reversed_numbers = sorted_numbers.reverse
puts "逆順の配列: #{reversed_numbers.inspect}" # => [8, 5, 3, 2, 1]

# ----------------------------------------
# 二次元配列 (多次元配列のアクセス)
# ----------------------------------------
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "(2,1) の要素: #{matrix[2][1]}" # => 8

# ----------------------------------------
# 配列の変換・操作 (compact, flatten, flat_map)
# ----------------------------------------
array_with_nil = [1, nil, 2, nil, 3]
puts "nil を含む配列: #{array_with_nil.inspect}" # => [1, nil, 2, nil, 3]
compact_array = array_with_nil.compact
puts "nil を取り除いた配列: #{compact_array.inspect}" # => [1, 2, 3]

nested_array = [[1, 2], [3, [4, 5]], 6]
puts "ネストされた配列: #{nested_array.inspect}" # => [[1, 2], [3, [4, 5]], 6]
flat_array = nested_array.flatten
puts "平坦化した配列: #{flat_array.inspect}" # => [1, 2, 3, 4, 5, 6]

# flatten!: 元の配列を破壊的に平坦化する
nested_array.flatten!
puts "flatten! 後の配列: #{nested_array.inspect}" # => [1, 2, 3, 4, 5, 6] # => [1, 2, 3, 4, 5, 6]

words = ["hello world", "Ruby rocks"]
split_words = words.flat_map { |word| word.split(" ") }
puts "分割して平坦化: #{split_words.inspect}" # => ["hello", "world", "Ruby", "rocks"]

# ----------------------------------------
# 重複の削除と行列操作 (uniq, transpose)
# ----------------------------------------
duplicate_array = [1, 2, 2, 3, 3, 3]
unique_array = duplicate_array.uniq
puts "重複を取り除いた配列: #{unique_array.inspect}" # => [1, 2, 3]

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
transposed = matrix.transpose
puts "転置行列: #{transposed.inspect}" # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

# ----------------------------------------
# 配列の合成と集計 (zip, sum)
# ----------------------------------------
names = ["Alice", "Bob", "Charlie"]
scores = [85, 92, 78]
zipped_array = names.zip(scores)
puts "結合された配列: #{zipped_array.inspect}" # => [["Alice", 85], ["Bob", 92], ["Charlie", 78]]

sum = [1, 2, 3, 4, 5].sum
puts "配列の合計: #{sum}" # => 15
