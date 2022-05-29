Np = 220;            % Number of spatial points
dx = 2*pi/Np;        % discretization size
x  = 0:dx:(6*pi);    % utilized x range

% Individual Harmonics
A=4;
f1sin = A*sin(x)/pi;        f1cos = A*cos(x)/pi;
f3sin = A*sin(3*x)/(3*pi);  f3cos = A*cos(3*x)/(3*pi);
f5sin = A*sin(5*x)/(5*pi);  f5cos = A*cos(5*x)/(5*pi);
f7sin = A*sin(7*x)/(7*pi);  f7cos = A*cos(7*x)/(7*pi);

%f=f1sin+f3sin+f5sin+f7sin;
Nt = 100;                % Number of points over the circles
dtheta = 2*pi/Nt;        % Discretization over circles
theta  = 0:dtheta:2*pi;  % Span the whole 2pi

% Circle points
x1=A/pi*cos(theta);
y1=A/pi*sin(theta);

x2=A/(3*pi)*cos(3*theta);
y2=A/(3*pi)*sin(3*theta);

x3=A/(5*pi)*cos(5*theta);
y3=A/(5*pi)*sin(5*theta);

x4=A/(7*pi)*cos(7*theta);
y4=A/(7*pi)*sin(7*theta);

Lx=length(x);
Lw=2; Fs=12;

shift = length(x);  % This is just to save the jpeg with continuing numbers
itx= 0+ shift;      % which is later used for video generation

for i=1:length(x)

    f1=figure (1); clf;

    sp1=subplot(1,2,1);
    %  -- 1st harmonic ---
    plot(x1,y1,'LineWidth',Lw,'Color','b'); hold on; grid on;
    line([0 f1cos(i)],[0 f1sin(i)],'Color','b','LineWidth',Lw,'LineSmoothing','on');
    set(sp1,'Position',[0.0400    0.1800    0.4    0.677]);
    xlim([-2.5 2.5]); ylim([-2.5 2.5])

    %  -- 2nd harmonic ---
    plot(x2+f1cos(i),y2+f1sin(i),'LineWidth',Lw,'Color','r'); hold on;
    line(f1cos(i)+[0 f3cos(i)],f1sin(i)+[0 f3sin(i)],'Color','r','LineWidth',Lw,'LineSmoothing','on');

    %  -- 3rd harmonic ---
    plot(x3+f1cos(i)+f3cos(i),y3+f1sin(i)+f3sin(i),'LineWidth',Lw,'Color','g'); hold on;
    line(f3cos(i)+f1cos(i)+[0 f5cos(i)],f3sin(i)+f1sin(i)+[0 f5sin(i)],'Color','g','LineWidth',Lw,'LineSmoothing','on');

    % -- 4th harmonic ---
    plot(x4+f1cos(i)+f3cos(i)+f5cos(i),y4+f1sin(i)+f3sin(i)+f5sin(i),'LineWidth',Lw,'Color','k'); hold on;
    line(f3cos(i)+f1cos(i)+f5cos(i)+[0 f7cos(i)],f3sin(i)+f1sin(i)+f5sin(i)+[0 f7sin(i)],'Color','k','LineWidth',Lw,'LineSmoothing','on');
    [xf4, yf4] = ds2nfu(f3cos(i)+f1cos(i)+f5cos(i)+f7cos(i),f3sin(i)+f1sin(i)+f5sin(i)+f7sin(i));     % Convert axes coordinates to figure coordinates for 1st axes

    title('Harmonic Circles','FontSize',Fs,'FontName','Century Gothic')

    sp2=subplot(1,2,2);
    ylim([-2.5 2.5]); xlim([0 19])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    % Convert axes coordinates to figure coordinates for 1st axes
    %  -- 1st harmonic ---
    [xg1, yg1] = ds2nfu(x(i),f1sin(i));

    %  -- 2nd harmonic ---
    [xg2, yg2] = ds2nfu(x(i),f3sin(i)); % Convert axes coordinates to figure coordinates for 1st axes

    %  -- 3rd harmonic ---
    [xg3, yg3] = ds2nfu(x(i),f5sin(i)); % Convert axes coordinates to figure coordinates for 1st axes

    % -- 4th harmonic ---
    [xg4, yg4] = ds2nfu(x(i),f7sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
  
    plot(x(1:i),f1sin(1:i)+f3sin(1:i)+f5sin(1:i)+f7sin(1:i),'m','LineWidth',Lw); hold on; grid on;

    ylim([-2.5 2.5]); xlim([0 19])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    [xgt, ygt] = ds2nfu(x(i),f1sin(i)+f3sin(i)+f5sin(i)+f7sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    annotation('line',[xf4 xgt],[yf4 ygt],'color','m','LineStyle','--','LineWidth',Lw);

    title('Summation of First Four Harmonics','FontSize',Fs,'FontName','Century Gothic')
    xlabel('x','FontSize',Fs,'FontName','Century Gothic')

    pause(0.01);
end