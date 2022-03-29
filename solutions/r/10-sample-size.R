library(epiR)

# Worked example 10.2
epi.sscompc(treat=90, control=95, n=NA, sigma=25, power=0.9)

# Worked example 10.3
epi.sscompb(treat=0.35, control=0.20, r=1,  n=NA, power=0.8, conf.level = 0.95)
power.prop.test(p1 = .35, p2 = .20, power=0.8)


# Worked example 10.4
epi.sscohortc(irexp1 = 0.75, irexp0 = 0.50, n = NA, power = 0.90)

# Worked example 10.5
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9)

epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/2)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/3)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/4)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/5)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/6)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/7)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/8)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/9)
epi.sscc(OR=2.0, p0=0.3, n=NA, power=0.9, r=1/10)
