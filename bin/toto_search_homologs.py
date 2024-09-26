#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 23 19:55:20 2024

@author: jrousseau
"""

import sys

def main(path_blastp, path_check, path_tmp, run):

    check = []

    not_in_check = []
    
    with open(path_check, "r") as f:
        for i, line in enumerate(f):       
            
            check.append(line.split()[0])
            

    with open(path_blastp, 'r') as f:
        for i, line in enumerate(f):
            
            if line.split()[0] not in check:
                not_in_check.append(line.split()[0])

    with open(f"{path_tmp}/sequence_{run}.txt", "w") as outfile:
        
        for item in not_in_check:
            outfile.write("{}\n".format(item))

        
if __name__ == '__main__':
    
    path_blastp = sys.argv[1]
    path_check = sys.argv[2]
    path_tmp = sys.argv[3]
    run = sys.argv[4]
    
    main(path_blastp, path_check, path_tmp, run)