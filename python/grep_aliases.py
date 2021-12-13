import re, os, sys

def colored(r, g, b, text):
    return "\033[38;2;{};{};{}m{} \033[38;2;255;255;255m".format(r, g, b, text)

if __name__ == "__main__":
	try: # manipulate current directories for executing script
		current_directory = os.getcwd()
		os.chdir(os.path.expanduser("~"))
	except:
		print("Something went wrong while trying to call script. Exception ")
		print(sys.exc_info())
		sys.exit(0)
		
	with open('.bash_aliases','r') as bash_aliases_file:
		alias = colored(230,230,0,"alias")
		flag = False
		for line in bash_aliases_file:
			if line == '\n': # escape empty lines
				continue

			# filter content title/end  { }
			result = re.search(r'#(.*)[{}]', line)
			if result:
				if '{' in line:
					flag = True
				elif '}' in line:
					flag = False
				
				print(colored(38, 230, 0, line.strip("\n")))
				continue 
			# print content
			if flag is True:
				if 'alias' not in line:
					print(line.strip("\n"))
					continue
				print(alias + line[6:].strip("\n"))
	# go back to directory
	os.chdir(current_directory)