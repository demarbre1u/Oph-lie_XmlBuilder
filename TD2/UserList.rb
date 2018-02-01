#!/usr/bin/ruby -w

users = Hash.new(0)

IO.readlines("/etc/passwd").each do |line| 
  line[/^([^:]*):[^:]*:([^:]*):.*$/]
  if $2 != nil && $2.to_i > 1000
    users[$1] = $2
  end
end


puts users.sort_by{ |user, uid| user }