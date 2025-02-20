# ----------------------------------------
# インスタンス変数
# ----------------------------------------
# - 各インスタンスが独自に保持するデータ。
# - `@`をプレフィックスとして宣言します。

class Person
  def initialize(name, age)
    @name = name # 名前を格納するインスタンス変数
    @age = age   # 年齢を格納するインスタンス変数
  end

  def introduce
    # インスタンス変数を利用して自己紹介を返す
    "名前は#{@name}、年齢は#{@age}歳です。"
  end
end

person = Person.new("Alice", 30)
puts person.introduce
# => 名前はAlice、年齢は30歳です。

# ----------------------------------------
# クラスインスタンス変数
# ----------------------------------------
# - クラス自身が保持するデータ。
# - `@`をプレフィックスとして宣言するが、インスタンス変数とは異なり、
#   クラスレベルでのみアクセスできる。
# クラス構文直下とクラス変数の中で@をつけるとクラスインスタンス変数になる

class UniqueCounter
  @count = 0 # クラスインスタンス変数として定義

  def self.increment
    # クラスインスタンス変数を1増やす
    @count += 1
  end

  def self.count
    # 現在のクラスインスタンス変数の値を返す
    @count
  end
end

UniqueCounter.increment
UniqueCounter.increment
puts UniqueCounter.count
# => 2

# ----------------------------------------
# クラス変数
# ----------------------------------------
# - クラス全体で共有されるデータ。
# - `@@`をプレフィックスとして宣言します。

class Counter
  @@count = 0 # 全インスタンスで共有されるカウンタ変数

  def self.increment
    # カウントを1増やす
    @@count += 1
  end

  def self.count
    # 現在のカウントを返す
    @@count
  end
end

Counter.increment
Counter.increment
puts Counter.count
# => 2

# ----------------------------------------
# クラス変数とクラスインスタンス変数の違い
# ----------------------------------------

class Parent
  @@class_variable = "親クラスのクラス変数"
  @class_instance_variable = "親クラスのクラスインスタンス変数"

  def self.show_variables
    {
      class_variable: @@class_variable,               # クラス変数
      class_instance_variable: @class_instance_variable # クラスインスタンス変数
    }
  end
end

class Child < Parent
  @class_instance_variable = "子クラスのクラスインスタンス変数"
end

# 親クラスの変数を表示
puts "親クラスの変数:"
puts Parent.show_variables
# => {:class_variable=>"親クラスのクラス変数", :class_instance_variable=>"親クラスのクラスインスタンス変数"}

# 子クラスの変数を表示
puts "子クラスの変数:"
puts Child.show_variables
# => {:class_variable=>"親クラスのクラス変数", :class_instance_variable=>"子クラスのクラスインスタンス変数"}

# ----------------------------------------
# 違いのポイント
# ----------------------------------------
# - クラス変数（@@class_variable）は、親クラスと子クラスで共有される。
# - クラスインスタンス変数（@class_instance_variable）は、クラスごとに独立している。

# ----------------------------------------
# グローバル変数
# ----------------------------------------
# - プログラム全体でアクセス可能な変数。
# - `$`をプレフィックスとして宣言します。
# - 使用は推奨されません（スコープが広いため）。

$global_var = "グローバル変数"

class Example
  def show_global
    # グローバル変数を参照する
    "グローバル変数の値: #{$global_var}"
  end
end

example = Example.new
puts example.show_global
# => グローバル変数の値: グローバル変数

# ----------------------------------------
# ローカル変数
# ----------------------------------------
# - メソッドやブロック内でのみ使用できる変数。
# - スコープが限られるため、扱いやすい。

def local_example
  local_var = "ローカル変数" # メソッド内で宣言されたローカル変数
  puts local_var
end

local_example
# => ローカル変数

# ----------------------------------------
# 定数
# ----------------------------------------
# - 値を固定するための変数（変更は推奨されない）。
# - 大文字で始める名前を使用します。

class MathConstants
  PI = 3.14159 # 円周率を表す定数

  def self.circle_area(radius)
    # 半径から円の面積を計算する
    PI * radius**2
  end
end

puts MathConstants.circle_area(5)
# => 78.53975

# ----------------------------------------
# 疑似変数
# ----------------------------------------
# - 特定の値や情報を提供する特殊な変数。
# - 直接代入することはできません。

class ExampleWithSelf
  def show_self
    # 現在のオブジェクトを表す疑似変数 `self` を返す
    "selfの値: #{self}"
  end
end

example_with_self = ExampleWithSelf.new
puts example_with_self.show_self
# => selfの値: #<ExampleWithSelf:0x000056...>

puts "現在のファイル: #{__FILE__}" # 現在のファイル名を出力
puts "現在の行番号: #{__LINE__}" # 現在の行番号を出力
