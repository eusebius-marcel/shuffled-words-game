class Game
  require 'csv'

  def self.string_shuffle(s)
    s.split("").shuffle.join
  end

  point = 0
  CSV.foreach("words.csv") do |row|
    print "Tebak kata: "
    word = row[0]
    answer = nil
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
end
