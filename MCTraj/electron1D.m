function [] = electron1D()
  
F = 1e-30;
delta_t = 0.01;
m  = 9.10938215e-31; 
L = 0;
t = 0;
v = 0;
sumV = 0;

while t < 2
v_prev = v;
v = ((F/m)*delta_t)+v_prev;
delta_L = ((F/m)*((delta_t^2)/2))+(v_prev*delta_t);
L = L + delta_L;

if randi(20) == 1
    v = 0;
end

sumV = sumV + v;
steps = t/delta_t;
driftVelocity = sumV/steps;

figure(1)
subplot(2,2,1:2)
plot(L,0,'o')
ylim([-1 1]);
hold on
xlim([0 L]);
xlabel('Distance Traveled (m)')
title('Position')

subplot(2,2,3:4)
plot([t-delta_t t], [v_prev v], 'b')
hold on
ylim([0 1.2]);
xlim([0 2]);
xlabel('Time (s)')
ylabel('Velocity (m/s)')
str = sprintf('                                                         Velocity      Drift Velocity: %d m/s', driftVelocity);
title(str)

t = t+delta_t;

end

end
