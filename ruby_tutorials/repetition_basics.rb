# 1. whileループ
i = 0
while i < 5
  puts "while loop: #{i}"  # => 0, 1, 2, 3, 4
  i += 1
end

# 2. untilループ
i = 0
until i >= 5
  puts "until loop: #{i}"  # => 0, 1, 2, 3, 4
  i += 1
end

# 3. forループ
for i in 0..4
  puts "for loop: #{i}"  # => 0, 1, 2, 3, 4
end

# 4. eachメソッド
(0..4).each do |i|
  puts "each method: #{i}"  # => 0, 1, 2, 3, 4
end

# 5. timesメソッド
5.times do |i|
  puts "times method: #{i}"  # => 0, 1, 2, 3, 4
end

# 6. loopメソッド（無限ループ）
i = 0
loop do
  puts "loop method: #{i}"  # => 0, 1, 2, 3, 4
  i += 1
  break if i >= 5
end

# 7. mapメソッド（配列の変換）
squared = (1..5).map { |i| i ** 2 }
puts "map method: #{squared}"  # => [1, 4, 9, 16, 25]

# 8. selectメソッド（フィルタリング）
even_numbers = (1..10).select { |i| i.even? }
puts "select method: #{even_numbers}"  # => [2, 4, 6, 8, 10]

# 9. uptoメソッド
1.upto(5) do |i|
  puts "upto method: #{i}"  # => 1, 2, 3, 4, 5
end

# 10. downtoメソッド
5.downto(1) do |i|
  puts "downto method: #{i}"  # => 5, 4, 3, 2, 1
end

# 11. stepメソッド（指定したステップで繰り返し）
(0..10).step(2) do |i|
  puts "step method: #{i}"  # => 0, 2, 4, 6, 8, 10
end

# 12. break（繰り返しを途中で終了）
(1..10).each do |i|
  break if i > 5
  puts "break example: #{i}"  # => 1, 2, 3, 4, 5
end

# 13. throwとcatchを使った大域脱出
catch(:exit_loop) do
  (1..10).each do |i|
    if i == 6
      throw :exit_loop  # 繰り返し処理を完全に終了
    end
    puts "throw and catch: #{i}"  # => 1, 2, 3, 4, 5
  end
end

# 14. 繰り返し処理でのbreakとreturnの違い
def break_vs_return
  (1..10).each do |i|
    if i == 5
      break # 繰り返し処理を終了して次の処理へ
    end
    puts "break example: #{i}"  # => 1, 2, 3, 4
  end

  (1..10).each do |i|
    if i == 5
      return # メソッド全体を終了
    end
    puts "return example: #{i}"  # => 1, 2, 3, 4
  end

  # この部分はreturnで終了されるため実行されない
  puts "This will never print"
end

break_vs_return

# 15. next（次のループにスキップ）
(1..10).each do |i|
  if i % 2 == 0
    next # 偶数をスキップ
  end
  puts "next example: #{i}"  # => 1, 3, 5, 7, 9
end

# 16. redo（同じ繰り返しをやり直す）
foods = ['ピーマン', 'トマト', 'セロリ']
foods.each do |food|
  print "#{food}は好きですか？ => "
  # sampleは配列からランダムに1要素を取得するメソッド
  answer = ['はい', 'いいえ'].sample
  puts answer

  # はいと答えなければもう一度聞き直す
  redo unless answer == 'はい'
end
