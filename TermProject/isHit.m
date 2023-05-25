% 프로그램 isHit.m : 명중 여부 판별 함수. sub function of "missile simulator" Project,
% 2023.05.24, Chang-in Baek
% input var:
%	hit_range		%명중판정 거리
%	pos_a			%항적행렬a [x,y,z; ...] 
%	pos_b			%항적행렬b [x,y,z; ...]
% output var :
% 	is_hit			%(logical) true : 명중, false : 불명

function is_hit = isHit(hit_range, pos_a, pos_b )
	is_hit = false; 		%명중여부 논리변수 초기화
    
	distance = norm(pos_a(end, :)-pos_b(end, :));	%두 항적의 최종 좌표간 거리 계산

	%명중판정
	if (distance <= hit_range)
		is_hit = true;
	end

end