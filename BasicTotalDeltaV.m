

g				= 9.81; % [m/s^2]

Isp_starship	= 380;  % [s]
m_p_starship	= 1200; % [metric ton]
m_i_starship	= 80;	% [metric ton]

Isp_centaur		= 453;  % [s]
m_p_centaur		= 20.8; % [metric ton]
m_i_centaur		= 2.46;	% [metric ton]

Isp_F9Upper		= 363;  % [s]
m_p_F9Upper		= 92;	% [metric ton]
m_i_F9Upper		= 2;	% [metric ton]

Isp_gem46		= 274; % [s]
m_p_gem46		= 16.9; % [metric ton]
m_i_gem46		= 2.28;	% [metric ton]

Isp_castor	= 282.4;	% [s]
m_p_castor	= 13.1;		% [metric ton]
m_i_castor	= 1.9;		% [metric ton]

m_pl			= [1, 2, 3];	% [metric ton]

dV_LEO			= 9800;		% [m/s]
dV_GEO			= 13650;	% [m/s]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Config 1
dV_centaur		= g*Isp_centaur*log( (m_i_centaur+m_p_centaur + m_pl) ./ (m_i_centaur + m_pl) );
dV_net1			= dV_GEO + dV_centaur;


%Config 2
dV_starship		= g*Isp_starship*log( (m_i_starship+m_p_starship+m_i_F9Upper+m_p_F9Upper+m_pl) ./ (m_i_starship + m_i_F9Upper + m_p_F9Upper + m_pl) );
dV_F9Upper		= g*Isp_F9Upper*log( (m_i_F9Upper+m_p_F9Upper + m_pl) ./ (m_i_F9Upper + m_pl) );
dV_net2			= dV_LEO + dV_starship + dV_F9Upper;

%Config 3
dV_starship		= g*Isp_starship*log( (m_i_starship+m_p_starship+m_i_centaur+m_p_centaur+m_pl) ./ (m_i_starship + m_i_centaur + m_p_centaur + m_pl) );
dV_centaur		= g*Isp_centaur*log( (m_i_centaur+m_p_centaur + m_pl) ./ (m_i_centaur + m_pl) );
dV_net3			= dV_LEO + dV_starship + dV_centaur;

%Config 4 and 5
for num = [1, 2]
	dV_starship		= g*Isp_starship*log( (m_i_starship+m_p_starship+m_i_centaur+m_p_centaur+num*(m_i_gem46+m_p_gem46)+m_pl) ./ (m_i_starship + m_i_centaur + m_p_centaur + num*(m_i_gem46+m_p_gem46) + m_pl) );
	dV_gem46		= g*Isp_gem46*log( (m_i_centaur+m_p_centaur+num*(m_i_gem46+m_p_gem46)+m_pl) ./ (m_p_centaur + num*m_i_gem46 + m_pl) );
	dV_centaur		= g*Isp_centaur*log( (m_i_centaur+m_p_centaur + m_pl) ./ (m_i_centaur + m_pl) );
	dV_netGem(num, :)	= dV_LEO + dV_starship + dV_gem46+ dV_centaur;
end

%Config 6, 7, 8
for num = [1, 2, 3]
	dV_starship		= g*Isp_starship*log( (m_i_starship+m_p_starship+m_i_centaur+m_p_centaur+num*(m_i_castor+m_p_castor)+m_pl) ./ (m_i_starship + m_i_centaur + m_p_centaur + num*(m_i_castor+m_p_castor) + m_pl) );
	dV_castor		= g*Isp_castor*log( (m_i_centaur+m_p_centaur+num*(m_i_castor+m_p_castor)+m_pl) ./ (m_p_centaur + num*m_i_castor + m_pl) );
	dV_centaur		= g*Isp_centaur*log( (m_i_centaur+m_p_centaur + m_pl) ./ (m_i_centaur + m_pl) );
	dV_netCast(num, :)	= dV_LEO + dV_starship + dV_castor+ dV_centaur;
end

% h = figure();
% hold on
% grid on
% set(gca, 'Box', 'on');
% title('Delta V provided for Various Mass Spacecraft', 'Fontsize', 12);
% xlabel('Spacecraft Mass [metric t]', 'Fontsize', 10);
% ylabel('Delta V [km/s]', 'Fontsize', 10);
% ylim([0, 1.05*max(dV_net/1000)]
% plot(m_pl, dV_net/1000, 'k', 'linewidth', 1);
% plot(m_pl, (dV_net-dV_centaur)/1000, 'r--', 'linewidth', 1);
% plot(m_pl, dV_LEO*ones(2^10, 1)/1000, 'b--', 'linewidth', 1);
% legend('Final DeltaV', 'DeltaV after Starship', 'DeltaV to LEO', 'Location','southeast')