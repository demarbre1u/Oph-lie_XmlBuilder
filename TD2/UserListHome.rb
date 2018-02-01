#!/usr/bin/ruby -w

users = Hash.new(0)

IO.readlines("/etc/passwd").each do |line| 
  line[/([^:]*):.*:([^:]*):.*$/]
  user = $1
  home = $2
  home[/^(\/home)/] unless home == nil
  if($1 != nil)
    users[user] = home 
  end
end

puts users.sort_by{ |user, home| user }