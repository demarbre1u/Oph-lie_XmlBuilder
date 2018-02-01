#!/usr/bin/ruby -w

puts "Entrez le mot à afficher : "
word = gets.strip

1.upto(word.length) do
  fork do
    puts "pid: #{Process.pid}, time: #{Time.now.strftime("%H:%M:%S:%9N")}, string: #{word}"
  end
end

1.upto(word.length) do
  pid = Process.wait
  puts "Mon fils #{pid}" + ($?.exitstatus == 0 ? " c'est bien terminé." : "c'est mal terminé.")
end