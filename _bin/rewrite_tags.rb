#!/Users/Carlo/.rbfu/rubies/1.9.3/bin/ruby

Dir["_posts/*.mmd"].each do |file|
  lines = File.readlines(file)

  next if lines.grep(/^tags:/).empty?
  puts file

  output = File.open( file, "w" )

  lines.each_with_index do |line, i|
    line.strip!

    next if line.match(/^tags:\s*(en\s*)?$/)
    unless line.match(/^tags: /)
      output.puts line
      next
    end

    key, *tags = line.split(/[\:\,]\s*/)
    output.puts "tags:"
    tags.each {|tag| output.puts "- #{tag}" unless tag == "en" }
  end

  output.close
end
