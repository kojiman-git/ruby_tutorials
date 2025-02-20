# ----------------------------------------
# ProcとLambdaの違いを学ぶ
# ----------------------------------------
# - ProcとLambdaはどちらもブロックをオブジェクト化する機能。
# - しかし、引数の扱いやreturnの挙動に違いがある。
# - それぞれの特性を理解し、適切に使い分けることが重要。

# ----------------------------------------
# 1. Procの基本
# ----------------------------------------
proc_example = Proc.new { |name| puts "Hello, #{name}!" }
proc_example.call("Alice")  # => "Hello, Alice!"
proc_example["Bob"]         # => "Hello, Bob!"

# ----------------------------------------
# 2. Lambdaの基本
# ----------------------------------------
lambda_example = lambda { |name| puts "Hello, #{name}!" }
lambda_example.call("Charlie") # => "Hello, Charlie!"
lambda_example.("David")       # => "Hello, David!"

# ----------------------------------------
# 3. ProcとLambdaの違い
# ----------------------------------------

# (1) 引数の扱い
# - Procは引数の数が足りなくてもエラーにならず、nilが補完される。
# - 逆に、余計な引数が渡っても無視される。
proc_example = Proc.new { |a, b| puts "a: #{a}, b: #{b}" }
proc_example.call(1)       # => "a: 1, b: " (b は nil になる)
proc_example.call(1, 2, 3) # => "a: 1, b: 2" (3 は無視される)

# - Lambdaは引数の個数を厳密にチェックする。
lambda_example = lambda { |a, b| puts "a: #{a}, b: #{b}" }
# lambda_example.call(1)     # ArgumentError: wrong number of arguments (given 1, expected 2)
lambda_example.call(1, 2)  # => "a: 1, b: 2"

# (2) return の動作
# - Procのreturnはメソッドごと抜けてしまう。
def proc_return_test
  my_proc = Proc.new { return "Procのreturnでメソッドごと抜ける" }
  my_proc.call
  puts "この行は実行されない"
end
puts proc_return_test # => "Procのreturnでメソッドごと抜ける"

# - Lambdaのreturnは、Lambda内だけに影響を与える。
def lambda_return_test
  my_lambda = lambda { return "LambdaのreturnはLambda内でのみ有効" }
  my_lambda.call
  puts "この行は実行される"
end
puts lambda_return_test 
# => "LambdaのreturnはLambda内でのみ有効"
# => "この行は実行される"

# ----------------------------------------
# 4. ProcやLambdaの活用例
# ----------------------------------------

def execute_proc(proc_object)
  proc_object.call("Ruby")
end
my_proc = Proc.new { |language| puts "#{language} is awesome!" }
execute_proc(my_proc) # => "Ruby is awesome!"

# 条件に応じた処理を変更
def conditional_executor(flag)
  if flag
    Proc.new { puts "This is a Proc" }
  else
    lambda { puts "This is a Lambda" }
  end
end

proc_or_lambda = conditional_executor(true)
proc_or_lambda.call # => "This is a Proc"

proc_or_lambda = conditional_executor(false)
proc_or_lambda.call # => "This is a Lambda"
