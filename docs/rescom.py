rpot = 500

rs1  = 100
rs2  = 200
rs3  = 250
rs4  = 500
rs5  = 750

pts  = 100

def calc_rpar(rmin, rmax, rc):
    rvar = (rmin * rc) / (rmin + rc)
    return 1 - rmax / (rvar + rmax)

for r in range(0, pts):
    knobfact = r / (pts - 1)
    
    rmax = rpot * (1 - knobfact)
    rmin = rpot * knobfact
    
    logfact1 = calc_rpar(rmin, rmax, rs1)
    logfact2 = calc_rpar(rmin, rmax, rs2)
    logfact3 = calc_rpar(rmin, rmax, rs3)
    logfact4 = calc_rpar(rmin, rmax, rs4)
    logfact5 = calc_rpar(rmin, rmax, rs5)
    
    print (r, knobfact, logfact1, logfact2, logfact3, logfact4, logfact5)
