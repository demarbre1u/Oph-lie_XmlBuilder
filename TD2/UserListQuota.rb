#!/usr/local/bin/ruby -w

unless[ARGV.length > 0]
  puts "Error. Usage : ./UserListQuota <nombre en Ko>"
  #exit 
end

users = Hash.new(0)

IO.readlines("/etc/passwd").each do |line| 
  line[/^([^:]*):[^:]*:([^:]*):.*:([^:]*):[^:]*$/]
  user = $1 
  uid = $2 
  home = $3
      
  if(uid != nil && user != nil && home != nil && uid.to_i >= 1000 && Dir.exist?(home))
    users[user] = home
  end
end

users.sort_by{ |user, home| user.downcase }.each do |user, home|
  `du -d 0 #{home}`[/^([0-9]*).*$/]
   taille = $1
   print "je travaille sur #{user} (de #{home}) : " 
   puts taille < ARGV[0] ? "il ne dépasse pas (#{taille} ko)" : "il dépasse (#{taille} ko) "
end