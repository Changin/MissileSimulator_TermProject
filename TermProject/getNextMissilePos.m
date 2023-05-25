
% 마시일 위치를 구하는 함수
function missile_pos=getNextMissilePos(prev_missile_pos,unit_direction,speed_missile)

	missile_pos=prev_missile_pos+speed_missile*unit_direction; % 방향벡터에 미사일 속도를 적용 

end