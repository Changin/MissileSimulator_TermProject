function fighter_pos = getFighterPos(t,speed_fighter,init_fighter)
    position = init_fighter + (t-1)*speed_fighter*[1,0,0]; %전투기의 위치를 속도와 시간에 따라 재설정
    fighter_pos = position;
end
