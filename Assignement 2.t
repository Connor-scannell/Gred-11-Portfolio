%***********************************************************************%
%                          PROGRAM HEADER                               %
%***********************************************************************%
%                                                                       %
% PROGRAMMER'S NAME:    Connor Scannell                                 %
%                                                                       %
% PROGRAM NAME:         Agarius                                         %
%                                                                       %
% CLASS:                ICS3U1-01                                       %
%                                                                       %
% ASSIGNMENT:           Assignement 2                                   %
%                                                                       %
% TEACHER:              Mrs. Barsan                                     %
%                                                                       %
% DUE DATE:             Friday, April 20, 2016                          %
%                                                                       %
%***********************************************************************%
% WHAT THE PROGRAM DOES                                                 %
%                                                                       %
% Agarius is a game the object of wich is to eat multi colored "cookies"%
% each one preforming a different action ranging from increasing size   %
% and speed to inverting directions and of course points.               %
% The ultimate goal  of corse is to reach the max size and get as many  %
% Points as possible                                                    %
%                                                                       %
%                                                                       %
%***********************************************************************%
% PROCEDURES                                                            %
%    End Screen                                                         %
%     Quits game and displays scores                                    %
%                                                                       %
%                                                                       %
%                                                                       %
%***********************************************************************%
% ERROR HANDLING                                                        %
%                                                                       %
% this program will only acept the arrow keys or the q key to quit      %
% there are no parts of the program that accepts other types of input   %
%                                                                       %
%***********************************************************************%
% PROGRAM LIMITATIONS                                                   %
%                                                                       %
% this program occaisonaly glitches when the ball is moving too fast and%
% bounces off the edge. Also it occasonaly goes over a cookie when      %
% moving too fast                                                       %
%***********************************************************************%
% EXTENSIONS AND IMPROVEMENTS                                           %
%                                                                       %
% This program could be improved in a variety of ways:                  %
% 1. user can choose the bubble color                                   %
%                                                                       %
%                                                                       %
%                                                                       %
%***********************************************************************%































%declaring varibles
var whitex, whitey, brownx, browny, redx, redy, orangex, orangey, greenx, greeny, purplex, purpley, cyanx, cyany : int := 0
var yellowx, yellowy : int := 200
var yellowradius : int := 10
var dirx, diry : int := 0
var speed : int := 1
var replay : string
var seconds : real := 0.00
var points : int := 0
var start : string
var Q : string := "Q"
var x : int := 0
var y : int := 0
var key : array char of boolean
var switch : boolean


procedure end_screen  % quiting procedure
    cls

    drawfillbox (1, 1, maxx, maxy, black)
    colorback (black)
    color (yellow)
    locate (10, 85)
    put "Game Over"
    locate (11, 80)
    put "--------------------"
    locate (12, 50)
    put "Time Plaing -------------------------------------------  | ", Time.Elapsed div 1000, " seconds"
    locate (13, 50)
    put "Final Size  ------------------------------------------- +| ", (yellowradius - 10) div 2, " Size"
    locate (14, 50)
    put "Final Speed ------------------------------------------- +| ", speed - 1, " Speed"
    locate (15, 50)
    put "Points      -------------------------------------------  | ", points * 10, " points"
    delay (100000)
    quit
end end_screen


loop
    % intro screen
    put "Welcome to Agarius, Would you like your instructions or would you like"
    put "go right into it (Help/Go)"
    get start

    if
	    start = "help" or start = "Help"
	    then
	locate (1, 30)
	% instructions for game
	put "Instructions"
	locate (5, 20)
	put " "
	put "  'q' to exit "
	put "Red cookie ---------------- increase size"
	put "Green cookie -------------- decrease size"
	put "Orange cookie ------------ increase speed"
	put "Blue cookie -------------- decrease speed"
	put "purple cookie ----------- invert controls"
	put "White cookie ---------------- + 10 points"
	put "Brown cookie -- speeds up cookie movement"



    elsif start = "Go" or start = "go" then
	%  setting to full screen
	setscreen ("graphics:max;max,")
	% starting game loop
	loop
	    % initilizing seconds coun ter to 0
	    seconds := x
	    % exit checks
	    if speed = 0 then
		end_screen
	    end if





	    %rewriting screen as black
	    drawfillbox (1, 1, maxx, maxy, black)
	    %random x locations
	    randint (redx, 1, maxx)
	    randint (orangex, 1, maxx)
	    randint (greenx, 1, maxx)
	    randint (purplex, 1, maxx)
	    randint (cyanx, 1, maxx)
	    randint (brownx, 1, maxx)
	    randint (whitex, 1, maxx)
	    %random y locations
	    randint (redy, 1, maxy)
	    randint (orangey, 1, maxy)
	    randint (greeny, 1, maxy)
	    randint (purpley, 1, maxy)
	    randint (cyany, 1, maxy)
	    randint (browny, 1, maxy)
	    randint (whitey, 1, maxy)
	    % drawing circles
	    drawfilloval (redx, redy, 5, 5, red)
	    drawfilloval (orangex, orangey, 5, 5, 41)
	    drawfilloval (greenx, greeny, 5, 5, green)
	    drawfilloval (purplex, purpley, 5, 5, purple)
	    drawfilloval (cyanx, cyany, 5, 5, cyan)
	    drawfilloval (brownx, browny, 5, 5, 187)
	    drawfilloval (whitex, whitey, 5, 5, white)





	    var chars : array char of boolean
	    loop
		% cookie effects

		% red cookie effect
		if yellowx < redx + yellowradius + 6 and yellowx > redx - yellowradius + 6 and yellowy < redy + yellowradius + 7 and yellowy > redy - yellowradius + 7
			then
		    drawfilloval (redx, redy, 5, 5, black)
		    if yellowradius < 75 then
			yellowradius := yellowradius + 2
			randint (redy, 1, maxy)
			randint (redx, 1, maxx)
		    else
			exit
		    end if
		end if


		% green cookie effect
		if yellowx < greenx + yellowradius + 6 and yellowx > greenx - yellowradius + 6 and yellowy < greeny + yellowradius + 5 and yellowy > greeny - yellowradius + 5
			then
		    drawfilloval (greenx, greeny, 5, 5, black)
		    yellowradius := yellowradius - 2
		    randint (greeny, 1, maxy)
		    randint (greenx, 1, maxx)
		end if


		% orange cookie effect
		if yellowx < orangex + yellowradius + 6 and yellowx > orangex - yellowradius + 6 and yellowy < orangey + yellowradius + 5 and yellowy > orangey - yellowradius + 5
			then
		    drawfilloval (orangex, orangey, 5, 5, black)
		    speed := speed * 2

		    randint (orangey, 1, maxx)
		    randint (orangex, 1, maxy)
		end if


		% cyan cookie effect
		if yellowx < cyanx + yellowradius + 6 and yellowx > cyanx - yellowradius + 6 and yellowy < cyany + yellowradius and yellowy > cyany - yellowradius + 5
			then
		    drawfilloval (cyanx, cyany, 5, 5, black)
		    speed := speed div 2

		    randint (cyany, 1, maxy)
		    randint (cyanx, 1, maxx)
		end if

		% purple cookie effect
		if yellowx < purplex + yellowradius + 6 and yellowx > purplex - yellowradius + 6 and yellowy < purpley + yellowradius and yellowy > purpley - yellowradius + 5
			then
		    drawfilloval (purplex, purpley, 5, 5, black)

		    speed := speed * -1
		    exit
		end if

		% white cookie effect
		if yellowx < whitex + yellowradius + 6 and yellowx > whitex - yellowradius + 6 and yellowy < whitey + yellowradius + 5 and yellowy > whitey - yellowradius + 5
			then
		    drawfilloval (whitex, whitey, 5, 5, black)
		    points := points + 1

		    randint (whitey, 500, 501)
		    randint (whitex, 700, 740)
		    play ("aegg")
		end if




		%brown cookiie effect
		if yellowx < brownx + yellowradius + 6 and yellowx > brownx - yellowradius + 6 and yellowy < browny + yellowradius and yellowy > browny - yellowradius + 5
			then
		    drawfilloval (brownx, browny, 5, 5, black)
		    seconds := seconds + 5
		end if
		% control section

		
		% quit command
		Input.KeyDown (key)
		if key ('q') then
		    end_screen
		    exit
		end if
		
		
		
		Input.KeyDown (chars)


		
		% key commands
		if chars (KEY_UP_ARROW) then
		    dirx := 0
		    diry := 0
		    diry := (diry + 5) * speed
		end if
		if chars (KEY_RIGHT_ARROW) then
		    dirx := 0
		    diry := 0
		    dirx := (dirx + 5) * speed
		end if
		if chars (KEY_LEFT_ARROW) then
		    dirx := 0
		    diry := 0
		    dirx := (dirx - 5) * speed
		end if
		if chars (KEY_DOWN_ARROW) then
		    dirx := 0
		    diry := 0
		    diry := (diry - 5) * speed
		end if
 
		
		
		yellowx := yellowx + dirx
		yellowy := yellowy + diry
		drawfilloval (yellowx, yellowy, yellowradius, yellowradius, yellow)
		delay (40)
		drawfilloval (yellowx, yellowy, yellowradius, yellowradius, black)

		
		% bouncing checks
		if yellowx > maxx or yellowx < 0 then
		    dirx := dirx * -1
		end if
		if yellowy > maxy or yellowy < 0 then
		    diry := diry * -1
		end if

		
		% counting
		seconds := seconds + 1


		
		% checking if 5 seconds has passed
		if seconds > 125 then
		    exit

		end if
	    end loop
	end loop
    else
    % error check for begining statment
	put "invalid input "
	delay (2000)
	cls
    end if
end loop
