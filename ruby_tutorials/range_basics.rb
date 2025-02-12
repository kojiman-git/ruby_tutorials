# 範囲の作成
range_inclusive = 1..5  # 終了値を含む
range_exclusive = 1...5 # 終了値を含まない

# 範囲の基本情報
puts "Inclusive range: #{range_inclusive}"  #=> Inclusive range: 1..5
puts "Exclusive range: #{range_exclusive}" #=> Exclusive range: 1...5

# 範囲内の値を配列に変換
puts range_inclusive.to_a.inspect  #=> [1, 2, 3, 4, 5]
puts range_exclusive.to_a.inspect #=> [1, 2, 3, 4]

# 範囲内に値が含まれるかを確認
puts range_inclusive.include?(5)  #=> true
puts range_exclusive.include?(5) #=> false
puts range_inclusive.cover?(3)   #=> true

# 繰り返し処理（eachメソッド）
range_inclusive.each do |num|
  puts "Number: #{num}"  #=> 1, 2, 3, 4, 5 (それぞれ出力)
end

# stepメソッドで間隔を指定
(1..10).step(2) do |num|
  puts "Step: #{num}"  #=> 1, 3, 5, 7, 9
end

# 範囲のプロパティを取得
puts "Range start: #{range_inclusive.begin}" #=> Range start: 1
puts "Range end: #{range_inclusive.end}"     #=> Range end: 5

# サイズを取得
puts (1..10).size  #=> 10

# 最小値・最大値の取得
puts "Min: #{range_inclusive.min}, Max: #{range_inclusive.max}" #=> Min: 1, Max: 5

# 文字列での範囲
char_range = 'a'..'e'
puts char_range.to_a.inspect #=> ["a", "b", "c", "d", "e"]

# 条件式での範囲の使用
age = 25
case age
when 0..12
  puts "Child"
when 13..19
  puts "Teenager"
when 20..64
  puts "Adult"  # この行が実行される
else
  puts "Senior"
end

