function is_hit = displayPlot (fighter_pos, missile_pos)
endtime = length(missile_pos);
    for k = 1:endtime
        cla
        fighter_x = fighter_pos(1:k,1);           %전투기위치행렬에서 x값 추출
        fighter_y = fighter_pos(1:k,3);           %전투기위치행렬에서 z값 추출
        missile_x = missile_pos(1:k,1);           %미사일위치행렬에서 x값 추출
        missile_y = missile_pos(1:k,3);           %미사일위치행렬에서 z값 추출
        plot(fighter_x,fighter_y,"k-");           %x,z 축으로 나타나는 전투기 그래프
        xlabel("x축(km)"),ylabel("z축(km)")
        hold on;                                  %그래프 유지 명령어
        plot(missile_x,missile_y,"b-");           %x,z 축으로 나타나는 미사일 그래프
        xlabel("x축(km)"),ylabel("z축(km)")
        hold on;
        if sqrt((fighter_pos(k,1) - missile_pos(k,1)).^2 + (fighter_pos(k,3)-missile_pos(k,3)).^2) <= 5               %충돌 조건(수정 필요)
            is_hit = 1;
            disp("Target hit!");
            plot(fighter_pos(k,1),fighter_pos(k,3),"r*"),xlabel("x축(km)"),ylabel("z축(km)");  %충돌 시 충돌 아이콘 표시
            break
        else                                      
            is_hit = 0;
            plot(fighter_pos(k,1),fighter_pos(k,3),"g>"),xlabel("x축(km)"),ylabel("z축(km)");  %전투기 현위치 아이콘
            plot(missile_pos(k,1),missile_pos(k,3),"rd"),xlabel("x축(km)"),ylabel("z축(km)");  %미사일 현위치 아이콘
        end
        drawnow limitrate;                        %애니매이션 명령어
    end
    disp("miss");
    drawnow;           
end