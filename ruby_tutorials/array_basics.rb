# 配列の作成
numbers = [1, 2, 3, 4, 5]
puts "Original array: #{numbers.inspect}" #=> [1, 2, 3, 4, 5]

# 要素の取得・変更
puts "First element: #{numbers.first}"    #=> 1
puts "Last element: #{numbers.last}"      #=> 5
numbers[2] = 10
puts "Modified array: #{numbers.inspect}" #=> [1, 2, 10, 4, 5]

# 要素の追加・削除
numbers.push(6)  # 末尾に追加
puts "After push: #{numbers.inspect}" #=> [1, 2, 10, 4, 5, 6]
numbers << 7     # ショートハンド
puts "After <<: #{numbers.inspect}"   #=> [1, 2, 10, 4, 5, 6, 7]
numbers.pop      # 末尾を削除
puts "After pop: #{numbers.inspect}"  #=> [1, 2, 10, 4, 5, 6]
numbers.shift    # 先頭を削除
puts "After shift: #{numbers.inspect}" #=> [2, 10, 4, 5, 6]
numbers.unshift(0) # 先頭に追加
puts "After unshift: #{numbers.inspect}" #=> [0, 2, 10, 4, 5, 6]

# 配列の連結
array1 = [1, 2, 3]
array2 = [4, 5, 6]
concatenated_array = array1 + array2
puts "Concatenated array (using +): #{concatenated_array.inspect}" #=> [1, 2, 3, 4, 5, 6]

# concatメソッドによる連結（破壊的）
array3 = [7, 8, 9]
array4 = [10, 11, 12]
array3.concat(array4)
puts "Concatenated array (using concat): #{array3.inspect}" #=> [7, 8, 9, 10, 11, 12]

# 配列の和集合（重複を取り除いて結合）
array5 = [1, 2, 3, 4]
array6 = [3, 4, 5, 6]
union_array = array5 | array6
puts "Union of arrays: #{union_array.inspect}" #=> [1, 2, 3, 4, 5, 6]

# 配列の差集合（左側の配列にあって右側の配列にない要素）
difference_array = array5 - array6
puts "Difference of arrays: #{difference_array.inspect}" #=> [1, 2]

# 配列の積集合（両方の配列に共通する要素）
intersection_array = array5 & array6
puts "Intersection of arrays: #{intersection_array.inspect}" #=> [3, 4]

# 配列の展開 (スプラット演算子 *)
# 配列を展開して新しい配列を作成
expanded_array = [*array1, *array2]
puts "Expanded array using *: #{expanded_array.inspect}" #=> [1, 2, 3, 4, 5, 6]

# 配列を展開してメソッドの引数に渡す
def sum(a, b, c)
  a + b + c
end

result = sum(*array1)
puts "Sum of elements in array1 using *: #{result}" #=> 6

# 配列を展開して多重代入
first, *rest = [10, 20, 30, 40]
puts "First element: #{first}" #=> 10
puts "Rest of the elements: #{rest.inspect}" #=> [20, 30, 40]

# 配列を展開して他の配列に挿入
nested_array = [[*array1], [*array2]]
puts "Nested array with expanded elements: #{nested_array.inspect}" #=> [[1, 2, 3], [4, 5, 6]]

# 配列リテラルで展開
combined_array = [0, *array1, 99]
puts "Array with expanded elements and additional elements: #{combined_array.inspect}" #=> [0, 1, 2, 3, 99]

# 探索・確認
puts "Array includes 4? #{numbers.include?(4)}" #=> true
puts "Index of 10: #{numbers.index(10)}"       #=> 2

# 配列の操作
squared_numbers = numbers.map { |num| num**2 }
puts "Squared numbers: #{squared_numbers.inspect}" #=> [0, 4, 100, 16, 25, 36]

# シンボルと & を使用
even_numbers = numbers.select(&:even?)
puts "Even numbers: #{even_numbers.inspect}"       #=> [0, 2, 10, 4, 6]

odd_numbers = numbers.reject(&:even?)
puts "Odd numbers: #{odd_numbers.inspect}"         #=> [5]

# 繰り返し処理
numbers.each do |num|
  puts "Number: #{num}"
end

# 可変長引数を使ったメソッドの例

# 1. 挨拶を作る
def greet(*names)
  "#{names.join('と')}、こんにちは！"
end

puts greet('田中さん')                         #=> "田中さん、こんにちは！"
puts greet('田中さん', '鈴木さん')             #=> "田中さんと鈴木さん、こんにちは！"
puts greet('田中さん', '鈴木さん', '佐藤さん') #=> "田中さんと鈴木さんと佐藤さん、こんにちは！"


# 並び替えと逆順
sorted_numbers = [5, 3, 8, 1, 2].sort
puts "Sorted array: #{sorted_numbers.inspect}"     #=> [1, 2, 3, 5, 8]

reversed_numbers = sorted_numbers.reverse
puts "Reversed array: #{reversed_numbers.inspect}" #=> [8, 5, 3, 2, 1]

# 二次元配列
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "Element at (2, 1): #{matrix[2][1]}"          #=> 8

# compact: 配列からnilの要素を取り除いた新しい配列を返す
array_with_nil = [1, nil, 2, nil, 3]
puts "Original array with nil: #{array_with_nil.inspect}" #=> [1, nil, 2, nil, 3]
compact_array = array_with_nil.compact
puts "Array without nil elements: #{compact_array.inspect}" #=> [1, 2, 3]

# flatten: ネストされた配列を平坦化して1次元の新しい配列を返す
nested_array = [[1, 2], [3, [4, 5]], 6]
puts "Original nested array: #{nested_array.inspect}" #=> [[1, 2], [3, [4, 5]], 6]
flat_array = nested_array.flatten
puts "Flattened array: #{flat_array.inspect}" #=> [1, 2, 3, 4, 5, 6]

# flatten!: 元の配列を破壊的に平坦化する
nested_array.flatten!
puts "After flatten! (original array flattened): #{nested_array.inspect}" #=> [1, 2, 3, 4, 5, 6]

# flat_map: 各要素に処理を適用し、その結果を平坦化した新しい配列を返す
words = ["hello world", "Ruby rocks"]
split_words = words.flat_map { |word| word.split(" ") }
puts "Flat map result (split and flatten): #{split_words.inspect}" #=> ["hello", "world", "Ruby", "rocks"]

# uniq: 配列から重複する要素を取り除いた新しい配列を返す
duplicate_array = [1, 2, 2, 3, 3, 3]
unique_array = duplicate_array.uniq
puts "Array with duplicates removed: #{unique_array.inspect}" #=> [1, 2, 3]

# transpose: 配列の配列を行列とみなし、行と列を入れ替えた新しい配列を返す
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
transposed = matrix.transpose
puts "Transposed matrix (rows and columns swapped): #{transposed.inspect}" #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

# zip: 複数の配列を組み合わせて、新しい配列を作成する
names = ["Alice", "Bob", "Charlie"]
scores = [85, 92, 78]
zipped_array = names.zip(scores)
puts "Zipped array (combined arrays): #{zipped_array.inspect}" #=> [["Alice", 85], ["Bob", 92], ["Charlie", 78]]

# sum: 配列の要素の合計を計算して返す
sum = [1, 2, 3, 4, 5].sum
puts "Sum of elements: #{sum}" #=> 15
