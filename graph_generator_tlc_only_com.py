import sys, re
import networkx as nx
import pickle

TA = False

def parse_graph(content):
    N_instr = 0
    nodes = list()
    line_edges = list()
    nodes_input = re.search(r'nodes (?:\|->|=)(?:.|\n)*<< ?((?:.|\n)+) ?>>', content)
    edges_input = re.search(r'edges (?:\|->|=)(?:.|\n)*\{ ?((?:.|\n)+) ?\}', content)
    
    if nodes_input != None:
        lines = re.findall(r'\[((?:.|\n)+?)\]', nodes_input.group(1))
        N_instr = len(lines)
        line_edges = [[] for i in range(N_instr)]
        
        for i in range(len(lines)):
            reg = re.search(r'IFacq (?:\|->|=) (\d+)', lines[i])
            nodes.append({'IFacq' : reg.group(1)})
            reg = re.search(r'IFrel (?:\|->|=) (\d+)', lines[i])
            nodes[i]['IFrel'] = reg.group(1)
            reg = re.search(r'IDacq (?:\|->|=) (\d+)', lines[i])
            nodes[i]['IDacq'] = reg.group(1)
            reg = re.search(r'IDrel (?:\|->|=) (\d+)', lines[i])
            nodes[i]['IDrel'] = reg.group(1)
            reg = re.search(r'FUacq (?:\|->|=) (\d+)', lines[i])
            nodes[i]['FUacq'] = reg.group(1)
            reg = re.search(r'FUrel (?:\|->|=) (\d+)', lines[i])
            nodes[i]['FUrel'] = reg.group(1)
            reg = re.search(r'COM (?:\|->|=) (\d+)', lines[i])
            nodes[i]['COM'] = reg.group(1)
            reg = re.search(r'ROB (?:\|->|=) (\d+)', lines[i])
            nodes[i]['ROB'] = reg.group(1)
            reg = re.search(r'RS (?:\|->|=) (\d+)', lines[i])
            nodes[i]['RS'] = reg.group(1)
            reg = re.search(r'FU (?:\|->|=) (\d+)', lines[i])
            nodes[i]['FU'] = reg.group(1)
            reg = re.search(r'ind (?:\|->|=) (\d+)', lines[i])
            nodes[i]['ind'] = reg.group(1)
            if any([x == '0' for x in nodes[i].values()]):
                N_instr = i
                break
    
    if edges_input != None:
        edges = re.findall(r'\[(.+?)\]', edges_input.group(1))
        ind_list = [x['ind'] for x in nodes]
        
        for i in range(len(edges)):
            reg = re.search(r'source (?:\|->|=) (\d+)', edges[i])
            if reg.group(1) not in ind_list or ind_list.index(reg.group(1)) >= N_instr: continue
            source = ind_list.index(reg.group(1))
            reg = re.search(r'dest (?:\|->|=) (\d+)', edges[i])
            if reg.group(1) not in ind_list or ind_list.index(reg.group(1)) >= N_instr: continue
            dest = ind_list.index(reg.group(1))
            reg = re.search(r'type (?:\|->|=) "(\w+)"', edges[i])
            _type = reg.group(1)
            line_edges[source].append({'dest' : dest, 'type' : _type})
            
    return (N_instr, nodes, line_edges)
    
def build_graph(N_instr, nodes, edges):
    g = nx.MultiDiGraph()
    
    istr = lambda i : nodes[i]['ind']#chr(ord('A')+i)
    for i in range(N_instr):
        g.add_node(str(i)+'upIF', label='('+istr(i)+',&uarr;IF,'+nodes[i]['IFacq']+')', instr=i, evt='upIF', t=int(nodes[i]['IFacq']), ind=istr(i))
        g.add_node(str(i)+'dwIF', label='('+istr(i)+',&darr;IF,'+nodes[i]['IFrel']+')', instr=i, evt='dwIF', t=int(nodes[i]['IFrel']), ind=istr(i))
        g.add_node(str(i)+'upID', label='('+istr(i)+',&uarr;ID,'+nodes[i]['IDacq']+')', instr=i, evt='upID', t=int(nodes[i]['IDacq']), ind=istr(i))
        g.add_node(str(i)+'dwID', label='('+istr(i)+',&darr;ID,'+nodes[i]['IDrel']+')', instr=i, evt='dwID', t=int(nodes[i]['IDrel']), ind=istr(i))
        g.add_node(str(i)+'upFU', label='('+istr(i)+',&uarr;FU,'+nodes[i]['FUacq']+')', instr=i, evt='upFU', t=int(nodes[i]['FUacq']), ind=istr(i))
        g.add_node(str(i)+'dwFU', label='('+istr(i)+',&darr;FU,'+nodes[i]['FUrel']+')', instr=i, evt='dwFU', t=int(nodes[i]['FUrel']), ind=istr(i))
        g.add_node(str(i)+'COM', label='('+istr(i)+',COM,'+nodes[i]['COM']+')', instr=i, evt='COM', t=int(nodes[i]['COM']), ind=istr(i))
        g.add_node(str(i)+'ROB', label='('+istr(i)+',ROB,'+nodes[i]['ROB']+')', instr=i, evt='ROB', t=int(nodes[i]['ROB']), ind=istr(i), style='invis')
        g.add_node(str(i)+'RS', label='('+istr(i)+',RS,'+nodes[i]['RS']+')', instr=i, evt='RS', t=int(nodes[i]['RS']), ind=istr(i), style='invis')
        
        # Rule 1
        g.add_edge(str(i)+'dwIF', str(i)+'upID', xlabel=' 0 ', t=0, style='bold')
        g.add_edge(str(i)+'upID', str(i)+'dwID', xlabel=' 1 ', t=1, style='bold')
        g.add_edge(str(i)+'dwID', str(i)+'upFU', xlabel=' 0 ', t=0, style='bold')
        g.add_edge(str(i)+'dwFU', str(i)+'COM', xlabel=' 0 ', t=0, style='bold')
        
        # Rule 2
        g.add_edge(str(i)+'upIF', str(i)+'dwIF', xlabel=' '+str(int(nodes[i]['IFrel'])-int(nodes[i]['IFacq']))+' ', t=int(nodes[i]['IFrel'])-int(nodes[i]['IFacq']), style='bold')
        g.add_edge(str(i)+'upFU', str(i)+'dwFU', xlabel=' '+str(int(nodes[i]['FUrel'])-int(nodes[i]['FUacq']))+' ', t=int(nodes[i]['FUrel'])-int(nodes[i]['FUacq']), style='bold')
        
        # Rule 3
        if i > 0:
            g.add_edge(str(i-1)+'upIF', str(i)+'upIF', xlabel=' 0 ', t=0)
            g.add_edge(str(i-1)+'upID', str(i)+'upID', xlabel=' 0 ', t=0)
            g.add_edge(str(i-1)+'COM', str(i)+'COM', xlabel=' 0 ', t=0)
        
        # Rule 4
        for e in edges[i]:
            if e['dest'] < N_instr and e['type'] == 'D':
                g.add_edge(str(i)+'dwFU', str(e['dest'])+'upFU', xlabel=' 0 ', t=0, color='red', fontcolor='red')
                
        # Rule 5
        for j in [k for k in range(N_instr) if k!=i]:
            # a)
            if nodes[j]['FU'] == nodes[i]['FU'] and g.nodes[str(i)+'dwID']['t'] < int(nodes[j]['FUrel']) and int(nodes[j]['FUrel']) <= g.nodes[str(i)+'upFU']['t']:
                g.add_edge(str(j)+'dwFU', str(i)+'upFU', xlabel=' 0 ', t=0, color='blue', fontcolor='blue')
                
            # c)
            if g.nodes[str(i)+'upID']['t'] < g.nodes[str(i)+'ROB']['t'] and int(nodes[j]['COM']) == g.nodes[str(i)+'ROB']['t'] - 1:
                g.add_edge(str(j)+'COM', str(i)+'dwID', xlabel=' 1 ', t=1, color='green', fontcolor='green')
            if g.nodes[str(i)+'upID']['t'] < g.nodes[str(i)+'RS']['t'] and nodes[j]['FU'] == nodes[i]['FU'] and int(nodes[j]['FU']) == g.nodes[str(i)+'RS']['t']:
                g.add_edge(str(j)+'dwFU', str(i)+'dwID', xlabel=' 0 ', t=0, color='green', fontcolor='green')
        # (c)
        if i < N_instr-1 and (g.nodes[str(i)+'upID']['t'] < g.nodes[str(i)+'ROB']['t'] or g.nodes[str(i)+'upID']['t'] < g.nodes[str(i)+'RS']['t']):
            g.add_edge(str(i)+'dwID', str(i+1)+'upID', xlabel=' 0 ', t=0, color='green', fontcolor='green')
        
        # b)
        if i > 0:
            if g.nodes[str(i)+'upIF']['t'] == g.nodes[str(i-1)+'dwIF']['t']:
                g.add_edge(str(i-1)+'dwIF', str(i)+'upIF', xlabel=' 0 ', t=0, color='green', fontcolor='green')
            if g.nodes[str(i)+'dwFU']['t'] <= g.nodes[str(i-1)+'COM']['t'] and g.nodes[str(i-1)+'COM']['t'] < g.nodes[str(i)+'COM']['t']:
                g.add_edge(str(i-1)+'COM', str(i)+'COM', xlabel=' 1 ', t=1, color='green', fontcolor='green')
    
    instants = set([g.nodes[n]['t'] for n in g.nodes])
    prev_t = -1
    prev_inst = -1
    newline = False
    newlines = 0
    for i in range(N_instr):
        for s in ('upIF', 'dwIF', 'upID', 'dwID', 'upFU', 'dwFU', 'COM'): # ROB/RS invisible style
            n = str(i)+s
            inst = g.nodes[n]['instr']
            t = g.nodes[n]['t']
            if inst != prev_inst and newline:
                newlines += 1
                newline = False
                
            if t == prev_t:
                ypos = inst+newlines+1
                newline = True
            else:
                ypos = inst+newlines
            
            col = len([tt for tt in instants if tt <= t])
            g.nodes[n]['pos'] = str(2.1*col)+",-"+str(0.9*ypos)+"!"
            prev_t = t
            prev_inst = inst
        
    return g


def explore(g_cause, N_instr, g_other):
    label = lambda n : str(g_cause.nodes[n]['ind'])+g_cause.nodes[n]['evt']
        
    def has_TA(path, corrAcq, corrRel): # returns whether there is a variation in the beginning of path in g_cause wrt. g_other and whether this variation entails a TA
        acq, rel = path[-1], path[-2]
        t_acq_cause = g_cause.nodes[acq]['t']
        t_rel_cause = g_cause.nodes[rel]['t']
        t_acq_other = g_other.nodes[corrAcq]['t']
        t_rel_other = g_other.nodes[corrRel]['t']
        delta_cause = t_rel_cause - t_acq_cause
        delta_other = t_rel_other - t_acq_other
        
        variation = (delta_cause != delta_other)
        TA = False
        if variation:
            for x in (acq,rel):
                g_cause.nodes[x]['style'] = 'filled'
                g_cause.nodes[x]['fillcolor'] = 'gray'
            for x in (corrAcq,corrRel):
                g_other.nodes[x]['style'] = 'filled'
                g_other.nodes[x]['fillcolor'] = 'gray'
            if delta_cause < delta_other:
                print('\t*Favorable variation: ('+label(acq)+', '+label(rel)+') ('+str(delta_cause)+'<'+str(delta_other)+')')
                for i,x in enumerate(path[:-2]):
                    instr = g_cause.nodes[x]['instr']
                    corrGlob = x if x in g_other.nodes else str(instr)+'upFU'
                    Delta_cause = g_cause.nodes[x]['t'] - t_rel_cause
                    Delta_other = g_other.nodes[corrGlob]['t'] - t_rel_other
                    
                    if Delta_cause > Delta_other:
                        Delta_cause_table_repr = str(Delta_cause)
                        Delta_other_table_repr = str(Delta_other)
                        print('\t**TA: ('+label(acq)+', '+label(rel)+')->'+label(x)+' ('+Delta_cause_table_repr+'>'+Delta_other_table_repr+')')
                        g_cause.nodes[x]['style'] = 'filled'
                        g_cause.nodes[x]['fillcolor'] = '#FC8D59'
                        if g_cause.nodes[x]['evt'] == 'COM': TA = True
                    elif 'style' not in g_cause.nodes[x] or g_cause.nodes[x]['style'] != 'filled':
                        g_cause.nodes[x]['style'] = 'filled'
                        g_cause.nodes[x]['fillcolor'] = '#FDCC8A'
                        
        return variation, TA
        
    def get_paths(path): # Recursively finds causal paths
        global TA
        n = path[-1]
        #print([label(x) for x in path])
        
        for nn in g_cause.predecessors(n): # roll up
            res_usage = g_cause.nodes[nn]['evt'] in ('upIF', 'upFU') and g_cause.nodes[n]['evt'] in ('dwIF', 'dwFU')
            res_switch = res_usage and (nn not in g_other.nodes or n not in g_other.nodes) #TODO: use nodes[x]['FU'] instead
            if res_switch:
                print('\t**Ressource switch: '+label(nn))
                '''if not path_from(g_other, nn, path[0]):
                    print('*WARNING*: '+label(nn)+' maybe should not break causality (->'+label(path[0])+').')'''
                corrAcq = str(g_cause.nodes[nn]['instr'])+'upFU'
                corrRel = str(g_cause.nodes[nn]['instr'])+'dwFU'
            else:
                corrAcq = nn
                corrRel = n
            
            break_path = list()
            for i in range(len(g_cause[nn][n])):
                timing_indep = (g_cause.nodes[nn]['t'] + g_cause[nn][n][i]['t'] != g_cause.nodes[n]['t'])
                if not timing_indep and res_usage:
                    variation, isTA = has_TA(path+[nn], corrAcq, corrRel)
                else:
                    variation, isTA = False, False
                break_path.append(timing_indep or variation or res_switch)
                if break_path[i]:
                    g_cause[nn][n][i]['style'] = 'dashed'
                    
                if isTA: TA = True
                
            if all(break_path):
                #print('Causality is broken: '+label(nn))
                if nn not in get_paths.breakpoints: #+com_nodes
                    get_paths.breakpoints.append(nn)
                    get_paths([nn])
                else:
                    #print('(Already explored)')
                    continue
            else:
                path.append(nn)
                get_paths(path)
                path.remove(nn)
    
    get_paths.breakpoints = list()
    #for n in com_nodes:
    #    print('Ref: '+label(n))
    if N_instr > 0:
        path = [str(N_instr-1)+'COM']
        get_paths(path)
        
    
if len(sys.argv) < 5:
    print('Wrong usage')
    exit()

graph1 = sys.argv[1]
graph2 = sys.argv[2]
output_prefix = sys.argv[3]
currCycle = sys.argv[4]

file_path = output_prefix+'.txt'
#sys.stdout = open(file_path, "a")
print('**** '+currCycle+' ****')

N_instr1, nodes1, edges1 = parse_graph(graph1)
N_instr2, nodes2, edges2 = parse_graph(graph2)
N = min(N_instr1, N_instr2)
g1 = build_graph(N, nodes1, edges1)
g2 = build_graph(N, nodes2, edges2)

print('Exec1')
explore(g1, N, g2)
print('\nExec2')
explore(g2, N, g1)
print('')

if TA:
    '''a1, a2 = nx.nx_agraph.to_agraph(g1), nx.nx_agraph.to_agraph(g2)
    a1.graph_attr.update(splines='ortho')
    a1.node_attr.update(width=1, fontsize=20.0, shape='box')
    a1.edge_attr.update(fontsize=20.0)
    a2.graph_attr.update(splines='ortho')
    a2.node_attr.update(width=1, fontsize=20.0, shape='box')
    a2.edge_attr.update(fontsize=20.0)
    
    a1.draw(output_prefix+'-ex1.png', prog='neato', format='png')
    a2.draw(output_prefix+'-ex2.png', prog='neato', format='png')'''  
    exit(1)
else:
    exit(0)

'''f = open(output_prefix+'-edges.pkl', "w")
pickle.dump(g1.edges.data(), f)
pickle.dump(g2.edges.data(), f)
f.close()'''

