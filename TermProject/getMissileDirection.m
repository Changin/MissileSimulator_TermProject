%미사일 방향 단위벡터
function unit_direction = getMissileDirection(prev_fighter_pos, prev_missile_pos)
    direction = (prev_fighter_pos - prev_missile_pos); %미사일 방향벡터
    unit_direction = (direction)/norm(direction);
end