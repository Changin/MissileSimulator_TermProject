function fighter_pos = getFighterPos(t,fighter_speed,fighter_initial)
k = 1;
position = ones(t(end),3);
while (k<=t(end))
    position(t(k):t(k) , :) = fighter_initial + k*fighter_speed*[1,0,0]; %전투기의 위치를 속도와 시간에 따라 재설정
    k = k+1;
end
fighter_pos = position(:,:);
end