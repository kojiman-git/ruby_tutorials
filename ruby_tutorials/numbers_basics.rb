# 数値の基本とメソッド

puts "--- 整数(Integer)と浮動小数点数(Float) ---"
int_value = 10
float_value = 10.5
puts "#{int_value} のクラス: #{int_value.class}"
puts "#{float_value} のクラス: #{float_value.class}"

puts "\n--- 数値の基本演算 ---"
puts "10 + 5  = #{10 + 5}"
puts "10 - 5  = #{10 - 5}"
puts "10 * 5  = #{10 * 5}"
puts "10 / 3  = #{10 / 3} (整数同士の除算)"
puts "10.0 / 3 = #{10.0 / 3} (浮動小数点の除算)"
puts "10 % 3  = #{10 % 3} (剰余)"
puts "10 ** 2 = #{10 ** 2} (累乗)"

puts "\n--- 数値の主なメソッド ---"
num = -10
puts "#{num}.abs  = #{num.abs} (絶対値)"
puts "#{num}.even? = #{num.even?} (偶数か)"
puts "#{num}.odd? = #{num.odd?} (奇数か)"
puts "3.14159.round  = #{3.14159.round} (四捨五入)"
puts "3.14159.round(2)  = #{3.14159.round(2)} (小数第2位で四捨五入)"
puts "3.9.floor  = #{3.9.floor} (切り捨て)"
puts "3.1.ceil  = #{3.1.ceil} (切り上げ)"
puts "10.to_f  = #{10.to_f} (整数 → 浮動小数点)"
puts "10.5.to_i  = #{10.5.to_i} (浮動小数点 → 整数)"

puts "\n--- 乱数の生成 ---"
puts "rand        = #{rand} (0以上1未満のランダム小数)"
puts "rand(10)    = #{rand(10)} (0以上10未満のランダム整数)"
puts "rand(1..100) = #{rand(1..100)} (1以上100以下のランダム整数)"

puts "\n--- 数値の比較 ---"
puts "10 > 5  = #{10 > 5}"
puts "10 < 5  = #{10 < 5}"
puts "10 >= 10 = #{10 >= 10}"
puts "10 <= 5  = #{10 <= 5}"
puts "10 == 10 = #{10 == 10}"
puts "10 != 5  = #{10 != 5}"
puts "10 <=> 5  = #{10 <=> 5} (左が大きい: 1)"
puts "5 <=> 10  = #{5 <=> 10} (右が大きい: -1)"
puts "10 <=> 10 = #{10 <=> 10} (同じ: 0)"