# ----------------------------------------
# スコープとは？
# ----------------------------------------
# - 変数やメソッドがどの範囲でアクセスできるかを定義するルールのこと。
# - Rubyでは、ローカル変数、インスタンス変数、クラス変数、グローバル変数、定数など、
#   様々なスコープがあります。
# - スコープを理解することで、安全で意図した通りのコードを書くことができます。

# ----------------------------------------
# ローカル変数
# ----------------------------------------
# - メソッドやブロック内でのみ使用できる変数。
# - スコープが限られているため、他のコードに影響を与えません。

def local_scope_example
  local_var = "ローカル変数" # メソッド内で宣言されたローカル変数
  puts "メソッド内: #{local_var}"
end

local_scope_example
# => メソッド内: ローカル変数

# ローカル変数はスコープ外では無効
begin
  puts local_var
rescue NameError => e
  puts "スコープ外: #{e.message} (ローカル変数はメソッド外では使用できません)"
end

# ----------------------------------------
# インスタンス変数
# ----------------------------------------
# - 各インスタンスが独自に保持するデータ。
# - `@`をプレフィックスとして宣言します。
# - スコープの範囲は「そのインスタンス内」だけ。
# - 他のインスタンス間で共有されることはありません。

class InstanceScopeExample
  def initialize(name)
    @name = name # 名前を保持するインスタンス変数
  end

  def show_name
    # インスタンス変数を参照
    "インスタンス変数 @name の値: #{@name}"
  end
end

instance = InstanceScopeExample.new("Ruby")
puts instance.show_name
# => インスタンス変数 @name の値: Ruby

# インスタンスごとに独立している
another_instance = InstanceScopeExample.new("Python")
puts another_instance.show_name
# => インスタンス変数 @name の値: Python

# ----------------------------------------
# クラス変数
# ----------------------------------------
# - クラス全体で共有されるデータ。
# - `@@`をプレフィックスとして宣言します。
# - スコープの範囲は「そのクラスおよびそのサブクラス内」。
# - すべてのインスタンスで共有されるため、どのインスタンスからもアクセス可能。

class ClassScopeExample
  @@count = 0 # インスタンスの作成数を保持するクラス変数

  def initialize
    # インスタンスが作成されるたびにカウントを増加
    @@count += 1
  end

  def self.show_count
    # 現在のカウントを返す
    "クラス変数 @@count の値: #{@@count}"
  end
end

ClassScopeExample.new
ClassScopeExample.new
puts ClassScopeExample.show_count
# => クラス変数 @@count の値: 2

# クラス変数はサブクラスでも共有される
class SubClass < ClassScopeExample; end
SubClass.new
puts ClassScopeExample.show_count
# => クラス変数 @@count の値: 3

# ----------------------------------------
# グローバル変数
# ----------------------------------------
# - プログラム全体でアクセス可能な変数。
# - `$`をプレフィックスとして宣言します。
# - スコープの範囲は「プログラム全体」。
# - どのクラスやメソッドからでもアクセス可能なため、管理が難しく、使用は推奨されません。

$global_var = "グローバル変数"

def global_scope_example
  # グローバル変数を参照
  "グローバル変数の値: #{$global_var}"
end

puts global_scope_example
# => グローバル変数の値: グローバル変数

# グローバル変数はどこでもアクセス可能
class Example
  def show_global
    "クラス内から参照したグローバル変数の値: #{$global_var}"
  end
end

example = Example.new
puts example.show_global
# => クラス内から参照したグローバル変数の値: グローバル変数

# ----------------------------------------
# 定数
# ----------------------------------------
# - 値を固定するための変数（変更は推奨されない）。
# - クラスやモジュール内で大文字で始まる名前を使用して宣言します。
# - スコープの範囲は「宣言されたクラスやモジュール内」。
# - ただし、クラス外からもアクセス可能。

class ConstantScopeExample
  MY_CONSTANT = "定数の値" # 定数

  def self.show_constant
    # 定数の値を返す
    "定数 MY_CONSTANT の値: #{MY_CONSTANT}"
  end
end

# クラス内からアクセス
puts ConstantScopeExample.show_constant
# => 定数 MY_CONSTANT の値: 定数の値

# クラス外からアクセス
puts "定数 MY_CONSTANT の値: #{ConstantScopeExample::MY_CONSTANT}"
# => 定数 MY_CONSTANT の値: 定数の値

# 定数は再代入可能だが、警告が表示される
ConstantScopeExample::MY_CONSTANT = "新しい値" # Rubyは警告を表示
puts ConstantScopeExample::MY_CONSTANT
# => 新しい値

# ----------------------------------------
# パブリックメソッド
# ----------------------------------------
# - パブリックメソッドは外部から自由に呼び出すことができるメソッド。
# - 明示的に`public`と宣言するか、何も指定しない場合、パブリックメソッドになります。

class PublicExample
  def greet
    "パブリックメソッドが呼び出されました"
  end
end

public_example = PublicExample.new
puts public_example.greet
# => パブリックメソッドが呼び出されました

# ----------------------------------------
# トップレベルメソッド
# ----------------------------------------
# - トップレベルメソッドは、どこからでも呼び出すことができるグローバルなメソッド。
# - ファイルのトップレベルで定義される。

def top_level_method
  "トップレベルメソッドが呼び出されました"
end

puts top_level_method
# => トップレベルメソッドが呼び出されました

# トップレベルメソッドは実際にはObjectクラスのインスタンスメソッド
puts Object.private_instance_methods.include?(:top_level_method) # => true

# ----------------------------------------
# プライベートメソッド (private)
# ----------------------------------------
# - クラス内部からのみ呼び出せるメソッド。
# - 明示的に `private` と宣言します。
# - レシーバを指定して呼び出すことはできません。
# - Ruby 2.7 以降では `self.メソッド名` で呼び出せる。

class PrivateExample
  def call_private
    # プライベートメソッドをクラス内部で呼び出す
    private_method
  end

  def call_private_with_self
    # Ruby 2.7 以降では self を指定して private メソッドを呼び出せる
    self.private_method
  end

  private

  def private_method
    "プライベートメソッドが呼び出されました"
  end
end

private_example = PrivateExample.new

# クラス内部からの呼び出し（成功）
puts private_example.call_private
# => プライベートメソッドが呼び出されました

# self をつけた呼び出し（Ruby 2.7 以降OK）
puts private_example.call_private_with_self
# => プライベートメソッドが呼び出されました

# クラス外部から直接呼び出すとエラー
begin
  puts private_example.private_method
rescue NoMethodError => e
  puts "スコープ外: #{e.message} (プライベートメソッドはクラス外から呼び出せません)"
end

# ----------------------------------------
# プロテクトメソッド (protected)
# ----------------------------------------
# - 同じクラスやサブクラスのインスタンスから呼び出せるメソッド。
# - 明示的に `protected` と宣言します。
# - レシーバを指定して呼び出すことが可能。

class ProtectedExample
  def call_protected(other_instance)
    # 他のインスタンスのプロテクトメソッドを呼び出す
    other_instance.protected_method
  end

  protected

  def protected_method
    "プロテクトメソッドが呼び出されました"
  end
end

example1 = ProtectedExample.new
example2 = ProtectedExample.new

# 同じクラスの他のインスタンスから呼び出し（成功）
puts example1.call_protected(example2)
# => プロテクトメソッドが呼び出されました

# クラス外部から直接呼び出すとエラー
begin
  puts example1.protected_method
rescue NoMethodError => e
  puts "スコープ外: #{e.message} (プロテクトメソッドはクラス外からアクセスできません)"
end

# ----------------------------------------
# 継承クラスでの動作確認
# ----------------------------------------
# - protectedメソッドはサブクラスでも呼び出し可能。

class Child < ProtectedExample
  def call_parent_protected(parent_instance)
    parent_instance.protected_method
  end
end

child = Child.new
parent = ProtectedExample.new

# サブクラスのインスタンスが親クラスのインスタンスの protected メソッドを呼び出す（成功）
puts child.call_parent_protected(parent)
# => プロテクトメソッドが呼び出されました