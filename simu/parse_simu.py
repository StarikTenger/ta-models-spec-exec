import os, sys, re

if len(sys.argv) != 3:
    sys.exit("Wrong usage (filename main_addr).")
filepath = sys.argv[1]
main_addr = "0x"+sys.argv[2]
if not os.path.isfile(filepath):
    print("File path {} does not exist. Exiting...".format(filepath))
    sys.exit()

BUFF_LEN = 12
N_INSTR = 50
instrs = []
r0_buff = [None]*BUFF_LEN
l_buff = [None]*BUFF_LEN
i_buff = 0
deps = []

with open(filepath) as fp:
    l_start = 0
    for l,line in enumerate(fp):
        split = line.split(':')
        if split[0] != 'system.cpu' or len(split) < 4:
            continue
            
        addr = split[1].strip()
        if addr == main_addr:
            l_start = l
            print("main found:")
            print(line)
        elif l_start == 0:
            continue
        elif l-l_start == N_INSTR:
            break
            
        op_type = split[3].strip()
        instr = [x for x in re.split('[ ,]', split[2].strip()) if x != '']
        if len(instr) > 4:
            sys.exit("error: "+str(len(instr)))
        
        if op_type == 'No_OpClass':
            r0, r1, r2, targA = '', '', '', ''
        else:
            r0 = instr[1] if not re.search("^-?\d+$", instr[1]) else ''
            
            if op_type not in ('MemRead', 'MemWrite', 'FloatMemRead', 'FloatMemWrite'):
                targA = ''
                if len(instr) > 2:
                    r1 = instr[2] if not re.search("^-?\d+$", instr[2]) else ''
                else:
                    r1 = ''
                if len(instr) > 3:
                    r2 = instr[3] if not re.search("^-?\d+$", instr[3]) else ''
                else:
                    r2 = ''
            else:
                r1, r2 = '', ''
                targA = re.search('A=(0x[\da-f]+)', split[4]).group(1)
            
        r0_buff[i_buff] = '' # exclude self-dependencies
        deps += [(l_buff[i], (i_buff-i)%BUFF_LEN) for i, e in enumerate(r0_buff) if e in (r1, r2) and e != '']
        if op_type in ('MemRead', 'MemWrite', 'FloatMemRead', 'FloatMemWrite'):
            r0_buff[i_buff] = r0
        l_buff[i_buff] = l
        i_buff = (i_buff+1)%BUFF_LEN
            
        instrs.append({ 'ind': str(l),
                        'type': '"'+op_type+'"',
                        'r0': '"'+r0+'"',
                        'r1': '"'+r1+'"',
                        'r2': '"'+r2+'"',
                        #'targA': '"'+targA+'"'
                        'addr': '"'+addr+'"'})
    
    f_dep = open(os.path.basename(filepath)+"-deps.txt", "w")
    for e in deps:
        f_dep.write(str(e)+"\n")
    f_dep.close()
        
    f = open(os.path.basename(filepath)+"-input.txt", "w")
    f.write('<<\n')
    for i, instr in enumerate(instrs):
        f.write('[ ind |-> '+instr['ind']+', type |-> '+instr['type']+', r0 |-> '+instr['r0']+', r1 |-> '+instr['r1']+', r2 |-> '+instr['r2']+', addr |-> '+instr['addr'])
        if i < len(instrs)-1:
            f.write(' ],\n')
        else:
            f.write(' ]\n')
    f.write('>>')
    f.close()
