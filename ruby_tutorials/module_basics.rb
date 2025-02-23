# ========================================
# モジュールとミックスインの基本
# ========================================
# - モジュールは、クラスに共通のメソッドを提供する仕組み
# - 継承とは異なり、複数のクラスで共通の機能を簡単に共有できる
# - `include` を使うことでインスタンスメソッドとして取り込むことが可能

module Greetable
  def greet
    "Hello, I am #{name}"
  end
end

class Person
  include Greetable  # GreetableモジュールをPersonクラスにミックスイン

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# 使用例
person = Person.new("Alice")
puts person.greet  # => "Hello, I am Alice"

# ========================================
# 複数のモジュールのミックスイン
# ========================================
# - モジュールを複数 `include` すると、複数の機能をクラスに追加できる
# - ミックスイン（Mix-in）と呼ばれる手法で、継承の代わりとして有効

module Speakable
  def speak
    "I can speak!"
  end
end

module Runnable
  def run
    "I am running!"
  end
end

class Athlete
  include Speakable
  include Runnable

  def initialize(name)
    @name = name
  end
end

# 使用例
athlete = Athlete.new("Bob")
puts athlete.speak  # => "I can speak!"
puts athlete.run    # => "I am running!"

# ========================================
# モジュールの定数とクラスメソッド
# ========================================
# - モジュールはメソッドだけでなく定数も持つことができる
# - `モジュール名::定数名` の形式でアクセス可能

module MathConstants
  PI = 3.14159
end

class Circle
  include MathConstants

  def initialize(radius)
    @radius = radius
  end

  def area
    MathConstants::PI * @radius * @radius
  end
end

# 使用例
circle = Circle.new(5)
puts circle.area  # => 78.53975

# ========================================
# ミックスインの順序に注意
# ========================================
# - 同じメソッド名が複数のモジュールで定義されている場合、後から `include` したものが優先される

module A
  def hello
    "Hello from A"
  end
end

module B
  def hello
    "Hello from B"
  end
end

class MyClass
  include A
  include B
end

# 使用例
obj = MyClass.new
puts obj.hello  # => "Hello from B"  # Bモジュールが優先される

# ========================================
# extend を使ったクラスメソッドの定義
# ========================================
# - `include` はインスタンスメソッドを追加するが、`extend` はクラスメソッドを追加する

module MyClassMethods
  def class_method
    "This is a class method"
  end
end

class MyClass
  extend MyClassMethods  # クラスメソッドとして追加
end

puts MyClass.class_method  # => "This is a class method"

# ========================================
# モジュールを利用した名前空間の作成
# ========================================
# - 名前空間としてモジュールを使用し、クラス名の衝突を防ぐ

module Vehicle
  class Car
    def type
      "Car"
    end
  end

  class Truck
    def type
      "Truck"
    end
  end
end

# 使用例
car = Vehicle::Car.new
puts car.type  # => "Car"

truck = Vehicle::Truck.new
puts truck.type  # => "Truck"

# ========================================
# 入れ子になったモジュール
# ========================================
# - モジュールの中にモジュールを定義できる
# - 名前空間をさらに細かく分類したいときに役立つ

module OuterModule
  module InnerModule
    def self.say_hello
      "Hello from InnerModule!"
    end
  end

  def self.say_outer
    "Hello from OuterModule!"
  end
end

# 使用例
puts OuterModule::InnerModule.say_hello  # => "Hello from InnerModule!"
puts OuterModule.say_outer               # => "Hello from OuterModule!"

# ========================================
# 入れ子のモジュールを include して使う
# ========================================
# - `include OuterModule::InnerModule` の形式で、ネストされたモジュールのメソッドをクラスに取り込める

module OuterModule
  module InnerModule
    def greet
      "Hello from InnerModule!"
    end
  end
end

class MyClass
  include OuterModule::InnerModule  # InnerModule のメソッドをミックスイン
end

# 使用例
obj = MyClass.new
puts obj.greet  # => "Hello from InnerModule!"

# ========================================
# モジュールの使いどころ
# ========================================
# - モジュールはクラスの継承ではカバーできない部分を補完するために使われる
# - 主な用途：
#   1. **コードの再利用** → 異なるクラスに共通の機能を提供
#   2. **名前空間の管理** → クラスや定数の衝突を防ぐ
#   3. **機能の分割** → コードをモジュールごとに整理し、責務を分ける
#   4. **ユーティリティメソッドの提供** → クラスに依存しないメソッドを集約
