% 프로그램 main.m : main function of "missile simulator" Project
% 2023.05.23, Chang-in Baek
% input var:
%	time_limit = 1000;				%요격 제한 시간, 단위:10ms
%	hit_range = 5;					%명중판정 거리, 단위 : km, (미사일 기준 반경 5km이내로 설정함.)
% 	speed_fighter = 0.3;  		%전투기 속력값, 단위 : km/10ms
% 	speed_missile = 0.6;  		%미사일 속력값, 단위 : km/10ms
% 	init_fighter_pos = [0,0,100];	%전투기 초기위치 (x,y,z 좌표), 단위 : km
% 	init_missile_pos = [500,0,0];	%미사일 초기위치 (x,y,z 좌표), 단위 : km
% output var :
% 	is_hit = false;				%명중여부 (logical)
% function :
% 	getTrack()					%전투기, 미사일 항적 계산 함수
% 	displayPlot() 				%그래프 화면 출력 함수
% parameter :
%	track_cell 					%getTrack()함수 결과값 셀 (1x4 cell) (1: 항적종료시간, 2: 전투기항적배열, 3: 미사일항적배열, 4: 명중여부)


% 입력부:
time_limit = 1000;
hit_range = 5;
speed_fighter = 0.3;
speed_missile = 0.6;
init_fighter_pos = [0,0,100];
init_missile_pos = [500,0,0];


% 계산부:
track_cell = getTrack(time_limit, hit_range, speed_fighter, speed_missile, init_fighter_pos, init_missile_pos);
%1: 종료시간, 2: 전투기항적, 3: 미사일 항적, 4: 명중여부 가 셀로 반환됨.

% 출력부:
% 그래프 출력
%track_cell - 1: 종료시간, 2: 전투기항적, 3: 미사일 항적, 4: 명중여부
displayPlot(track_cell{1}, track_cell{2}, track_cell{3}, track_cell{4});


% 명중여부 콘솔 출력
is_hit = track_cell{4};
if (is_hit)
	disp("Target Hit !!");
	fprintf("Eliminated time : %.2f (sec)\n", track_cell{1}/100)
else
	disp("miss!");
end