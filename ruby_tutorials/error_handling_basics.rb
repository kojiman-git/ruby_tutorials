# ----------------------------------------
# 例外処理（エラーハンドリング）とは？
# ----------------------------------------
# - 例外処理とは、プログラムの実行中に発生するエラー（例外）を適切に処理し、
#   プログラムの異常終了を防ぐための仕組みです。

# ----------------------------------------
# 1. 基本的なエラーハンドリング
# ----------------------------------------

begin
  puts 10 / 0  # 例外が発生 (ZeroDivisionError)
rescue ZeroDivisionError
  puts "ゼロで割ることはできません！"  # エラー発生時に実行される処理
end

# ----------------------------------------
# 2. 例外クラスを指定しない場合
# ----------------------------------------

begin
  num = Integer("abc")  # "abc" は整数に変換できないため ArgumentError が発生
rescue
  puts "エラーが発生しました"  # どんな種類の例外でもキャッチして処理を実行
end

# ----------------------------------------
# 3. 例外オブジェクトを変数に格納する
# ----------------------------------------

begin
  File.open("non_existent_file.txt")  # 存在しないファイルを開こうとしてエラー発生
rescue StandardError => e  # 発生した例外を e に格納
  puts "エラー発生: #{e.class} - #{e.message}"  # エラーのクラス名とメッセージを出力
end

# ----------------------------------------
# 4. ensure で後処理を行う
# ----------------------------------------

def read_file(filename)
  file = nil
  begin
    file = File.open(filename, "r")  # ファイルを開く
    puts file.read  # ファイルの内容を読み込んで出力
  rescue Errno::ENOENT  # ファイルが存在しない場合のエラー
    puts "ファイルが見つかりません"
  ensure
    file.close if file  # 例外が発生しても必ずファイルを閉じる
  end
end

read_file("test.txt")  # "test.txt" がない場合、エラーメッセージを出力

# ----------------------------------------
# 5. retry で再試行する
# ----------------------------------------

attempt = 0  # 試行回数をカウントする変数

begin
  attempt += 1
  puts "試行回数: #{attempt}"  # 現在の試行回数を表示
  raise "ランダムエラー" if attempt < 3  # 3回目までエラーを発生させる
rescue
  puts "エラー発生、リトライします..."  # エラー発生時のメッセージ
  retry if attempt < 3  # 3回目まではリトライする
end

# ----------------------------------------
# 6. raise で例外を発生させる
# ----------------------------------------

def divide(a, b)
  raise ArgumentError, "ゼロで割ることはできません" if b == 0  # 条件を満たせば例外を発生させる
  a / b  # 割り算を実行
end

begin
  puts divide(10, 0)  # b が 0 なので、raise によって例外が発生する
rescue ArgumentError => e
  puts "エラー: #{e.message}"  # 例外のメッセージを出力
end

# ----------------------------------------
# 7. begin をメソッド内で省略する
# ----------------------------------------

def safe_divide(a, b)
  a / b  # 割り算を実行
rescue ZeroDivisionError  # 例外が発生した場合のみ rescue ブロックが実行される
  puts "ゼロで割ることはできません"  # ゼロ除算エラー時のメッセージ
end

safe_divide(10, 0)  # ゼロで割ろうとするため rescue が動作する

# ----------------------------------------
# 8. 独自の例外クラスを作成する
# ----------------------------------------

class CustomError < StandardError; end  # StandardError を継承したカスタム例外クラス

def risky_method(value)
  raise CustomError, "値が不正です: #{value}" if value < 0  # value が 0 未満なら例外を発生
  puts "正常な値: #{value}"  # 正常な値ならそのまま出力
end

begin
  risky_method(-5)  # -5 は条件に合致するため CustomError が発生
rescue CustomError => e
  puts "カスタムエラー発生: #{e.message}"  # カスタムエラーのメッセージを出力
end
