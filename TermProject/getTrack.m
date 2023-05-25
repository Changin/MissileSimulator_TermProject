% 프로그램 getTrack.m : 전투기, 미사일 항적 계산 함수. sub function of "missile simulator" Project,
% 2023.05.24, Chang-in Baek
% input var:
%	time_limit			%요격 제한 시간, 단위:10ms
%	hit_range			%명중판정 범위, 단위: km
%	speed_fighter		%전투기 속력, 단위: /10ms
%	speed_missile		%미사일 속력, 단위: /10ms
%	init_fighter_pos	%전투기 초기좌표 (x,y,z), 단위 : km
%	init_missile_pos	%미사일 초기좌표 (x,y,z), 단위 : km
% output var :
% 	track_cell			%(1x4 cell) (1: 항적종료시간, 2: 전투기항적배열, 3: 미사일항적배열, 4: 명중여부)
% function :
%	getFighterPos()
% 	getMissileDirection()
%	getNextMissilePos()
%	isHit()
% parameter :
%	tmp_fighter_track   %전투기 항적 저장 임시 배열 [x1, y1, z1; x2,y2,z2; ...]
%	tmp_missile_track 	%미사일 항적 저장 임시 배열 [x1, y1, z1; x2,y2,z2; ...]
%	direction			%미사일 진행방향을 나타내는 단위벡터 [x,y,z]
%	t 					%시간값을 지정하기 위한 임시변수

function track_cell = getTrack(time_limit, hit_range, speed_fighter, speed_missile, init_fighter_pos, init_missile_pos)
	% 입력부: 
	% 전투기/미사일 항적행렬 초기값 지정 (t=1)
	tmp_fighter_track(1, : ) = init_fighter_pos;
	tmp_missile_track(1, : ) = init_missile_pos;

	% 계산부:
	% t값 초기화, 미사일 방향 단위벡터 선언
	t = 2;
	direction = [];
	while (t <= time_limit)
        tmp_fighter_track(t, : ) = getFighterPos(t, speed_fighter, init_fighter_pos);	%전투기 좌표 계산 함수

        prev_f_pos = tmp_fighter_track(t-1, :); %t-1 에서의 전투기 좌표
        prev_m_pos = tmp_missile_track(t-1, :); %t-1 에서의 미사일 좌표
        direction = getMissileDirection(prev_f_pos, prev_m_pos);			%미사일 진행방향 단위벡터 계산 함수

        tmp_missile_track(t, : ) = getNextMissilePos(prev_missile_pos, direction, speed_missile);	%미사일 좌표 계산 함수

        % 명중하거나 or 시간 초과되면 항적 기록 종료
        if (isHit(hit_range, tmp_fighter_track(t,:), tmp_missile_track(t,:)) | t>=time_limit)
        	break;
        end

        t = t+1;
    end

	% 출력부:
    track_cell(1) = {t};					%종료시간
    track_cell(2) = {tmp_fighter_track};	%전투기 항적 행렬
    track_cell(3) = {tmp_missile_track};	%미사일 항적 행렬
    track_cell(4) = {isHit(hit_range, tmp_fighter_track(t,:), tmp_missile_track(t,:))}				%명중 여부

end