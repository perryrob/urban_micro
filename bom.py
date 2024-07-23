
import re
import json

bom=[]
summary={}

with open('BOM.txt','r') as f:
    lines = f.readlines()
    for line in lines:
        line = line.strip()
        if 'ECHO' in line:
            line = line[8:]
            line = line[:-2]
            line = re.sub(r'"','',line)
            line = re.sub(r'=,','=',line)
            line = re.sub(r', ,',',',line)
            tokens=line.split(',')
            tokens = [t.strip() for t in tokens]
            item = {}
            for t in tokens:
                try:
                    item[t.split('=')[0]]=t.split('=')[1]
                except Exception as e:
                    print( line )
                    print(t.split('='))
                    raise e
            bom.append(item)


# BOM is now parsed and loaded into, um bom
# Now summarize the BOM
modifier = None
for item in bom:
    try:
        if 'toggle' in item.keys():
            if 'NOT' in item['toggle']:
                modifier = None
            else:
                modifier = item['toggle']
            continue

        name = item['name'][1:-1]
        typ = item['type'][1:-1]
        if typ == 'post':
            name = name+' '+ item['w'] + ' x'+ item['h']
        if typ in ['board','post','tg_board','engineered lumber']:
            length = float(item['length'])
            l=0
            if modifier is not None and 'GLUE' in modifier:
                if length <= 4:
                    l = 4
                elif length <= 8:
                    l = 8
                elif length <= 10:
                    l = 10
                elif length <= 12:
                    l = 12
                elif length <= 14:
                    l = 10
                elif length <= 16:
                    l = 16
                elif length <= 18:
                    l = 18
                elif length <= 20:
                    l = 20
                else:  
                    l = item['length']
            else:
                if length <= 8:
                    l = 8
                elif length <= 10:
                    l = 10
                elif length <= 12:
                    l = 12
                elif length <= 14:
                    l = 10
                elif length <= 16:
                    l = 16
                else:  
                    l = item['length']
            name = name+' x '+ str(l)+'ft.'
        if typ == 'window':
            name = name+' '+ item['w'] + ' x'+ item['h']
        if typ == 'door':
            name = name+' '+ item['w'] + ' x'+ item['h']

        if modifier is not None:
            name = name+' <'+ re.sub(r"'",'',modifier)+'>'


        part = None
        new_part = False

        if name not in summary.keys():
            part = {}
            summary[name] = part
            new_part = True
        else:
            part = summary[name]


        if typ == 'bracket':
            if new_part:
                part['qty'] = int(item['qty'])
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + int(item['qty'])

        elif typ == 'strap':
            if new_part:
                part['qty'] = int(item['qty'])
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + int(item['qty'])

        elif typ == 'jbolt':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + int(item['qty'])

        elif typ == 'metal hanger':
            if new_part:
                part['qty'] = int(item['qty'] )
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + int(item['qty'])


        elif typ == 'board':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']            
            else:
                part['qty'] = part['qty'] + 1

        elif typ == 'engineered lumber':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1

        elif typ == 'tg_board':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1


        elif typ == 'ply':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1

        elif typ == 'post':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1

        elif typ == 'window':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1

        elif typ == 'door':
            if new_part:
                part['qty'] = 1
                part['type'] = item['type']
            else:
                part['qty'] = part['qty'] + 1


        else:
            summary[name]['type'] = item['type']

    except Exception as e:
        print(item)
        raise e

parts = list(summary.keys())
parts.sort()
error=0.15

CSV=True
if CSV:
    print("Item,Type,Quantity,Notes")
    print('Includes a %g error plus up' % error,',,,') 

else:
    print("Item",'\t\t','Type','\t\t','Quantity')
    print('===========================================')
    print('Includes a %g error plus up' % error) 
    print('===========================================')

lumber_only=True


for p in parts:
    if lumber_only:
        if  summary[p]['type'] not in ["'door'","'window'"]:
            if CSV:
                print(p,',',summary[p]['type'],',',summary[p]['qty']+int(summary[p]['qty']*error),',,,' )
            else:
                print(p,'\t',summary[p]['type'],'\t',summary[p]['qty']+int(summary[p]['qty']*error) )
            

        
