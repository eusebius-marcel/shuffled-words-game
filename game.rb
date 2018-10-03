class Game
  require 'csv'

  def self.string_shuffle(s)
    s.split("").shuffle.join
  end

  point = 0
  words = CSV.read("words.csv").shuffle
  words.each do |word|
    print "Tebak kata: "
    word = word[0]
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
