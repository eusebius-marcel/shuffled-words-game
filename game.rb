class Game
  require 'csv'

  def self.string_shuffle(s)
    s.split("").shuffle.join
  end

  def self.exit_message(point)
    puts "Selamat! Anda memperoleh #{point} poin"
  end

  max_level = 5
  point = 0
  words = CSV.read("words.csv").shuffle
  puts "Silahkan pilih level game (1-#{max_level})"
  level = gets.chomp.to_i
  until level > max_level
    words.each do |word|
      word = word[0]
      next unless word.length == level + 3
      answer = nil
      print "Tebak kata: "
      puts string_shuffle(word)
      until answer == word
        print "Jawab: "
        answer = gets.chomp
        if answer == word
          point += 1
          puts "BENAR point anda : #{point}!"
        else
          puts "SALAH! Silakan coba lagi"
        end
      end
    end
    if level == max_level
      exit_message(point)
      break
    end
    level += 1
    puts "Lanjut ke level #{level}? (y/n)"
    answer = gets.chomp.downcase
    case answer
    when "y"
      next
    when "n"
      exit_message(point)
      break
    else
      puts "Pilihan anda salah"
      exit_message(point)
      break
    end
  end
end
