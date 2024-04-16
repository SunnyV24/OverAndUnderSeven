clc
clear
close all


% Initialize scene
bet_scene = simpleGameEngine('retro_simple_dice.png',16,16,8);

% Set up variables to name the various sprites
bet_sprite = 10;
over_sprite = 12;
under_sprite = 11;
dice_sprites = 1:6;
ex_sprite = 7;
skull_sprite = 8;
blank_die_sprite = 9;

%initialize other variables
player_money = 100;
gameStart = 0;

%Start game
    beginGame_ans = questdlg(['Welcome to Over 7 and Under 7! ' ...
    'You current have a starting balance of $100. ' ...
    'Would you like to read the instructions or start the game? '], ...
    'Start','Start Game','Instruction','Credits',"Start Game");

    switch beginGame_ans
        case 'Instruction'
            msgbox(["Instruction for Over 7 and Under 7!:";"1." + ...
            "The player is given a initial betting amount of $100.";"2." + ...
            "The down arrow represents a bet under 7; the bet symbol in the" + ...
            " middle represents an exact 7 which quadruple your money earned! " + ...
            "The up arrow represents a bet over 7 (both the up and down will double your winning)"; ...
            "3. Once you bet and see the outcome, you can continuously bet until you have no money"; ...
            "4. The goal of this game is to achieve a total of $1,000.00 dollars. Good luck gambing and remember: " + ...
            "90% of all gamblers stop before they win big!"]);
            pause(15)
        case 'Credits' 
            msgbox(["1. Zheng Dao Huang";"2. Kaleb Matt";"3. Michael Gomer"; "4. Patrick Boesch"]);
            pause(5)
            clc
            clear 
            close all
            SevenandUnder
    end % switch
player_bet = getBet();
bet = str2double(player_bet{1});
while(isnan(bet) || bet > player_money)
    player_bet = getBet();
    bet = str2double(player_bet{1});
end
bet_money = bet;
% Random roll of 2 dice (1 row by 2 columns) ? only allow values up to 6
bet = [under_sprite,bet_sprite,over_sprite];
drawScene(bet_scene,bet);
[r,c,b] = getMouseInput(bet_scene);

roll = randi(6, 1, 2);
%Winning/Losing Conditions
    if(c==1)
        if(sum(roll)<7)
            player_money = player_money + bet_money;
        else
            player_money = player_money - bet_money;
        end
    elseif(c==2)
        if(sum(roll)==7)
            player_money = player_money + (4*bet_money);
        else
            player_money = player_money - bet_money;
        end
    else
        if(sum(roll)>7)
            player_money = player_money + bet_money;
        else
            player_money = player_money - bet_money;
        end
    end
        
    drawScene(bet_scene,roll);
    rst = strcat("You Rolled a total of " + sum(roll));
    text(230,150,rst,VerticalAlignment="bottom",FontSize=16,HorizontalAlignment="right");
    bal =strcat("Current balance is " + sprintf('$%.2f',player_money));
    text(130,-25,bal,VerticalAlignment="top",HorizontalAlignment="center",FontSize=15)

    pause(3)
    if(player_money<=0.1)
        drawScene(bet_scene,[skull_sprite,skull_sprite]);
        opts.Interpreter = 'tex';
        replay_ans = questdlg('Would you like to play again?','Play Again?','Yes','No','Cancel','Yes');
        switch replay_ans
            case 'Yes'
                SevenandUnder
            case 'No'
                clc
                clear
                close all
            case 'Cancel'
                replay_ans = questdlg('Would you like to play again?','Play Again?','Yes','No','Cancel','Yes');
        end
    else
        opts.Interpreter = 'tex';
        reroll_ans = questdlg('Would you like to bet again?','Bet Again?','Yes','No','Yes');
        while(strcmpi(reroll_ans,'Yes'))
            close;
            player_bet = getBet();
            bet = str2double(player_bet{1});

        while(bet>player_money||isnan(bet))
            player_bet = getBet();
            bet = str2double(player_bet{1});
        end
        bet_money = bet;
        % Random roll of 2 dice (1 row by 2 columns) ? only allow values up to 6
        bet = [under_sprite,bet_sprite,over_sprite];
        drawScene(bet_scene,bet);
        [r,c,b] = getMouseInput(bet_scene);

        roll = randi(6, 1, 2);
        %Winning/Losing Conditions
    if(c==1)
        if(sum(roll)<7)
            player_money = player_money + bet_money;
        else
            player_money = player_money - bet_money;
        end
    elseif(c==2)
        if(sum(roll)==7)
            player_money = player_money + (4*bet_money);
        else
            player_money = player_money - bet_money;
        end
    else
        if(sum(roll)>7)
            player_money = player_money + bet_money;
        else
            player_money = player_money - bet_money;
        end
    end
        
    drawScene(bet_scene,roll);
    rst = strcat("You Rolled a total of " + sum(roll));
    text(230,150,rst,VerticalAlignment="bottom",FontSize=16,HorizontalAlignment="right");
    bal =strcat("Current balance is " + sprintf('$%.2f',player_money));
    text(130,-25,bal,VerticalAlignment="top",HorizontalAlignment="center",FontSize=15)
    pause(3)

    if(player_money<=0.1)
        drawScene(bet_scene,[skull_sprite,skull_sprite]);
        opts.Interpreter = 'tex';
        replay_ans = questdlg('Would you like to play again?','Play Again?','Yes','No','Cancel','Yes');
        if(strcmpi(replay_ans,'Yes'))
            SevenandUnder
        else
            clc
            clear
            close all
        end
    elseif(player_money >= 1000)
        msgbox("You achieved $1000 and Won!");
        clc 
        clear 
        close all
    end
    opts.Interpreter = 'tex';
        reroll_ans = questdlg('Would you like to bet again?','Bet Again?','Yes','No','Yes');
        end
        if(strcmpi(reroll_ans,'No'))
            clc
            clear
            close all
        end
    end
    



