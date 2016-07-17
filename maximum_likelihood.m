%{ ----------  Info  ---------- %}
% @author MehrdadFI <http://m3hrdadfi.com>
% @date 18-Jun-2016
% @title Demonstration of Maximum Likelihood Estimation in Matlab

clc; clear; close all;

%% { ---------- Params ---------- }
THETA = 3.5;
N = 10;
X = THETA + randn(1, N);

% Standard Deviation
SD = 1;

% Range of values of estimation parameter
THETA_RANGE = -4:0.1:12;

% Place holder for likelihoods
LH = zeros(1, length(THETA_RANGE));

%% { ---------- Likelihood Calculation ---------- }
for i = 1:length(THETA_RANGE)
    LH(i)= exp(-sum((X - THETA_RANGE(i)) .^ 2) / (2 * SD ^ 2));
end

[maxLH, idx] = max(LH);
display('Maximum Likelihood of THETA');
display(THETA_RANGE(idx));


figure;
%% { ---------- Plot Dataset ---------- }
subplot(3, 1, 1)
histfit(X)
title('Histogram with a distribution fit')

%% { ---------- Plot Likelihood ---------- }
subplot(3, 1, 2);
plot(THETA_RANGE, LH);
hold on;
stem(THETA_RANGE(idx), LH(idx), 'r');
displayText=['    Likelihood of THETA = ' num2str(THETA_RANGE(idx))];
title('Maximum Likelihood Estimation of unknown Parameter THETA');
xlabel('THETA');
ylabel('Likelihood');
text(THETA_RANGE(idx), LH(idx) / 3, displayText, 'HorizontalAlignment', 'left');


%% { ---------- Plot Log Likelihood ---------- }
subplot(3, 1, 3);
plot(THETA_RANGE,log(LH));
hold on;
YL = ylim;
YMIN = YL(1);
plot([THETA_RANGE(idx) THETA_RANGE(idx)],[YMIN log(LH(idx))] ,'r');
title('Log Likelihood Function');
xlabel('THETA');
ylabel('Log Likelihood');
text([THETA_RANGE(idx)], YMIN / 2, displayText, 'HorizontalAlignment', 'left');
