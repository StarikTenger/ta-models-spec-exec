import sys, regex

def parse_action(action, n_exec):
	if ooo:
		'''
		Warning! Not suitable for superscal!=2 or N_FU!=2
		'''
		regexs = ({
					'IF': regex.compile(r'_IF \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'ID': regex.compile(r'_ID \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'FU1': regex.compile(r'_FU \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\],\n'),
					'FU2': regex.compile(r'_FU \|-> << ?\[(?:.|\n)*?\],\n.*\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\]'),
					'COM': regex.compile(r'_COM \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'RS1': regex.compile(r'_RS \|-> << ?\{(?:.|\n)*?((?:\[ ?pc \|-> \d+,.*?\])*?(?:.|\n)*?)\},(?:\n| )*?\{'),
					'RS2': regex.compile(r'_RS \|-> << ?\{(?:.|\n)*?(?:\[ ?pc \|-> \d+,.*?\])*(?:.|\n)*?\},(?: |\n)+?\{(?:.|\n)*?((?:\[ ?pc \|-> \d+,.*?\])*?(?:.|\n)*?)\} ?>>')
				},
				{
					'IF': regex.compile(r'_IF2 \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'ID': regex.compile(r'_ID2 \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'FU1': regex.compile(r'_FU2 \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\],\n'),
					'FU2': regex.compile(r'_FU2 \|-> << ?\[(?:.|\n)*?\],\n.*\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\]'),
					'COM': regex.compile(r'_COM2 \|-> << ?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\](?:,(?:\n| )*?\[ ?PC \|->(?: |\n)*?\[ ?pc \|-> (\d+),(?:.|\n)*?\])?? ?>>'),
					'RS1': regex.compile(r'_RS2 \|-> << ?\{(?:.|\n)*?((?:\[ ?pc \|-> \d+,.*?\])*?(?:.|\n)*?)\},(?:\n| )*?\{'),
					'RS2': regex.compile(r'_RS2 \|-> << ?\{(?:.|\n)*?(?:\[ ?pc \|-> \d+,.*?\])*(?:.|\n)*?\},(?: |\n)+?\{(?:.|\n)*?((?:\[ ?pc \|-> \d+,.*?\])*?(?:.|\n)*?)\} ?>>')
				})
	else:
		stages = ('IF', 'ID', 'EX', 'MEM', 'ST', 'WB')
		regexs = [dict(), dict()]
		for s in stages:
			regexs[0][s] = regex.compile(r'_'+s+' \|-> \[ ?PC \|-> \[pc \|-> (\d+),(?:.|\n)*?\]')
		for s in stages:
			regexs[1][s] = regex.compile(r'_'+s+'2 \|-> \[ ?PC \|-> \[pc \|-> (\d+),(?:.|\n)*?\]')
	
	reg_pc = regex.compile(r'\[ ?pc \|-> (\d+)')
	
	pipe_content = {}
	for key, reg in regexs[n_exec].items():
		match = reg.findall(action)
		if match:
			if debug:
				print(key, match)
			if key not in ('RS1', 'RS2'):
				pipe_content[key] = match
			else:
				match2 = reg_pc.findall(match[0])
				if match2:
					if debug:
						print(match2)
					if key not in pipe_content:
						pipe_content[key] = [match2]
					else:
						pipe_content[key].append(match2)
	return pipe_content
	
	
def parse_program(action):
	reg = regex.compile(r'prog \|->(?:.|\n)*?rest \|->(?:.|\n)*?<<((?:.|\n)*?)>>') if ooo or sic else regex.compile(r'progRest \|->(?:.|\n)*?<<((?:.|\n)*?)>>')
	match = reg.findall(action)
	return (match[0], match[0].count('pc'))

	
def parse_sequence(sequence):
	reg = regex.compile(r'\[\n( _TEAction \|-> \[\n *?position \|-> (\d+)(?:.|\n)*?\n\])(?:,|(?:\n>>))')
	return reg.findall(sequence)
	
		
def parse_file(sequences):
	for n_exec in (0,1):
		for action in sequences:
			if debug:
				print(action[1])
			pipe_content = parse_action(action[0], n_exec)
			for i in range(1, N_instr+1):
				stage = ''
				for key, instr in pipe_content.items():
					if str(i) == instr[0] or type(instr[0]) in (tuple, list) and str(i) in instr[0]:
						if stage != '':
							print('Multiple stages!', i, stage, key, action[0])
							exit()
						stage = key
				exec_instr[n_exec][i-1].append(stage)
					
				
def generate_line(instr):
	line = ''
	for i,x in enumerate(instr):
		line += x
		if i < len(instr)-1:
			line += ' & '
		else:
			line += '\\tabularnewline'
	return line
	
	
def generate_exec(n_exec, N_col):
	tab = ''
	for i in range(1, N_instr+1):
		tab += str(i) + ' & '
		for j in range(1, N_col):
			if j < len(exec_instr[n_exec][i-1]):
				tab += exec_instr[n_exec][i-1][j]
			tab += ' & ' if j < N_col-1 else '\\tabularnewline\n'
	return tab
	
		
def generate_tab():
	N_col = max([len(exec_instr[ex][i]) for ex in (0,1) for i in range(N_instr)])
	tab = '\\begin{tabular}{'
	tab += 'c'*N_col
	tab += '}\n & '
	for i in range(1, N_col-1):
		tab += str(i) + ' & '
	tab += str(N_col-1) + '\\tabularnewline\n\midrule\n'
	tab += generate_exec(0, N_col)
	tab += '\midrule\n'
	tab += generate_exec(1, N_col)
	tab += '\\bottomrule\n'
	tab += '\end{tabular}'
	return tab


if len(sys.argv) < 3 or sys.argv[2] not in ('inorder', 'ooo', 'sic'):
	print('Wrong usage: $ python script.py input_file inorder|ooo|sic [debug]')
	exit()
debug = len(sys.argv) >= 4
ooo = sys.argv[2] == 'ooo'
sic = sys.argv[2] == 'sic' 

input_path = sys.argv[1]
with open(input_path) as input_file:
	file_content = input_file.read()
	sequences = parse_sequence(file_content)
	program, N_instr = parse_program(sequences[0][0])
	exec_instr = [[[] for _ in range(N_instr)] for _ in range(2)]
	parse_file(sequences)
	if debug:
		print(exec_instr)
	tab = generate_tab()
	print(program.replace('\n', '\\newline').replace('{', '\{').replace('}', '\}'))
	print('\\newline')
	print(tab)
