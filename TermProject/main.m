% 프로그램 main.m : main function of "missile simulator" Project
% 2023.05.23, Chang-in Baek

% input var:
% speed_fighter = 0.3;  		%전투기 속력값, 단위 : km/10ms
% speed_missile = 0.6;  		%미사일 속력값, 단위 : km/10ms
% init_fighter_pos = [0,0,100];	%전투기 초기위치 (x,y,z 좌표), 단위 : km
% init_missile_pos = [500,0,0];	%미사일 초기위치 (x,y,z 좌표), 단위 : km

% output var :
% is_hit = false;				%명중여부 (logical)

% function :
% 전투기위치함수						
% 미사일위치함수
% 화면출력함수

% parameter :
hit_range = 5;					%명중판정 거리 : 5km, (미사일 기준 반경 5km이내)
t = 1:1:6000;					%시간 정의역, 단위 : 10ms
%fighter_pos = init_fighter_pos;	%전투기 위치 행렬 [x1,y1,z1; x2,y2,z2; ...]
%missile_pos = init_missile_pos;	%미사일 위치 행렬 [x1,y1,z1; x2,y2,z2; ...]


% 입력부:
speed_fighter = 0.3;
speed_missile = 0.6;
init_fighter_pos = [0,0,100];
init_missile_pos = [500,0,0];

% 계산부:
% 전투기 위치 구하기
fighter_pos = getFighterPos(t, speed_fighter, init_fighter_pos);
% 미사일 위치 구하기
missile_pos = getMissilePos(t, hit_range, fighter_pos, init_missile_pos, speed_missile);

% 출력부:
time_to_end = length(missile_pos);
%is_hit = displayPlot(time_to_end, fighter_pos, missile_pos);
is_hit = displayPlot(fighter_pos, missile_pos);
if (is_hit)
	disp("Target Hit !!");
else
	disp("miss!");
end
% 출력함수