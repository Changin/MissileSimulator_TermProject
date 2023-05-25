%Program displayPlot: 전투기/미사일의 x,y,z 위치행렬과 격추 시간을 입력받아 그래프를 작성하는 프로그램
%2023.5.24 by heo seon
%
function displayPlot (end_time, fighter_track, missile_track, is_hit)
    plot(0,0),xlabel("x축(km)"),ylabel("z축(km)");                             %그래프 x축, y축 선언
    hold on                                                                    %그래프 유지 명령어
    for time_now = 1:end_time
        cla                                                                    %그래프 초기화 (전투기 아이콘 누적 방지)
        if fighter_track(end_time,1) <= missile_track(1,1)                     %그래프 영역설정
            axis([0, 1.1*missile_track(1,1), 0, 2*fighter_track(end,3)])       %전투기가 미사일 시작지점까지 가지 못했을 경우 미사일 시작 지점을 기준으로 그래프 영역 설정
        else
            axis([0, 1.1*fighter_track(end,1), 0, 2*fighter_track(end,3)])     %전투기가 미사일 시작지점보다 멀리 갔을 경우 전투기의 최종 위치를 기준으로 그래프 영역 설정
        end
        fighter.x = fighter_track(1:time_now,1);
        fighter.y = fighter_track(1:time_now,3);                               %전투기위치행렬에서 x,z값 추출, 구조체에 저장
        missile.x = missile_track(1:time_now,1);
        missile.y = missile_track(1:time_now,3);                               %미사일위치행렬에서 x,z값 추출, 구조체에 저장
        plot(fighter.x,fighter.y,"k-")                                         %x,z 축으로 나타나는 전투기 궤적 그래프 (검정 선)    
        plot(missile.x,missile.y,"b-")                                         %x,z 축으로 나타나는 미사일 궤적 그래프 (파란 선)
        if  time_now == end_time                                               %그래프 종료 조건: 미사일이 충돌하거나 주어진 시간이 될때까지 충돌되지 않았을 때
            if (is_hit)                                                        %충돌 조건:충돌 여부에 대한 논리함수를 통해 판정
                plot(fighter.x(time_now),fighter.y(time_now),"r*") %충돌 시 붉을 별로 충돌 아이콘 표시
            else
                plot(fighter.x(time_now),fighter.y(time_now),"b>")
                plot(missile.x(time_now),missile.y(time_now),"bd") %미 충돌시 전투기/미사일 색이 파란색으로 변함
            end
        else
            plot(fighter.x(time_now),fighter.y(time_now),"g>")                 %전투기 현위치 아이콘 (초록색 화살표)
            plot(missile.x(time_now),missile.y(time_now),"rd")                 %미사일 현위치 아이콘 (붉은색 다이아몬드)
        end
        drawnow limitrate                                                      %그래프 애니매이션 속도 향상
    end
    hold off                                                                   %그래프 유지 기능 제거 명령어
    drawnow                                                                    %time_now에서의 그래프를 그리는 명령어 -> time_now가 증가하면서 애니매이션화
end