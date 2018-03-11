#!/usr/bin/python
import sys
from textblob import TextBlob
#import numpy as np
#from threading import Thread

print hipythonworld!
print sys.argv[1]
file1 = sys.argv[1]
loop_count = sys.argv[2]

#with open(str(file1), 'r') as fp:
 #       text = fp.read() 

for x in range (0, int(loop_count)):
	with open(str(file1), 'r') as fp:
		text = fp.read()
	wiki = TextBlob(text)
	#wiki.translate(to='es')
	print(wiki.tags)
        wiki.tags
	fp.close()
