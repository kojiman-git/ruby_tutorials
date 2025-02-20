# ----------------------------------------
# ブロックの基本的な使い方
# ----------------------------------------
# - `each` メソッドを使って配列の各要素に対して処理を行う
# - `{}` と `do...end` の2種類の記法がある
puts "# ブロックの基本的な使い方"
[1, 2, 3].each { |num| puts num * 2 } 
# 出力:
# 2
# 4
# 6

[1, 2, 3].each do |num|
  puts num * 3
end
# 出力:
# 3
# 6
# 9

# ----------------------------------------
# `yield` を使ったブロックの呼び出し
# ----------------------------------------
# - `yield` を使うことで、渡されたブロックを実行できる
# - `block_given?` を使えば、ブロックが渡されているか判定可能

def greet
  puts "Hello!"
  yield if block_given?
  puts "Goodbye!"
end

greet { puts "Nice to meet you!" }
# 出力:
# Hello!
# Nice to meet you!
# Goodbye!

# ----------------------------------------
# `yield` の引数
# ----------------------------------------
# - `yield` に値を渡すと、ブロックの引数として受け取れる

def double
  yield 10
end

double { |num| puts num * 2 }
# 出力:
# 20

# ----------------------------------------
# ブロックを引数として受け取る (`&block`)
# ----------------------------------------
# - `&block` を使うと、ブロックを明示的に受け取れる
# - `block.call` を使ってブロックを実行できる

def repeat_three_times(&block)
  3.times { block.call }
end

repeat_three_times { puts "Hello!" }
# 出力:
# Hello!
# Hello!
# Hello!

# ----------------------------------------
# `yield` と `&block` の比較
# ----------------------------------------
# - `yield` はシンプルなブロックの呼び出し方法
# - `&block` を使うと、ブロックをオブジェクトとして扱える

def example1
  yield
end

example1 { puts "Yield example!" }
# 出力:
# Yield example!

def example2(&block)
  block.call
end

example2 { puts "Block.call example!" }
# 出力:
# Block.call example!

# ----------------------------------------
# ブロックを使ったカスタムイテレータ
# ----------------------------------------
# - `each` メソッドのように、配列の要素を順に処理するメソッドを作成
# - `yield` を使って渡されたブロックを実行する

def my_each(array)
  for item in array
    yield item
  end
end

my_each([1, 2, 3]) { |num| puts num * 2 }
# 出力:
# 2
# 4
# 6
