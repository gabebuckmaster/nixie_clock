#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 15:32:46 2020

@author: jgb
"""

import numpy as np
import matplotlib.pyplot as plt
#https://www.ti.com/download/trng/docs/seminar/Topic_3_Lynch.pdf

Vin = 12
Vout = 180
Iout = 0.01
Rout = Vout/Iout
Fsw = 200e3
Tsw = 1/Fsw
L = 47e-6

# Assume CCM to find critical inductance
D = 1-(Vin/Vout)
print("Dccm: {}".format(D))
Lmax = 1/2*(Vout-Vin)*(1-D)**2*Tsw/Iout

print("Lmax: {} uH".format(Lmax*1e6))

# Now assuming DCM
K = (2*L)/(Rout*Tsw)



D = np.linspace(0,1)
H0 = (1+np.sqrt(1+4*D**2/K))/2 # appears to be highly linear with D for most if not all DCM

Ipk = D*Tsw*Vin/L
D2 = Ipk*L/((Vout-Vin)*Tsw)
"""
plt.figure()
plt.plot(D, Vin*H0)
plt.ylabel("Output Voltage (V)")
plt.xlabel("D")

plt.figure()
plt.plot(D, Ipk*1e3)
plt.ylabel("Peak Inductor Current (mA)")
plt.xlabel("D")

plt.figure()
plt.plot(D, D+D2)
plt.ylabel("D+D2 (<1.0 for DCM)")
plt.xlabel("D")
"""

# Dynamics!
# Need DC gain of ~100 (40 dB) for ~2V steady state error
# Need PM > 45 degrees or so
# Loop bandwidth 1000 Hz with 0.1uF capacitor for 12.5 V deviation due to load step according to below
# Note: Measured deviation ended up being *much* smaller than predicted. Don't know why...
# https://e2e.ti.com/blogs_/b/powerhouse/archive/2016/11/22/how-to-determine-bandwidth-from-the-transient-response-measurement

def par(a,b):
    return a*b/(a+b)

omega_v = 2*np.pi*np.logspace(np.log10(1), np.log10(1e6), num=10000)

Dnom = np.sqrt(K*(((2*Vout/Vin-1)**2)-1)/4)
print("Ddcm: {}".format(Dnom))


Cout = 100e-9
Zc = 0.01 + 1/(1j*omega_v*Cout)

M = Vout/Vin
G0vd_dcm = 2*Vout/Dnom*(M-1)/(2*M-1)
omega_z = 2*Fsw/Dnom
Rload = 360e3 # small signal load resistance (approximate impedance of feedback network - designed for 0.5mA Idc)
Gvd_dcm_Rload_max = G0vd_dcm*(1-1j*omega_v/omega_z)/(1+((M-1)*Rload)/((2*M-1)*Zc))
Rload = 10e3 # small signal load resistance
Gvd_dcm_Rload_min = G0vd_dcm*(1-1j*omega_v/omega_z)/(1+((M-1)*Rload)/((2*M-1)*Zc))

H0ea = 10**(90/20)
omega_p1 = 2*np.pi*50
omega_p2 = 2*np.pi*1.9e6
omega_p3 = 2*np.pi*1.9e6
Hea = H0ea*1/(1+1j*omega_v/omega_p1)*1/(1+1j*omega_v/omega_p2)*1/(1+1j*omega_v/omega_p3) 


Vref = 2.5
Rtotal = 360e3
Vratio0 = Vref/180
R1 = Vratio0*Rtotal
R2 = Rtotal - R1

print("Voltage Divider R1: {}".format(R1))
print("Voltage Divider R2: {}".format(R2))

lead_gain = 18 # lead compensator for C ~= 100nF (same as output cap)
f_zero = 5
omega_z = 2*np.pi*f_zero # lead compensator

#Hfb = R1/(R1+R2)
#Zs = par(R1,R2)
#Zf = 240e3 #resistive divider only
#Zf = 30e3+1/(1j*omega_v*22e-9) # lead compensator
#omega_p = lead_gain*omega_z # lead compensator
#Hcomp = -Zf*Hea/(Zf+Zs+Zs*Hea)*Hfb #resistive
#Hcomp = -Zf*Hea/(Zf+Zs+Zs*Hea)*Hfb*(1+1j*omega_v/omega_z)/(1+1j*omega_v/omega_p) #lead

Vratio_inf = Vratio0*lead_gain
R2b = R1/Vratio_inf-R1
R2a = R2-R2b

C2a = 1/(R2a*omega_z)

print("Voltage Divider R2a: {}".format(R2a))
print("Voltage Divider R2b: {}".format(R2b))
print("Voltage Divider C2a: {} nF".format(C2a*1e9))




# lead implementation
Hfb = R1/(R1+par(R2a,1/(1j*omega_v*C2a))+R2b)
Rf = 22e3
Cf = 22e-9
Zf = Rf+1/(1j*omega_v*Cf) # lead compensator
Zs = par(R1,par(R2a,1/(1j*omega_v*C2a))+R2b)
Hcomp = -Zf*Hea/(Zf+Zs+Zs*Hea)*Hfb

Hpwm = 1/3*L/(Vin*Tsw)

Hloop_Rload_max = Hcomp*Hpwm*Gvd_dcm_Rload_max
Hloop_Rload_min = Hcomp*Hpwm*Gvd_dcm_Rload_min

print("Error Amplifier Rf (series): {}".format(Rf))
print("Error Amplifier Cf (series): {} nF".format(Cf*1e9))

x = np.argmax(np.abs(Hloop_Rload_max)<1)
print("### Maximum Rload ###")
print("Crossover Frequency: {}".format(omega_v[x]/(2*np.pi)))
print("Phase Margin: {}".format(180/np.pi*np.angle(Hloop_Rload_max[x])))

x = np.argmax(np.abs(Hloop_Rload_min)<1)
print("### Minimum Rload ###")
print("Crossover Frequency: {}".format(omega_v[x]/(2*np.pi)))
print("Phase Margin: {}".format(180/np.pi*np.angle(Hloop_Rload_min[x])))

"""
plt.figure()
plt.semilogx(omega_v/(2*np.pi), 20*np.log10(np.abs(Gvd_dcm)))
plt.ylim((-20,100))
plt.title("Converter Gain")
plt.figure()
plt.semilogx(omega_v/(2*np.pi), 180/np.pi*np.angle(Gvd_dcm))
plt.title("Converter Phase")

"""

plt.figure(figsize=(6,2))
plt.semilogx(omega_v/(2*np.pi), 20*np.log10(np.abs(Hcomp)))
plt.title("Compensation Gain")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Gain (dB)")
plt.figure(figsize=(6,2))
plt.semilogx(omega_v/(2*np.pi), 180/np.pi*np.angle(Hcomp))
plt.title("Compensation Phase")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Phase (deg.)")

plt.figure(figsize=(6,2))
plt.semilogx(omega_v/(2*np.pi), 20*np.log10(np.abs(Hloop_Rload_max)))
plt.semilogx(omega_v/(2*np.pi), 20*np.log10(np.abs(Hloop_Rload_min)))
plt.ylim((-20,100))
plt.title("Open Loop Gain")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Gain (dB)")
plt.figure(figsize=(6,2))
plt.semilogx(omega_v/(2*np.pi), 180/np.pi*np.angle(Hloop_Rload_max))
plt.semilogx(omega_v/(2*np.pi), 180/np.pi*np.angle(Hloop_Rload_min))
plt.semilogx(omega_v/(2*np.pi), 50*np.ones_like(omega_v))
plt.title("Open Loop Phase")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Phase (deg.)")
