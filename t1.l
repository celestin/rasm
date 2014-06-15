     1 00000000 01                      mem db 1
     2 00000001 00D8                    add al, bl
     3 00000003 001E[0000]              add [mem], bl
     4 00000007 021E[0000]              add bl, [mem]
     5                                  
     6 0000000B 06                      push es
