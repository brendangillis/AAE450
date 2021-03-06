function Plot_Pareto_Analysis(options, combinations) 
  %dev: Joseph Kirchhoff
  %implementation: pass a struct in the options field with cost, science,
  %reliability as '.cost', '.science', '.reliability' and then a struct
  %variable to trace the design decisions

  %Formating stuff
  nFont=18;     %Font Size
  ms=12;        %Marker Size
  lw=1.5;         %Line Width
  Folder = pwd; 
  p_dir_figures = [Folder '\Figures\'];

  % Create a fake struct with random variables ------------------------------
% This is just for dev 

    rng('default');
    s = rng; %initialize random generator

% The struct will also need to have a variable for tracing design decisions
% for now I'll just create a struct with random variables (0->1) for cost,
% science and reliability. 

%     options.cost = rand(1,1000) 
%     options.science = rand(1,1000)
%     options.reliability = rand(1,1000)


    %Calculate max + standard deviation to find the 'best' options

    maxCost = max(options.cost);
    maxScience = max(options.science);
    maxReliability = max(options.reliability);

    stdCost = std(options.cost);
    stdScience = std(options.science);    

    %Plots with all of the data (just to show design decisions) 
%    clf(1);
    figure (1);

%     set(gcf,'color','w');
%     set(gcf, 'Units', 'Normalized', 'OuterPosition',  [0, 0.04, 0.65, 1]);
%     %plot(temp,time,'k','LineWidth',lw*4,'LineStyle','-')
%     set(gca,'FontSize',nFont);
    hold on;
    
    c = linspace(1,1,length(options.cost))'.*(options.cost/maxCost + options.science/maxScience);
    s = scatter(options.cost, options.science);  
%     set(gca,'TickLabelInterpreter','latex')
    xlabel('Relative Cost (Millions of Dollars)','interpreter','latex')
    ylabel('Science','interpreter','latex')
    title ('Science | Cost Pareto Analysis')
    grid on;

%     ax = gca;
%     outerpos = ax.OuterPosition;
%     ti = ax.TightInset; 
%     left = outerpos(1) + ti(1);
%     bottom = outerpos(2) + ti(2);
%     ax_width = outerpos(3) - ti(1) - ti(3);
%     ax_height = outerpos(4) - ti(2) - ti(4);
%     ax.Position = [left bottom ax_width ax_height];
%     fig = gcf;
% 
%     print(fig,[p_dir_figures 'Cost_Science'],'-depsc')
%     print(fig,[p_dir_figures 'Cost_Science'],'-dpng')  

    hold off;

    %Narrow in on designs within two standard devs of the max for each 

%     figure (2);
%     options.filteredCost = options.cost( (options.cost >= maxCost-stdCost) & (options.science >= maxScience-stdScience) );
%     options.filteredScience = options.science( (options.cost >= maxCost-stdCost) & (options.science >= maxScience-stdScience) );
% 
%     set(gcf,'color','w');
%     set(gcf, 'Units', 'Normalized', 'OuterPosition',  [0, 0.04, 0.65, 1]);
%     %plot(temp,time,'k','LineWidth',lw*4,'LineStyle','-')
%     set(gca,'FontSize',nFont);
%     hold on;
% 
%     c = linspace(1,1,length(options.filteredCost))'.*(options.filteredCost/maxCost + options.filteredScience/maxScience);
%     s = scatter(options.filteredCost, options.filteredScience,[], c);  
%     set(gca,'TickLabelInterpreter','latex')
%     xlabel('Cost','interpreter','latex')
%     ylabel('Science','interpreter','latex')
%     title ('Filtered Science | Cost Pareto Analysis')
%     grid on;
% 
%     ax = gca;
%     outerpos = ax.OuterPosition;
%     ti = ax.TightInset; 
%     left = outerpos(1) + ti(1);
%     bottom = outerpos(2) + ti(2);
%     ax_width = outerpos(3) - ti(1) - ti(3);
%     ax_height = outerpos(4) - ti(2) - ti(4);
%     ax.Position = [left bottom ax_width ax_height];
%     fig = gcf;
% 
%     hold off;

 %   clf(3);
    figure (3);

%     set(gcf,'color','w');
%     set(gcf, 'Units', 'Normalized', 'OuterPosition',  [0, 0.04, 0.65, 1]);
%     %plot(temp,time,'k','LineWidth',lw*4,'LineStyle','-')
%     set(gca,'FontSize',nFont);
    hold on;

    c = linspace(1,1,length(options.cost))'.*(options.reliability/maxReliability + options.science/maxScience);
    s = scatter(options.reliability, options.science);%,[], c);  
    set(gca,'TickLabelInterpreter','latex')
    xlabel('Reliability','interpreter','latex')
    ylabel('Science','interpreter','latex')
    title ('Science | Reliability Pareto Analysis')
    grid on;

%     ax = gca;
%     outerpos = ax.OuterPosition;
%     ti = ax.TightInset; 
%     left = outerpos(1) + ti(1);
%     bottom = outerpos(2) + ti(2);
%     ax_width = outerpos(3) - ti(1) - ti(3);
%     ax_height = outerpos(4) - ti(2) - ti(4);
%     ax.Position = [left bottom ax_width ax_height];
%     fig = gcf;
% 
%     print(fig,[p_dir_figures 'Cost_Science'],'-depsc')
%     print(fig,[p_dir_figures 'Cost_Science'],'-dpng')  

    hold off;
    
    
    % Create plots with each of the different architecture differences
    % ex: the power sources
    
    fn = fieldnames(combinations);
    c = struct2table (combinations);
    color_list = {'r','c','k','b','r','g','m','c','k'};
    
for k=1:numel(fn)
    
    figure(3+k)
    
    [G, ID] = findgroups(c(:,k))
    leg = [];
 
    for l = 1:length(unique(G))
 
        s = scatter(options.cost(G==l), options.science(G==l), 'filled',color_list{l});%,[], c); 
        leg = [leg ID{l,1}];
       
    hold on;
        
    end
    leg
    legend(leg)
    set(gca,'TickLabelInterpreter','latex')
    xlabel('Cost','interpreter','latex')
    ylabel('Science','interpreter','latex')
    title (strcat('Science | Cost Pareto Analysis: ',fn(k)))
    grid on;
    
end
    
    
    
end