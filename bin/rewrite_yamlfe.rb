#!/Users/Carlo/.rbfu/rubies/1.9.3/bin/ruby

Dir["/Users/Carlo/Dropbox/Apps/Calepin/2*.md"].each do |file|
  puts file
  lines = File.readlines(file)

  lines.each_with_index do |line, i|
    if line.strip.empty?
      lines.insert( i, "---" )
      lines.insert( i, "layout: post" )
      break
    end

    segments = line.strip.split(": ")
    key = segments.shift.downcase

    if segments.empty?  # "tags: "
      line = key
    else
      val = segments.join(": ")

      if %w( abstract title ).include?(key)
        val = val.gsub( /"/, '\"' )
        line = "#{key}: \"#{val}\""
      else
        line = "#{key}: #{val}"
      end
    end

    lines[i] = line
  end

  lines.map(&:strip!)
  lines.unshift("---")

  output = File.open( "_posts/#{ File.basename(file).gsub( '.md', '.mmd' ) }", "w" )
  output.puts lines.join("\n")
  output.close
end
