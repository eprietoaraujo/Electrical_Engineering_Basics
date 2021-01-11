% Electrical Systems 
% Date: 11/3/2020
% Time domain+phasor representation of voltage, current and power across an impedance

close all
clear all
clc

% Definition of frequency and voltage (magnitude and angle)

omega=2*pi*50
Vrms=230
Vang=0
%% Definition load 1 - Polar
Z=5
Zang=90

%% Defintion load 2 - Rectangular

%  Zreal=0
%  Zimag=5
%  Zcomp=Zreal+i*Zimag
%  Z=abs(Zcomp)
%  Zang=angle(Zcomp)*180/pi

%% Time domain current-voltage

Vph=Vrms*exp(1i*(Vang*pi/180))
Zph=Z*exp(1i*(Zang*pi/180))
Iph=Vph/Zph
Irms=abs(Iph)
Iang=angle(Iph)*180/pi
t=0:0.0001:0.04
v_t=Vrms*sqrt(2)*cos(2*pi*50*t+Vang*pi/180)
i_t=Irms*sqrt(2)*cos(2*pi*50*t+Iang*pi/180)

figure('Position',[000 200 400 400])
title('Time domain Voltage and current')
plot(t,v_t)
hold all
plot(t,i_t)
legend('u(t)','i(t)')
%% Current-Voltage phasor
figure('Position',[400 200 400 400])
title('Phasor representation')
axis([-Vrms*1.2,Vrms*1.2 -Vrms*1.2,Vrms*1.2])
line([0,real(Vph)],[0,imag(Vph)],'Color','r')
hold all
line([0,real(Iph)],[0,imag(Iph)],'Color','g')
circle=Vrms*exp(1i*(2*pi*50*t))
plot(circle,'.','Color','b')
legend('Phasor U','Phasor I')

%% Phasor - S, P and Q
S=Vph*conj(Iph)
figure('Position',[800 200 400 400])
title('Power diagram')
axis([-abs(S)*1.2,abs(S)*1.2,-abs(S)*1.2,abs(S)*1.2])
line([0,real(S)],[0,imag(S)],'Color','r')
hold all
line([0,real(S)],[0,0],'Color','b')
line([0,0],[0,imag(S)],'Color','g')
circle=S*exp(1i*(2*pi*50*t))
plot(circle,'.','Color','b')
legend('S','P','Q')
%% Power - time domain
figure('Position',[1200 200 400 400])
p_t=v_t.*i_t
plot(t,p_t,'Color','c')
hold all
pact_t=Vrms*Irms*cosd(Zang)*(1+cos(2*omega*t))
plot(t,pact_t,'Color','b')
q_t=+Vrms*Irms*sind(Zang)*(sin(2*omega*t))
plot(t,q_t,'Color','g')
title('Time domain Voltage and current')
legend('p(t)','Active power','Reactive power')

%% Combined plot of previous 4 graphs
figure('Position',[200 200 800 800])
subplot(221)
grid on
plot(t,v_t)
hold all
plot(t,i_t)
title('Time domain v(t) and i(t)')
legend('u(t)','i(t)')

subplot(222)
grid on
title('Phasor representation')
axis([-Vrms*1.2,Vrms*1.2 -Vrms*1.2,Vrms*1.2])
line([0,real(Vph)],[0,imag(Vph)],'Color','r')
hold all
line([0,real(Iph)],[0,imag(Iph)],'Color','g')
circle=Vrms*exp(1i*(2*pi*50*t))
plot(circle,'.','Color','b')
legend('Phasor U','Phasor I')

S=Vph*conj(Iph)

subplot(223)
grid on
title('Power diagram')
axis([-abs(S)*1.2,abs(S)*1.2,-abs(S)*1.2,abs(S)*1.2])
line([0,real(S)],[0,imag(S)],'Color','r')
hold all
line([0,real(S)],[0,0],'Color','b')
line([0,0],[0,imag(S)],'Color','g')
circle=S*exp(1i*(2*pi*50*t))
plot(circle,'.','Color','b')
legend('S','P','Q')
%
subplot(224)
grid on
p_t=v_t.*i_t
plot(t,p_t,'Color','c')
hold all
pact_t=Vrms*Irms*cosd(Zang)*(1+cos(2*omega*t))
plot(t,pact_t,'Color','b')
q_t=+Vrms*Irms*sind(Zang)*(sin(2*omega*t))
plot(t,q_t,'Color','g')
legend('p(t)','Active power','Reactive power')
title('Power diagram')

