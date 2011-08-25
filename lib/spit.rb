def Spit txt
  Spit.print txt, caller[0]
end

module Spit
  def self.s txt
    self.print txt, caller[0], :source=>true
  end

  def self.print txt, line, options={}

    txt = txt.inspect rescue txt

    path, number = line.match(/(.+):(\d+)/)[1..2]

    label = IO.readlines(path)[number.to_i - 1] rescue ""
    label = label.strip.sub(/Spit\S+ /, '')

    label = "#{Spit.extract_label(Spit.parse_line line)} #{label}" if options[:source]

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

  def self.parse_line path
    method = path[/`(.+)'/, 1]   # `
    path, l = path.match(/(.+):(\d+)/)[1..2]
    path = File.expand_path path
    clazz = path[/.+\/(.+)\.rb/, 1]
    {:path=>path, :line=>l, :method=>method, :clazz=>clazz}
  end

  def self.extract_label h
    "#{h[:clazz]}.#{h[:method]}(#{h[:line]})"
  end
end
