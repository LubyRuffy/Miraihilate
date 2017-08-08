#...
def print_file_dir(file)
	logo = File.open(Dir.getwd + file, 'r');
	logo.each_line do |line|
		puts line
	end
	logo.close
	puts
end
