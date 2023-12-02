
clear all
close all
%% The constant variables

% The screen
[win,screenRect] = Screen('OpenWindow',0,[],[0 0 960 800]);

% For grids
pictSize = 300;
gridSize = 2;
displaySize = gridSize*pictSize;
gridCntr = displaySize/2;

% Displaying in screen center
screenCntrX = screenRect(3)/2;
screenCntrY = screenRect(4)/2;

% first instruction
DrawFormattedText(win,'Welcome!\n You can learn and practice in English here!\n Press any key to start.','center', 'center'); %showing first instruction at center
Screen('flip',win);

[keyTime,keyCode] = KbStrokeWait;
keyPressed = KbName(keyCode);


%% 1) Creating the main menu screen
mainPage = true;
while mainPage
    rectCount = 0;
    
    % creating grids
    for x = 1:pictSize:displaySize
        for y = 1:pictSize:displaySize
            rectCount = rectCount+1;
            myPict(rectCount,:) = [x y x+pictSize/2 y+pictSize/2];
        end
    end
    
    myPict(:,[1 3]) = myPict(:,[1 3])+screenCntrX-gridCntr+pictSize/4;
    myPict(:,[2 4]) = myPict(:,[2 4])+screenCntrY-gridCntr+pictSize/4;
    
    TotalNumberPict = rectCount;
    
    menuList = ["AlphabetChart.jpg", "singer.jpg", "words.jpg", "test_yourself.jpg"]; %images for the main menu
    
    % fill in the grids with pictures
    for k = 1:TotalNumberPict
        myimage = imread(menuList(k));
        tex = Screen('MakeTexture',win,myimage);
        Screen('DrawTexture',win,tex,[],myPict(k,:));
    end
    
    myimage = imread('close_button.jpg');
    tex = Screen('MakeTexture',win,myimage);
    Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
    Screen('flip',win);
    pause(0.5)
    
    [mouseX,mouseY,button] = GetMouse(win);
    
    %% 2) Fill in the sections
    while true
        % wait for the release
        while any(button)
            [~,~,button] = GetMouse(win);
        end
        [mouseX,mouseY,button] = GetMouse(win);
        
        %% First grid: playing letters with sound and images
        if button(1) == 1
            
            if mouseX>myPict(1,1) && mouseX<myPict(1,3) && mouseY>myPict(1,2) && mouseY<myPict(1,4)
                
                Screen('flip',win);
                
                letterImages = ["a.JPG","b.JPG","c.JPG","d.JPG","e.JPG","f.JPG","g.JPG","h.JPG","ı.JPG","j.JPG","k.JPG","l.JPG","m.JPG","n.JPG","o.JPG","p.JPG","q.JPG","r.JPG","s.JPG","t.JPG","u.JPG","v.JPG","w.JPG","x.JPG","y.JPG","z.JPG"];
                letterSounds = ["A.wav","B.wav","C.wav","D.wav","E.wav","F.wav","G.wav","H.wav","I.wav","J.wav","K.wav","L.wav","M.wav","N.wav","O.wav","P.wav","Q.wav","R.wav","S.wav","T.wav","U.wav","V.wav","W.wav","X.wav","Y.wav","Z.wav"];
                
                for k = 1:length(letterSounds)
                    
                    [mouseX1,mouseY1,~] = GetMouse(win); % to exit from first grid 
                    if mouseX1>(screenRect(1)+900) && mouseX1<(screenRect(3)-10) && mouseY1>(screenRect(2)+10) && mouseY1<(screenRect(4)-740)
                        break
                    end
                    
                    myimage = imread(letterImages(k));
                    tex = Screen('MakeTexture',win,myimage);
                    Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                    myimage1 = imread('close_button.jpg');
                    tex = Screen('MakeTexture',win,myimage1);
                    Screen('DrawTexture',win,tex,[],[screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                    Screen('flip',win);
                    
                    [y,fs] = audioread(letterSounds(k));
                    sound(y,fs)
                    pause(1.1)
                    
                end
                break
                
                %%  Second grid: playing alphabet song video
            elseif mouseX>myPict(2,1) && mouseX<myPict(2,3) && mouseY>myPict(2,2) && mouseY<myPict(2,4)
                
                myimage = imread('singer2.JPG');
                tex = Screen('MakeTexture',win,myimage);
                Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                
                DrawFormattedText(win,'Please press ESC to exit!', screenCntrX*5/7+3, screenCntrY+250);
                Screen('flip',win);
                
                [y,fs] = audioread('alphabetSong.wav');
                sound(y,fs)
                
                singing_page = true;
                while singing_page
                    [keyTime,keyCode] = KbStrokeWait;
                    keyPressed = KbName(keyCode);
                    
                    if strcmp(keyPressed, 'esc')% to exit from second grid 
                        clear sound
                        singing_page = false;
                    end
                end
                break
                
                %% Third grid: showing words with images and sound 
            elseif mouseX>myPict(3,1) && mouseX<myPict(3,3) && mouseY>myPict(3,2) && mouseY<myPict(3,4)
                Screen('flip',win);
                
                WordsImages = ["ant.jpg","axe.jpg","banana.jpg","bat.jpg","belt.jpg","brush.jpg","canary.jpg","cape.jpg","cat.jpg","cherry.jpg","dog.jpg","dress.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg","goose.jpg","hat.jpg","jacket.jpg","kiwi.jpg","koala.jpg","ladder.jpg","lemon.jpg","lion.jpg","mole.jpg","peach.jpg","pencil.jpg","penguin.jpg","pig.jpg","pumpkin.jpg","rabbit.jpg","sheep.jpg","shirt.jpg","skunk.jpg","swan.jpg","tiger.jpg","tomato.jpg","zebra.jpg"];
                WordsSounds = ["ant.wav","axe.wav","banana.wav","bat.wav","belt.wav","brush.wav","canary.wav","cape.wav","cat.wav","cherry.wav","dog.wav","dress.wav","duck.wav","eagle.wav","fox.wav","goat.wav","goose.wav","hat.wav","jacket.wav","kiwi.wav","koala.wav","ladder.wav","lemon.wav","lion.wav","mole.wav","peach.wav","pencil.wav","penguin.wav","pig.wav","pumpkin.wav","rabbit.wav","sheep.wav","shirt.wav","skunk.wav","swan.wav","tiger.wav","tomato.wav","zebra.wav"];
                
                for k = 1:length(WordsSounds)
                    
                    [mouseX1,mouseY1,~] = GetMouse(win); % to exit third grid
                    if mouseX1>(screenRect(1)+900) && mouseX1<(screenRect(3)-10) && mouseY1>(screenRect(2)+10) && mouseY1<(screenRect(4)-740)
                        break
                    end
                    
                    myimage = imread(WordsImages(k));
                    tex = Screen('MakeTexture',win,myimage);
                    Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                    myimage1 = imread('close_button.jpg');
                    tex = Screen('MakeTexture',win,myimage1);
                    Screen('DrawTexture',win,tex,[],[screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                    Screen('flip',win);
                    
                    [y,fs] = audioread(WordsSounds(k));
                    sound(y,fs)
                    pause(1.8)
                end
                break
                
                %% Fourth grid: test yourself part
            elseif mouseX>myPict(4,1) && mouseX<myPict(4,3) && mouseY>myPict(4,2) && mouseY<myPict(4,4)
                
                main_page_4 = true;
                while main_page_4
                    Screen('flip',win);
                    
                    %% Creating sub-menu for 4 different tasks
                    rectCount1 = 0;
                    % creating grids
                    for x = 1:pictSize:displaySize
                        for y = 1:pictSize:displaySize
                            rectCount1 = rectCount1+1;
                            myPict(rectCount1,:) = [x y x+pictSize/2 y+pictSize/2];
                        end
                    end
                    
                    myPict(:,[1 3]) = myPict(:,[1 3])+screenCntrX-gridCntr+pictSize/4;
                    myPict(:,[2 4]) = myPict(:,[2 4])+screenCntrY-gridCntr+pictSize/4;
                    
                    submenuList = ["matching.jpg", "image_blackboard.jpg", "matching_2.jpg", "speaker_blackboard.jpg"]; % imegas for sub-menu
                    
                    % fill in the grids with pictures
                    for k = 1:TotalNumberPict
                        myimage = imread(submenuList(k));
                        tex = Screen('MakeTexture',win,myimage);
                        Screen('DrawTexture',win,tex,[],myPict(k,:));
                    end
                    
                    myimage = imread('close_button.jpg'); % exit button from sub-menu to return main menu
                    tex = Screen('MakeTexture',win,myimage);
                    Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                    Screen('flip',win);
                    
                    % wait for the release
                    while any(button)
                        [~,~,button] = GetMouse(win);
                    end
                    
                    %% Fill in the sub-sections
                    while true
                        [mouseX,mouseY,button] = GetMouse(win);
                        
                        %% First sub-grid: matching the picture of a word with the name form of that word
                        if button(1) == 1
                            
                            if mouseX>myPict(1,1) && mouseX<myPict(1,3) && mouseY>myPict(1,2) && mouseY<myPict(1,4)
                                
                                DrawFormattedText(win,'Welcome to the first exercise!\n Two images will be displayed, pay attention!\n Press any key to start.','center', 'center'); %showing first instruction at center
                                Screen('flip',win);
                                
                                [secs,keyCode] = KbStrokeWait;% keyboard input/any key
                                anyKey = KbName(keyCode);
                                
                                WordsImages = ["ant.jpg","axe.jpg","banana.jpg","bat.jpg","belt.jpg","brush.jpg","canary.jpg","cape.jpg","cat.jpg","cherry.jpg","dog.jpg","dress.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg","goose.jpg","hat.jpg","jacket.jpg","kiwi.jpg","koala.jpg","ladder.jpg","lemon.jpg","lion.jpg","mole.jpg","peach.jpg","pencil.jpg","penguin.jpg","pig.jpg","pumpkin.jpg","rabbit.jpg","sheep.jpg","shirt.jpg","skunk.jpg","swan.jpg","tiger.jpg","tomato.jpg","zebra.jpg"];
                                nameList = ["ant_n.JPG","axe_n.JPG","banana_n.JPG","bat_n.JPG","belt_n.JPG","brush_n.JPG","canary_n.JPG","cape_n.JPG","cat_n.JPG","cherry_n.JPG","dog_n.JPG","dress_n.JPG","duck_n.JPG","eagle_n.JPG","fox_n.JPG","goat_n.JPG","goose_n.JPG","hat_n.JPG","jacket_n.JPG","kiwi_n.JPG","koala_n.JPG","ladder_n.JPG","lemon_n.JPG","lion_n.JPG","mole_n.JPG","peach_n.JPG","pencil_n.JPG","penguin_n.JPG","pig_n.JPG","pumpkin_n.JPG","rabbit_n.JPG","sheep_n.JPG","shirt_n.JPG","skunk_n.JPG","swan_n.JPG","tiger_n.JPG","tomato_n.JPG","zebra_n.JPG"];
                                
                                rectCount2 = 0;
                                % creating grids
                                for x = 1:pictSize:displaySize
                                    for y = 1:pictSize:displaySize
                                        rectCount2 = rectCount2 + 1;
                                        myPict(rectCount2,:) = [x y x+pictSize/2 y+pictSize/2];
                                    end
                                end
                                
                                myPict(:,[1 3]) = myPict(:,[1 3])+screenCntrX-gridCntr+pictSize/4;
                                myPict(:,[2 4]) = myPict(:,[2 4])+screenCntrY-gridCntr+pictSize/4;
                                
                                n_trial = 0;
                                sub_grid_1 = true;
                                
                                while and(n_trial < 6, sub_grid_1)
                                    
                                    List1  = Shuffle(WordsImages); % the first two elements of this array will used as targets
                                    
                                    for ii = 1:2 % to show targets on the screen center one by one
                                        myimage = imread(List1(ii));
                                        tex = Screen('MakeTexture',win,myimage);
                                        Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                                        Screen('flip',win);
                                        pause(0.5)
                                    end
                                    
                                    DrawFormattedText(win,'Click on the name of the images displayed.\n Press any key to start!','center', 'center'); %showing second instruction at center
                                    Screen('flip',win);
                                    
                                    [secs,keyCode] = KbStrokeWait;% keyboard input/any key
                                    anyKey = KbName(keyCode);
                                    
                                    idx = []; % encoding indexes
                                    for ii = 1:4
                                        index = find(WordsImages == List1(ii));
                                        idx = [idx index];
                                    end
                                    
                                    List2 = Shuffle(nameList(idx)); % Shuffle the first four items of List 1 to have a random order when displaying them in the grids
                                    
                                    % wait for the release
                                    while any(button)
                                        [~,~,button] = GetMouse(win);
                                    end
                                    
                                    for k = 1:TotalNumberPict % fill in the grids
                                        myimage = imread(List2(k));
                                        tex = Screen('MakeTexture',win,myimage);
                                        Screen('DrawTexture',win,tex,[],myPict(k,:));
                                    end
                                    tmpPict = myPict;
                                    myimage = imread('close_button.jpg');
                                    tex = Screen('MakeTexture',win,myimage);
                                    Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                                    Screen('flip',win);
                                    
                                    correctA = 0;
                                    clicks = 0;
                                    while and(correctA ~= 2, clicks ~= 4)
                                        
                                        [mouseX,mouseY,button] = GetMouse(win);
                                        
                                        for tt = 1:TotalNumberPict
                                            
                                            oneRect = tmpPict(tt,:);
                                            
                                            if button(1)&& mouseX>oneRect(1) && mouseX<oneRect(3) && mouseY>oneRect(2) && mouseY<oneRect(4)
                                                clicks = clicks + 1;
                                                
                                                for a = 1:2 % response control
                                                    if find(WordsImages == List1(a)) == find(nameList == List2(tt))
                                                        correctA = correctA + 1;
                                                    end
                                                end
                                                
                                                tmpPict(tt,:) = 0;
                                            end
                                            Image = imread(List2(tt)); % refreshing the screen
                                            tex = Screen('MakeTexture',win,Image);
                                            Screen('DrawTexture',win,tex,[], tmpPict(tt,:));
                                            myimage = imread('close_button.jpg');
                                            tex = Screen('MakeTexture',win,myimage);
                                            Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                                        end
                                        Screen('flip',win);
                                        
                                        % exit button from this sub-grid
                                        if button(1)&& mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                                            break
                                        end
                                    end
                                    
                                    % used again to break the second while
                                    if button(1)&& mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                                        sub_grid_1 = false;
                                    else
                                        n_trial = n_trial + 1;
                                        
                                        accuracy = round((correctA / clicks)*100); % accuracy calculation
                                        if accuracy == 100
                                            [y,fs] = audioread('correct_answer.wav'); % feedback for full answer
                                            sound(y,fs);
                                        end
                                        feed_text =['Your accuracy on this trial is: ' num2str(accuracy) '%']; % accuracy feedback
                                        DrawFormattedText(win, feed_text,'center','center');
                                        Screen(win,'Flip');
                                        pause(2)
                                    end
                                end
                                break
                                %% Second sub-grid: matching the name form of a word to the sound of that word
                            elseif mouseX>myPict(3,1) && mouseX<myPict(3,3) && mouseY>myPict(3,2) && mouseY<myPict(3,4)
                                
                                DrawFormattedText(win,'Welcome to the second exercise!\n Two sounds will be played, pay attention!\n Press any key to start.','center', 'center'); %showing first instruction at center
                                Screen('flip',win);
                                
                                [secs,keyCode] = KbStrokeWait;% keyboard input/any key
                                anyKey = KbName(keyCode);
                                
                                WordsSounds = ["ant.wav","axe.wav","banana.wav","bat.wav","belt.wav","brush.wav","canary.wav","cape.wav","cat.wav","cherry.wav","dog.wav","dress.wav","duck.wav","eagle.wav","fox.wav","goat.wav","goose.wav","hat.wav","jacket.wav","kiwi.wav","koala.wav","ladder.wav","lemon.wav","lion.wav","mole.wav","peach.wav","pencil.wav","penguin.wav","pig.wav","pumpkin.wav","rabbit.wav","sheep.wav","shirt.wav","skunk.wav","swan.wav","tiger.wav","tomato.wav","zebra.wav"];
                                nameList = ["ant_n.JPG","axe_n.JPG","banana_n.JPG","bat_n.JPG","belt_n.JPG","brush_n.JPG","canary_n.JPG","cape_n.JPG","cat_n.JPG","cherry_n.JPG","dog_n.JPG","dress_n.JPG","duck_n.JPG","eagle_n.JPG","fox_n.JPG","goat_n.JPG","goose_n.JPG","hat_n.JPG","jacket_n.JPG","kiwi_n.JPG","koala_n.JPG","ladder_n.JPG","lemon_n.JPG","lion_n.JPG","mole_n.JPG","peach_n.JPG","pencil_n.JPG","penguin_n.JPG","pig_n.JPG","pumpkin_n.JPG","rabbit_n.JPG","sheep_n.JPG","shirt_n.JPG","skunk_n.JPG","swan_n.JPG","tiger_n.JPG","tomato_n.JPG","zebra_n.JPG"];
                                
                                rectCount3 = 0;
                                % creating grids
                                for x = 1:pictSize:displaySize
                                    for y = 1:pictSize:displaySize
                                        rectCount3 = rectCount3 + 1;
                                        myPict(rectCount3,:) = [x y x+pictSize/2 y+pictSize/2];
                                    end
                                end
                                
                                myPict(:,[1 3]) = myPict(:,[1 3])+screenCntrX-gridCntr+pictSize/4;
                                myPict(:,[2 4]) = myPict(:,[2 4])+screenCntrY-gridCntr+pictSize/4;
                                
                                n_trial_1 = 0;
                                sub_grid_2 = true;
                                while and(n_trial_1 < 6, sub_grid_2)
                                    
                                    List3 = Shuffle(WordsSounds); % the first two elements of this array will used as targets
                                    
                                    for ii = 1:2 % to show targets on the screen center one by one
                                        myimage = imread('sound_image.jpg');
                                        tex = Screen('MakeTexture',win,myimage);
                                        Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                                        Screen('flip',win);
                                        
                                        [y,fs] = audioread(List3(ii));
                                        sound(y,fs)
                                        pause(2)
                                        Screen('flip',win);
                                        pause(0.3)
                                    end
                                    
                                    DrawFormattedText(win,'Click on the name of the sound played.\n Press any key to start!','center', 'center'); %showing instruction at center
                                    Screen('flip',win);
                                    
                                    [secs,keyCode]=KbStrokeWait;% keyboard input/any key
                                    anyKey=KbName(keyCode);
                                    
                                    idx1 = []; % encoding indexes
                                    for tt = 1:4
                                        index1 = find(WordsSounds == List3(tt));
                                        idx1 = [idx1 index1];
                                    end
                                    
                                    List4 = Shuffle(nameList(idx1)); % Shuffle the first four items of List 3 to have a random order when displaying them in the grids
                                    
                                    % wait for the release
                                    while any(button)
                                        [~,~,button] = GetMouse(win);
                                    end
                                    
                                    for k = 1:TotalNumberPict % fill in the grids
                                        myimage = imread(List4(k));
                                        tex = Screen('MakeTexture',win,myimage);
                                        Screen('DrawTexture',win,tex,[],myPict(k,:));
                                    end
                                    tmpPict1 = myPict;
                                    myimage = imread('close_button.jpg');
                                    tex = Screen('MakeTexture',win,myimage);
                                    Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                                    Screen('flip',win);
                                    
                                    correctA1 = 0;
                                    clicks1 = 0;
                                    while and(correctA1 ~= 2, clicks1 ~= 4)
                                        
                                        [mouseX,mouseY,button] = GetMouse(win);
                                        
                                        for tt = 1:TotalNumberPict
                                            
                                            oneRect = tmpPict1(tt,:);
                                            if button(1)&& mouseX>oneRect(1) && mouseX<oneRect(3) && mouseY>oneRect(2) && mouseY<oneRect(4)
                                                clicks1 = clicks1 + 1;
                                                
                                                for a = 1:2 % response control
                                                    if find(WordsSounds == List3(a)) == find(nameList == List4(tt))
                                                        correctA1 = correctA1 + 1;
                                                    end
                                                end
                                                
                                                tmpPict1(tt,:) = 0;
                                            end
                                            Image = imread(List4(tt)); % refreshing the screen
                                            tex = Screen('MakeTexture',win,Image);
                                            Screen('DrawTexture',win,tex,[], tmpPict1(tt,:));
                                            myimage = imread('close_button.jpg');
                                            tex = Screen('MakeTexture',win,myimage);
                                            Screen('DrawTexture',win,tex,[],[ screenRect(1)+900 screenRect(2)+10 screenRect(3)-10 screenRect(4)-740]);
                                        end
                                        Screen('flip',win);
                                        if button(1)&& mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                                            break
                                        end
                                    end
                                    
                                    if button(1)&& mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                                        sub_grid_2 = false;
                                    else
                                        n_trial_1 = n_trial_1 + 1;
                                        
                                        accuracy = round((correctA1 / clicks1)*100); % accuracy calculation
                                        if accuracy == 100
                                            [y,fs] = audioread('correct_answer.wav');% feedback for full answer
                                            sound(y,fs);
                                        end
                                        feed_text =['Your accuracy on this trial is: ' num2str(accuracy) '%']; % accuracy feedback
                                        DrawFormattedText(win, feed_text,'center','center');
                                        Screen(win,'Flip');
                                        pause(2)
                                    end
                                end
                                break
                                
                                %% Third sub-grid: write the name of the image you see on the board
                            elseif mouseX>myPict(2,1) && mouseX<myPict(2,3) && mouseY>myPict(2,2) && mouseY<myPict(2,4)
                                
                                DrawFormattedText(win,'Welcome to the third exercise!\n Each time one image will be displayed, pay attention!\n Press any key to start.','center', 'center'); %showing first instruction at center
                                Screen('flip',win);
                                
                                [secs,keyCode] = KbStrokeWait;% keyboard input/any key
                                anyKey = KbName(keyCode);
                                
                                WordsImages = ["ant.jpg","axe.jpg","banana.jpg","bat.jpg","belt.jpg","brush.jpg","canary.jpg","cape.jpg","cat.jpg","cherry.jpg","dog.jpg","dress.jpg","duck.jpg","eagle.jpg","fox.jpg","goat.jpg","goose.jpg","hat.jpg","jacket.jpg","kiwi.jpg","koala.jpg","ladder.jpg","lemon.jpg","lion.jpg","mole.jpg","peach.jpg","pencil.jpg","penguin.jpg","pig.jpg","pumpkin.jpg","rabbit.jpg","sheep.jpg","shirt.jpg","skunk.jpg","swan.jpg","tiger.jpg","tomato.jpg","zebra.jpg"];
                                names = ["ant","axe","banana","bat","belt","brush","canary","cape","cat","cherry","dog","dress","duck","eagle","fox","goat","goose","hat","jacket","kiwi","koala","ladder","lemon","lion","mole","peach","pencil","penguin","pig","pumpkin","rabbit","sheep","shirt","skunk","swan","tiger","tomato","zebra"];

                                while true
                                    
                                    List5  = Shuffle(WordsImages); % the first element of this array will used as target
                                    
                                    myimage = imread(List5(1)); % showing image
                                    tex = Screen('MakeTexture',win,myimage);
                                    Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                                    Screen('flip',win);
                                    pause(0.7)
                                    
                                    index2 = find(WordsImages == List5(1)); % coding the index
                                    
                                    DrawFormattedText(win,'Enter the name of the images displayed\n Lets begin!','center', 'center'); %showing instruction at center
                                    Screen('flip',win);
                                    pause(1.5);
                                    Screen('flip',win);
                                    
                                    nameEntered = [];
                                    correctA2 = 0;
                                    while true % keyboard input for words
                                        
                                        [keyTime keyCode] = KbStrokeWait;
                                        keyPressed_1 = KbName(keyCode);
                                        
                                        if strcmp(keyPressed_1,'return')
                                            break
                                        end
                                        
                                        nameEntered = [nameEntered keyPressed_1];
                                        DrawFormattedText(win,nameEntered, 'center','center');
                                        Screen(win,'Flip');
                                    end
                                    
                                    if strcmp(names(index2),nameEntered) % feedback: either positive or negative
                                        correctA2 = correctA2 + 1;
                                        DrawFormattedText(win,'Well done!', 'center','center')
                                        [y,fs] = audioread('correct_answer.wav');
                                        Screen(win,'Flip');
                                        sound(y,fs);
                                    else
                                        DrawFormattedText(win,'Try again!', 'center','center')
                                        [y,fs] = audioread('wrong_answer.wav');
                                        Screen(win,'Flip');
                                        sound(y,fs);
                                    end
                                    pause(2.5);
                                                                      
                                    DrawFormattedText(win,'Press SPACE for the next image or exit (ESC)!', 'center', 'center'); % instruction for exit
                                    Screen('flip',win); 

                                    [keyTime keyCode] = KbStrokeWait; % to exit
                                    keyPressed_1 = KbName(keyCode);
                                    if strcmp(keyPressed_1,'esc')
                                        break
                                    end
 
                                end
                                break
                                
                                
                                %% Fourth sub-grid: write the word you hear on the board
                            elseif mouseX>myPict(4,1) && mouseX<myPict(4,3) && mouseY>myPict(4,2) && mouseY<myPict(4,4)
                                
                                DrawFormattedText(win,'Welcome to the fourth exercise!\n Each time one sound will be played, pay attention!\n Press any key to start.','center', 'center'); %showing first instruction at center
                                Screen('flip',win);
                                
                                [secs,keyCode] = KbStrokeWait;% keyboard input/any key
                                anyKey = KbName(keyCode);
                                
                                WordsSounds = ["ant.wav","axe.wav","banana.wav","bat.wav","belt.wav","brush.wav","canary.wav","cape.wav","cat.wav","cherry.wav","dog.wav","dress.wav","duck.wav","eagle.wav","fox.wav","goat.wav","goose.wav","hat.wav","jacket.wav","kiwi.wav","koala.wav","ladder.wav","lemon.wav","lion.wav","mole.wav","peach.wav","pencil.wav","penguin.wav","pig.wav","pumpkin.wav","rabbit.wav","sheep.wav","shirt.wav","skunk.wav","swan.wav","tiger.wav","tomato.wav","zebra.wav"];
                                names = ["ant","axe","banana","bat","belt","brush","canary","cape","cat","cherry","dog","dress","duck","eagle","fox","goat","goose","hat","jacket","kiwi","koala","ladder","lemon","lion","mole","peach","pencil","penguin","pig","pumpkin","rabbit","sheep","shirt","skunk","swan","tiger","tomato","zebra"];
                                
                          
                                while true
                                    
                                    List6  = Shuffle(WordsSounds); % the first element of this array will used as target
                                    
                                    myimage = imread('sound_image.jpg'); 
                                    tex = Screen('MakeTexture',win,myimage);
                                    Screen('DrawTexture',win,tex,[],[screenCntrX-pictSize/2 screenCntrY-pictSize/2 screenCntrX+pictSize/2 screenCntrY+pictSize/2]);
                                    Screen('flip',win);
                                    
                                    [y,fs] = audioread(List6(1)); % targets are sounds in this case
                                    sound(y,fs)
                                    pause(2);
                                    Screen('flip',win);
                                    pause(0.3);
                                    
                                    index3 = find(WordsSounds == List6(1)); % find the index
                                    
                                    DrawFormattedText(win,'Enter the name of the word you heard\n Lets begin!','center', 'center'); %showing second instruction at center
                                    Screen('flip',win);
                                    pause(1.5);
                                    Screen('flip',win);
                                    
                                    nameEntered = [];
                                    correctA3 = 0;
                                    while true % keyboard input to the screen
                                        
                                        [keyTime keyCode] = KbStrokeWait;
                                        keyPressed_1 = KbName(keyCode);
                                        
                                        if strcmp (keyPressed_1,'return')
                                            break
                                        end
                                        
                                        nameEntered = [nameEntered keyPressed_1]; %to concatenate
                                        DrawFormattedText(win,nameEntered, 'center','center')
                                        Screen(win,'Flip');
                                    end
                                    
                                    if names(index3) == nameEntered % feedback: either positive or negative
                                        correctA3 = correctA3 + 1;
                                        DrawFormattedText(win,'Well done!', 'center','center')
                                        [y,fs] = audioread('correct_answer.wav');
                                        Screen(win,'Flip');
                                        sound(y,fs);
                                    else
                                        DrawFormattedText(win,'Try again!', 'center','center')
                                        [y,fs] = audioread('wrong_answer.wav');
                                        Screen(win,'Flip');
                                        sound(y,fs);
                                    end
                                    pause(2.5);
                                    
                                    DrawFormattedText(win,'Press SPACE for the next image or exit (ESC)!', 'center', 'center'); % instruction to exit
                                    Screen('flip',win);
                                    
                                    [keyTime keyCode] = KbStrokeWait; % to exit
                                    keyPressed_1 = KbName(keyCode);
                                    if strcmp(keyPressed_1,'esc')
                                        break
                                    end
                                end
                                break
                                
                            %% Exit button for sub-menu page   
                            elseif mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                                main_page_4 = false;
                                break
                            end
                        end
                    end
                end
                break
                
            %% Exit button for app    
            elseif mouseX>(screenRect(1)+900) && mouseX<(screenRect(3)-10) && mouseY>(screenRect(2)+10) && mouseY<(screenRect(4)-740)
                Screen(win,'Flip');
                DrawFormattedText(win,'See you again!', 'center','center')
                Screen(win,'Flip');
                pause(1)
                sca
                mainPage = false;
                break
            end
        end
    end
end










