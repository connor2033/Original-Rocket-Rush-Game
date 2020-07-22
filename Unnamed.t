setscreen ("graphics:800;600")
setscreen ("offscreenonly")

var numFrames : int := Pic.Frames ("rocket.gif")
var pics : array 1 .. numFrames of int
var delayTime : int := 10
var acount : int := 0
var distance : real := 0
var playgame : boolean := false
var font := Font.New ("courier:12")
var fontGA := Font.New ("arial:72")
var fontUS := Font.New ("arial:18")
var fontD := Font.New ("arial:40")

var help : boolean := false
var gameover : boolean := false
var aststep : int := 5
var astsize : array 1 .. 10 of int
var asty : array 1 .. 10 of int
var astx : array 1 .. 10 of int
var fuely : int
var fuelx : int := 1000
var fID : int
var tank : real := 110
var bgx1 : int := 0
var bgx2 : int := 800
var up : boolean := false
var down : boolean := false

var picID : array 1 .. 3 of int
var bgID : int
var startID : int
var helpID : int

var x : int := 300
var y : int := 300
var chars : array char of boolean

picID (1) := Pic.FileNew ("rocket01.bmp")
picID (2) := Pic.FileNew ("rocket02.bmp")
fID := Pic.FileNew ("fuel.bmp")
bgID := Pic.FileNew ("bg.bmp")
startID := Pic.FileNew ("start.bmp")
helpID := Pic.FileNew ("help.bmp")


%-------------------------------------------------------------------------Sound effects-------------------------------------------------------
process fuelfx
    Music.PlayFile ("fuel.wav")
end fuelfx

process restartfx
    Music.PlayFile ("restart.wav")
end restartfx

process buttonfx
    Music.PlayFile ("button.mp3")
end buttonfx



%------------------------------------------------------------STARTSCREEN---------------------------------
loop

    cls
    Input.KeyDown (chars)
    Pic.Draw (startID,0,0,picCopy)
    
    if (chars (KEY_ENTER) = true) and (help not= true) then
    playgame := true
    elsif (chars (' ') = true) and (help not= true) then
    help := true
    end if
    
    if (help = true) then
    cls
    Pic.Draw (helpID,0,0,picCopy)
    if (chars (KEY_BACKSPACE) = true) then
    help := false
    end if
    end if
    
    exit when (playgame = true)
View.Update
end loop



var fuel : int
fuel := Sprite.New (fID)


var sprite : array 1 .. 3 of int
sprite (1) := Sprite.New (picID (1))
Sprite.SetPosition (sprite (1), x, y, false)


sprite (2) := Sprite.New (picID (2))
Sprite.SetPosition (sprite (2), x, y, false)


put numFrames
%put picID
%put pics (1)

astsize (1) := Rand.Int (30, 40)
astsize (2) := Rand.Int (30, 40)
astsize (3) := Rand.Int (30, 40)
astsize (4) := Rand.Int (30, 40)
astsize (5) := Rand.Int (30, 40)
astsize (6) := Rand.Int (30, 40)
astsize (7) := Rand.Int (30, 40)
astsize (8) := Rand.Int (30, 40)
astsize (9) := Rand.Int (30, 40)
astsize (10) := Rand.Int (30, 40)

asty (1) := Rand.Int (10, 590)
asty (2) := Rand.Int (10, 590)
asty (3) := Rand.Int (10, 590)
asty (4) := Rand.Int (10, 590)
asty (5) := Rand.Int (10, 590)
asty (6) := Rand.Int (10, 590)
asty (7) := Rand.Int (10, 590)
asty (8) := Rand.Int (10, 590)
asty (9) := Rand.Int (10, 590)
asty (10) := Rand.Int (10, 590)

astx (1) := Rand.Int (820, 2500)
astx (2) := Rand.Int (820, 2500)
astx (3) := Rand.Int (820, 2500)
astx (4) := Rand.Int (820, 2500)
astx (5) := Rand.Int (820, 2500)
astx (6) := Rand.Int (820, 2500)
astx (7) := Rand.Int (820, 2500)
astx (8) := Rand.Int (820, 2500)
astx (9) := Rand.Int (820, 2500)
astx (10) := Rand.Int (820, 2500)

fuely := Rand.Int (40, 560)
Sprite.SetPosition (fuel, fuelx, fuely, false)


drawfillbox (10, 570, 110, 585, 12)



%--------------------------------------------------------------------endscreen-----------------------------------------------------

procedure endscreen
    cls
    Sprite.Hide (sprite (acount div 10 mod 2 + 1))
    Sprite.Hide (fuel)

    drawfillbox (0, 0, maxx, maxy, 40)
    Draw.Text ("Distance:         km!", 170, 400, fontD, 10)
    Draw.Text (realstr (distance, 0), 390, 400, fontD, 43)
    Draw.Text ("GAME OVER.", 100, 300, fontGA, black)
    Draw.Text ("...u kinda suk...", 5, 10, fontUS, 112)
    Draw.Text ("Press [ENTER] to restart!", 260, 250, fontUS, 11)

    %loop
    if (chars (KEY_ENTER) = true) then
	fork restartfx

	up := false
	down := false
	x := 300
	y := 300

	astsize (1) := Rand.Int (30, 40)
	astsize (2) := Rand.Int (30, 40)
	astsize (3) := Rand.Int (30, 40)
	astsize (4) := Rand.Int (30, 40)
	astsize (5) := Rand.Int (30, 40)
	astsize (6) := Rand.Int (30, 40)
	astsize (7) := Rand.Int (30, 40)
	astsize (8) := Rand.Int (30, 40)
	astsize (9) := Rand.Int (30, 40)
	astsize (10) := Rand.Int (30, 40)


	asty (1) := Rand.Int (10, 590)
	asty (2) := Rand.Int (10, 590)
	asty (3) := Rand.Int (10, 590)
	asty (4) := Rand.Int (10, 590)
	asty (5) := Rand.Int (10, 590)
	asty (6) := Rand.Int (10, 590)
	asty (7) := Rand.Int (10, 590)
	asty (8) := Rand.Int (10, 590)
	asty (9) := Rand.Int (10, 590)
	asty (10) := Rand.Int (10, 590)

	astx (1) := Rand.Int (820, 2500)
	astx (2) := Rand.Int (820, 2500)
	astx (3) := Rand.Int (820, 2500)
	astx (4) := Rand.Int (820, 2500)
	astx (5) := Rand.Int (820, 2500)
	astx (6) := Rand.Int (820, 2500)
	astx (7) := Rand.Int (820, 2500)
	astx (8) := Rand.Int (820, 2500)
	astx (9) := Rand.Int (820, 2500)
	astx (10) := Rand.Int (820, 2500)

	fuelx := 800
	fuely := Rand.Int (40, 560)

	drawfillbox (0, 0, maxx, maxy, black)
	Time.Delay (1000)
	Draw.Text ("3...", 300, 300, fontGA, red)
	Time.Delay (400)
	cls

	drawfillbox (0, 0, maxx, maxy, red)
	Draw.Text ("2...", 300, 300, fontGA, black)
	Time.Delay (1000)
	cls

	drawfillbox (0, 0, maxx, maxy, black)
	Draw.Text ("1...", 300, 300, fontGA, red)
	Time.Delay (1000)
	cls
	Time.Delay (1000)

	gameover := false
	aststep := 5
	distance := 0
	tank := 110

	%exit when (up = false) and (down = false)
    end if
    %end loop
end endscreen


%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Loop//////////////////////////////////////////////////////////////////
loop
    Input.KeyDown (chars)
    acount += 1
    cls
    Pic.Draw (bgID, bgx1, 0, picCopy)
    Pic.Draw (bgID, bgx2, 0, picCopy)
    bgx1 := bgx1 - 1
    bgx2 := bgx2 - 1

    if (bgx1 < -800) then
	bgx1 := 799
    end if
    if (bgx2 < -800) then
	bgx2 := 799
    end if





    Sprite.Show (fuel)
    Sprite.Show (sprite (acount div 10 mod 2 + 1))
    Sprite.SetPosition (sprite (acount div 10 mod 2 + 1), x, y, false)
    %---------------------------------------------------Moving Rocket-----------------------------------------------------%


    if (chars (KEY_UP_ARROW) = true) then
	up := true
	down := false
    end if

    if (chars (KEY_DOWN_ARROW) = true) then
	up := false
	down := true
    end if

    if (up = true) then
	%put "up"
	y := y + 3
    end if

    if (down = true) then
	%put "down"
	y := y - 3
    end if

    if (y - 30 > maxy) then
	y := y - 660
    end if

    if (y + 30 < 0) then
	y := maxy + 30
    end if

    %-------------------------------------------------Spawning-Asteriods------------------------------------------------------%

    astx (1) := astx (1) - aststep
    drawfilloval (astx (1), asty (1), astsize (1), astsize (1), 27)

    astx (2) := astx (2) - aststep
    drawfilloval (astx (2), asty (2), astsize (2), astsize (2), 27)

    astx (3) := astx (3) - aststep
    drawfilloval (astx (3), asty (3), astsize (3), astsize (3), 27)

    astx (4) := astx (4) - aststep
    drawfilloval (astx (4), asty (4), astsize (4), astsize (4), 27)

    astx (5) := astx (5) - aststep
    drawfilloval (astx (5), asty (5), astsize (5), astsize (5), 27)

    astx (6) := astx (6) - aststep
    drawfilloval (astx (6), asty (6), astsize (6), astsize (6), 27)

    astx (7) := astx (7) - aststep
    drawfilloval (astx (7), asty (7), astsize (7), astsize (7), 27)

    astx (8) := astx (8) - aststep
    drawfilloval (astx (8), asty (8), astsize (8), astsize (8), 27)

    astx (9) := astx (9) - aststep
    drawfilloval (astx (9), asty (9), astsize (9), astsize (9), 27)

    astx (10) := astx (10) - aststep
    drawfilloval (astx (10), asty (10), astsize (10), astsize (10), 27)


    %new ast coords

    if (astx (1) < -20) then

	astx (1) := astx (1) + 850
	asty (1) := Rand.Int (10, 590)
	astsize (1) := Rand.Int (30, 40)

    end if

    if (astx (2) < -20) then

	astx (2) := astx (2) + 850
	asty (2) := Rand.Int (10, 590)
	astsize (2) := Rand.Int (30, 40)

    end if

    if (astx (3) < -20) then

	astx (3) := astx (3) + 850
	asty (3) := Rand.Int (10, 590)
	astsize (3) := Rand.Int (30, 40)

    end if

    if (astx (4) < -20) then

	astx (4) := astx (4) + 850
	asty (4) := Rand.Int (10, 590)
	astsize (4) := Rand.Int (30, 40)

    end if

    if (astx (5) < -20) then

	astx (5) := astx (5) + 850
	asty (5) := Rand.Int (10, 590)
	astsize (5) := Rand.Int (30, 40)

    end if

    if (astx (6) < -20) then

	astx (6) := astx (6) + 850
	asty (6) := Rand.Int (10, 590)
	astsize (6) := Rand.Int (30, 40)

    end if

    if (astx (7) < -20) then

	astx (7) := astx (7) + 850
	asty (7) := Rand.Int (10, 590)
	astsize (7) := Rand.Int (30, 40)

    end if

    if (astx (8) < -20) then

	astx (8) := astx (8) + 850
	asty (8) := Rand.Int (10, 590)
	astsize (8) := Rand.Int (30, 40)

    end if

    if (astx (9) < -20) then

	astx (9) := astx (9) + 850
	asty (9) := Rand.Int (10, 590)
	astsize (9) := Rand.Int (30, 40)

    end if

    if (astx (10) < -20) then

	astx (10) := astx (10) + 850
	asty (10) := Rand.Int (10, 590)
	astsize (10) := Rand.Int (30, 40)

    end if

    %-----------------------------------------------------------Fuel Can---------------------------------------------------------%

    fuelx := fuelx - 2
    Sprite.SetPosition (fuel, fuelx, fuely, false)

    if (fuelx < -50) then
	fuelx := fuelx + 1300
	fuely := Rand.Int (40, 560)
    end if





    %-------------------------------------------Fuel Tank--------------------------------------------------------------------------------------------------
    if (tank < 10) then
	gameover := true
    end if

    tank := tank - 0.08


    drawfillbox (10, 570, 110, 585, 12)
    drawfillbox (10, 570, round (tank), 585, 10)
    drawbox (9, 569, 111, 586, 11)




    %-----------------------------------------Distance Meter------------------------------------------------------------------------------------------------
    if (gameover = false) then
	distance := distance + 0.01
    end if

    if (distance > 10 and distance < 1.1) then
	aststep := aststep + 1
    end if

    drawfillbox (715, 565, 790, 585, 12)
    drawbox (714, 564, 791, 586, 11)
    Draw.Text (realstr (distance, 0), 718, 570, font, 11)

    Draw.Text ("km", 767, 570, font, 11)

    %3 front dots
    %drawdot (x + 120, y + 20, red)
    %drawdot (x + 110, y + 15, green)
    %drawdot (x + 110, y + 28, green)

    %fin points
    %drawdot (x + 48, y, green)
    %drawdot (x + 43, y + 45, green)

    %fins
    %drawdot (x + 55, y + 6, green)
    %drawdot (x + 55, y + 36, green)

    %drawdot (x + 52, y + 3, green)
    %drawdot (x + 50, y + 39, green)

    %drawdot (x + 61, y + 10, green)
    %drawdot (x + 61, y + 33, green)

    %main body
    %drawdot (x + 65, y + 11, green)
    %drawdot (x + 65, y + 33, green)
    %drawdot (x + 73, y + 13, green)
    %drawdot (x + 73, y + 32, green)
    %drawdot (x + 80, y + 15, green)
    %drawdot (x + 80, y + 29, green)
    %drawdot (x + 95, y + 15, green)
    %drawdot (x + 95, y + 28, green)

    if whatdotcolor (x + 120, y + 20) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 110, y + 15) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 110, y + 28) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 48, y) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 43, y + 45) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 55, y + 6) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 55, y + 36) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 52, y + 3) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 50, y + 39) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 61, y + 10) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 61, y + 33) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 65, y + 11) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 65, y + 33) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 73, y + 13) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 73, y + 32) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 80, y + 15) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 80, y + 29) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 95, y + 15) = 27 then
	gameover := true
    end if

    if whatdotcolor (x + 95, y + 28) = 27 then
	gameover := true
    end if

    %-----------------------------------------------------Fuel Detection-------------------------------------

    if (x + 70 > fuelx) and (x + 70 < fuelx + 50) and (y + 23 > fuely) and (y + 23 < fuely + 50) then
	fuelx := fuelx + 1200
	fork fuelfx
	fuely := Rand.Int (40, 560)
	tank := 110
    end if




    if (gameover = true) then
	endscreen
    end if



    Time.Delay (17)
    View.Update
    Sprite.Hide (sprite (acount div 10 mod 2 + 1))
    Sprite.Hide (fuel)


end loop


Pic.Free (picID (1))
Pic.Free (bgID)
