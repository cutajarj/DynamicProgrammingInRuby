def search(full_filepath, filename)
  puts("checking: " + full_filepath)
  if full_filepath.include? filename
    puts("found : " + filename + " in " + full_filepath)
    true
  elsif File.file? full_filepath
    false
  else # is a directory
    for f in Dir.children(full_filepath)
      found = search(File.join(full_filepath, f), filename)
      return true if found
    end
    false
  end
end


search("c:/tools", "gawk.sh")
