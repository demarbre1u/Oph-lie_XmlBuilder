#!/usr/bin/ruby -w

require 'date'

def tree(dir)
  Dir.foreach(dir) do |f|
    next if f == '.' or f == '..'
    f = dir + '/' + f
    
    if File.directory?(f)
      tree(File.absolute_path(f))
    else
      
      if File.stat(f).executable? && File.stat(f).uid == 0 && 
        (File.stat(f).size > (1024 * 1024) || File.stat(f).ctime.to_date < Date.new(2012, 8, 1))
        puts f
      end
    
    end
  
  end
end



tree("/home/demarbre1u/Test")

