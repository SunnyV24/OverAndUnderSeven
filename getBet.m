function [player_bet] = getBet()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
prompt = {'Enter Amount to bet:'};
dlgtitle = 'Bet Amount';
fieldsize = [1 45];
amount_bet = {'$0','hsv'};
player_bet = inputdlg(prompt,dlgtitle,fieldsize,amount_bet);
end