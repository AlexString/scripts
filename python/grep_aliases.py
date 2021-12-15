import re, os, sys

def colored(r, g, b, text):
    return "\033[38;2;{};{};{}m{} \033[38;2;255;255;255m".format(r, g, b, text)

def isPattern(text):
	return re.search(r'#(.*)[{}]', text)

def printContent(text):
	if 'alias' not in text:
		print(line.strip("\n"))
	else:
		print(AliasColor + text[6:].strip("\n"))

if __name__ == "__main__":
	try: # manipulate current directories for executing script
		current_directory = os.getcwd()
		os.chdir(os.path.expanduser("~"))
	except:
		print("Something went wrong while trying to call script. Exception ")
		print(sys.exc_info())
		sys.exit(0)
		
	with open('.bash_aliases','r') as bash_aliases_file:
		TitleColor = [38,230,0]  			# green
		AliasColor = colored(230,230,0,"alias") # yellow
		bracketFlag = False
		new_line = '\n'

		for line in bash_aliases_file:
			if line is new_line:
				continue

			if isPattern(line):
				if '{' in line:
					bracketFlag = True
				elif '}' in line:
					bracketFlag = False
				
				print(colored(TitleColor[0], TitleColor[1], TitleColor[2], 
				line.strip("\n")))
				continue 

			if bracketFlag is True:
				printContent(line)

	# go back to directory
	os.chdir(current_directory)