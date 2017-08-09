# Prints the contents of a text file from
# the working directory to the console
def print_file_dir(file)
	IO.foreach(Dir.getwd + file) { |line| puts line }
	puts
end
