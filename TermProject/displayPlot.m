%Program displayPlot:전투기/미사일의 x,y,z 위치행렬과 격추 시간을 입력받아 그래프를 작성하고, 격추 유무를
%                    논리값으로 출력하는 프로그램
%2023.5.24 by heo seon
%
function is_hit = displayPlot (time_to_end,fighter_pos, missile_pos)
    for time_now = 1:time_to_end
        cla                                       %그래프 초기화 (전투기 아이콘 누적 방지)
        axis([0,1.1*time_to_end,0,2*fighter_pos(end,3)])  %
        fighter_x = fighter_pos(1:time_now,1);           %전투기위치행렬에서 x값 추출
        fighter_y = fighter_pos(1:time_now,3);           %전투기위치행렬에서 z값 추출
        missile_x = missile_pos(1:time_now,1);           %미사일위치행렬에서 x값 추출
        missile_y = missile_pos(1:time_now,3);           %미사일위치행렬에서 z값 추출
        plot(fighter_x,fighter_y,"k-"),xlabel("x축(km)"),ylabel("z축(km)");           %x,z 축으로 나타나는 전투기 그래프 (검정 선)
        hold on;                                  %그래프 유지 명령어
        plot(missile_x,missile_y,"b-"),xlabel("x축(km)"),ylabel("z축(km)");           %x,z 축으로 나타나는 미사일 그래프 (파란 선)
        hold on;
        if  length(missile_pos(1:time_now,1)) == time_to_end                  %그래프 종료 조건: 미사일이 충돌하거나 주어진 시간이 될때까지 충돌되지 않았을 때                                                
            if length(fighter_pos) ~= time_to_end                             %충돌 조건:충돌 시 미사일위치행렬의 행의 길이가 전투기위치행렬의 행의 길이보다 작게 출격되는 것을 이용  
                plot(fighter_pos(time_now,1),fighter_pos(time_now,3),"r*"),xlabel("x축(km)"),ylabel("z축(km)");  %충돌 시 붉을 별로 충돌 아이콘 표시
                hit = 1;
            else
                plot(fighter_pos(time_now,1),fighter_pos(time_now,3),"b>"),xlabel("x축(km)"),ylabel("z축(km)");  
                plot(missile_pos(time_now,1),missile_pos(time_now,3),"bd"),xlabel("x축(km)"),ylabel("z축(km)");  %미 충돌시 전투기/미사일 색이 파란색으로 변함
                hit = 0;
            end
            break
        else                                      
            hit = 0;
            plot(fighter_pos(time_now,1),fighter_pos(time_now,3),"g>"),xlabel("x축(km)"),ylabel("z축(km)");  %전투기 현위치 아이콘 (초록색 화살표)
            plot(missile_pos(time_now,1),missile_pos(time_now,3),"rd"),xlabel("x축(km)"),ylabel("z축(km)");  %미사일 현위치 아이콘 (붉은색 다이아몬드)
        end
        drawnow limitrate;                        %time_now에서의 그래프를 그리는 명령어 -> time_now가 증가하면서 애니매이션화
    end
    drawnow;                                      %연산 속도 향상
    is_hit = logical(hit);                        %is_hit 에 대한 논리 함수로 출력
end