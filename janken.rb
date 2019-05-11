class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください。"
    puts "0:グー"
    puts "1:チョキ"
    puts "2:パー"
    hand_choice = gets.chomp
    if hand_choice === "0" || hand_choice === "1" ||  hand_choice === "2"
      return hand_choice.to_i 
    end
    puts ""
    puts "0〜2の数字を入力してください。"
    hand()
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    return rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    judge = (player_hand - enemy_hand + 3) % 3

    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    result = ["グー","チョキ","パー"]
    if judge == 0
      puts ""
      puts "相手の手は#{result[enemy_hand]}です。引き分けです。"
      puts ""
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      # 下記の記述で、ジャンケンメソッドが起動される
      janken.pon(player.hand, enemy.hand)
    elsif judge == 1
      puts ""
      puts "相手の手は#{result[enemy_hand]}です。あなたの負けです。"
    elsif judge == 2
      puts ""
      puts "相手の手は#{result[enemy_hand]}です。あなたの勝ちです。"
    end



  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
