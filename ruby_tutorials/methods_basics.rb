# ----------------------------------------
# インスタンスメソッド
# ----------------------------------------
# - インスタンスに対して呼び出せるメソッド。
# - 主に特定のオブジェクトに関連した動作を実現します。

class Greeter
  def say_hello(name)
    # 引数として受け取った名前を用いて挨拶文を返す
    "Hello, #{name}!"
  end
end

greeter = Greeter.new
puts greeter.say_hello("Alice") # => "Hello, Alice!"

# ----------------------------------------
# クラスメソッド
# ----------------------------------------
# - クラス自身に対して呼び出せるメソッド。
# - インスタンスを生成しなくても使用可能。

class Calculator
  def self.add(a, b)
    # 引数aとbを足し合わせた結果を返す
    a + b
  end
end

puts Calculator.add(10, 20) # => 30

# ----------------------------------------
# 特異メソッド (Singleton Method)
# ----------------------------------------
# - 特定のオブジェクトにだけ定義されるメソッド。

greeter = "Hello"

def greeter.shout
  # 呼び出された文字列を大文字に変換し、"!!!"を付けて返す
  self.upcase + "!!!"
end

puts greeter.shout # => "HELLO!!!"

# ----------------------------------------
# フックメソッド (Hook Method)
# ----------------------------------------
# - 特定のイベント（例: クラス継承時、オブジェクト生成時など）に
#   自動的に呼び出されるメソッド。

# クラス継承時に呼び出される `inherited`
class Parent
  def self.inherited(subclass)
    # サブクラスが生成された際にこのメソッドが呼ばれる
    puts "#{subclass} has inherited from #{self}"
  end
end

class Child < Parent; end
# => "Child has inherited from Parent"

# オブジェクト生成時に呼び出される `initialize`
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    # オブジェクトが生成される際に呼ばれる初期化メソッド
    @name = name
    @age = age
    puts "A new person named #{@name}, aged #{@age}, has been created!"
  end
end

person = Person.new("Alice", 30)
# => "A new person named Alice, aged 30, has been created!"

# ----------------------------------------
# エイリアスメソッド (Alias Method)
# ----------------------------------------
# - 既存のメソッドに新しい名前を付けることで、同じ動作を
#   複数の名前で呼び出せるようにする。

class Example
  def original_method
    # 元のメソッドの内容
    "Original"
  end

  # original_methodに別名new_methodを与える
  alias new_method original_method
end

example = Example.new
puts example.original_method # => "Original"
puts example.new_method      # => "Original"

# ----------------------------------------
# オーバーライドメソッド
# ----------------------------------------
# - 親クラスのメソッドを子クラスで再定義し、挙動を変更する。

# 基本的なオーバーライド
class Parent
  def greet
    # 親クラスの挨拶メソッド
    "Hello from Parent"
  end
end

class Child < Parent
  def greet
    # 子クラスで再定義された挨拶メソッド
    "Hello from Child"
  end
end

child = Child.new
puts child.greet # => "Hello from Child"

# `super`を使用したオーバーライド
class Parent
  def greet
    "Hello from Parent"
  end
end

class Child < Parent
  def greet
    parent_greet = super # 親クラスのgreetメソッドを呼び出す
    "#{parent_greet} and Hello from Child"
  end
end

child = Child.new
puts child.greet
# => "Hello from Parent and Hello from Child"

# ----------------------------------------
# リーダーメソッド、ライターメソッド、アクセサーメソッド
# ----------------------------------------
# - リーダーメソッド: 属性を読み取る
# - ライターメソッド: 属性に値を設定する
# - アクセサーメソッド: 読み書きの両方を提供する

class Person
  attr_reader :name    # name属性を読み取るメソッドを自動生成
  attr_writer :age     # age属性を書き込むメソッドを自動生成
  attr_accessor :city  # city属性を読み書きするメソッドを自動生成

  def initialize(name, age, city)
    @name = name
    @age = age
    @city = city
  end
end

person = Person.new("Alice", 30, "Tokyo")
puts person.name        # => "Alice"（リーダーメソッドで取得）
person.age = 31         # => ライターメソッドで年齢を変更
puts person.city        # => "Tokyo"（リーダーメソッドで取得）
person.city = "Osaka"   # => アクセサーメソッドで書き換え
puts person.city        # => "Osaka"

# ----------------------------------------
# デフォルトのオブジェクトメソッド
# ----------------------------------------
# - Rubyのすべてのオブジェクトが持つ基本的なメソッド。
# - 主にデバッグや動作確認に役立つ。

str = "Ruby"

# `to_s`: オブジェクトを文字列化
puts str.to_s        # => "Ruby"

# `object_id`: オブジェクトの一意のIDを返す
puts str.object_id   # => オブジェクトID（例: 12345678）

# `inspect`: オブジェクトの詳細な情報（デバッグ用途）
puts str.inspect     # => "Ruby"

# `class`: オブジェクトのクラスを取得
puts str.class       # => String

# `is_a?`: オブジェクトが指定したクラスかを確認
puts str.is_a?(String) # => true
puts str.is_a?(Array)  # => false

# `respond_to?`: メソッドが使用可能か確認
puts str.respond_to?(:upcase)  # => true
puts str.respond_to?(:nonexistent_method) # => false

# `freeze` と `frozen?`: オブジェクトを凍結して変更不可にする
str.freeze
puts str.frozen? # => true

# `dup` と `clone`: オブジェクトのコピーを作成
str_copy = str.dup
puts str_copy # => "Ruby"

# `equal?`: 2つのオブジェクトが同一か確認
puts str.equal?(str_copy) # => false

# `hash`: ハッシュ値を取得（主にハッシュキーとして利用）
puts str.hash # => ハッシュ値（例: -1234567890123456789）
