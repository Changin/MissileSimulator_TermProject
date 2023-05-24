
% 미사일 위치 함수
function missile_Pos = getMissilePos(t, hit_range, fighter_Pos, init_missile_pos, speed_missile)
    missile_Pos = init_missile_pos;
    k = 1;
    time_to_end = numel(t); % time_to_end 초기화
    while (k <= numel(t))
        direction = fighter_Pos(k, :) - missile_Pos(k, :);  % 전투기와 마사일을 연결한 직선의 방향 벡터
        missile_Pos(k + 1, :) = missile_Pos(k, :) + (speed_missile * direction) / norm(direction); % 방향벡터를 정규화하여 미사일속도에 적용
        distance = fighter_Pos(k, :) - missile_Pos(k, :); % 미사일과 전투기의 거리
        
        if norm(distance) <= hit_range
            time_to_end = k;
            break; % 거리가 hit range에 도달했을 때 loop 종료
        end

        k = k + 1;
    end

    position = ones(time_to_end, 3);

    i = 1;
    while (i <= time_to_end)
        position(t(i), :) = missile_Pos(i, :); % tiem_to_end 행까지 position행렬에 값을 할당
        i = i + 1;
    end

    missile_Pos = position;
end
