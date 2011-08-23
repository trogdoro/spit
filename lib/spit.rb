def Spit txt
  line = caller[0]

  path, number = line.match(/(.+):(\d+)/)[1..2]

  label = IO.readlines("/projects/homerun/homerun/app/controllers/web/dev_controller.rb")[number.to_i - 1]
  label.strip!.sub!(/Ol /, '')

  clear, green, red, yellow, blue, pink, italic, bold, highlight = "\e[0m", "\e[32m", "\e[31m", "\e[33m", "\e[36m", "\e[35m", "\e[3m", "\e[1m", "\e[7m"
  puts "#{green}#{italic}#{label}:#{clear}#{bold}#{yellow}  #{txt}#{clear}"

  #   clear, green, red, yellow, blue, pink, gray, italic, bold = "\e[0m", "\e[32m", "\e[31m", "\e[33m", "\e[36m", "\e[35m", "\e[164m", "\e[3m", "\e[1m"
  #   puts "#{red}#{txt}#{clear}"
  #   puts "#{green}#{label}:#{clear}  #{green}#{highlight}#{txt}#{clear}"
  #   puts "#{green}#{label}:#{clear}#{highlight}#{green}  #{txt}#{clear}"
  #   puts "#{gray}#{txt}:#{clear}#{yellow} #{txt}#{clear}"
  #   puts "#{red}#{txt}:#{clear}#{yellow} #{txt}#{clear}"
  #   puts "#{red}#{txt} #{clear} aa"
  #   puts "#{green}#{label}:#{clear} #{txt}\naaa"
end
