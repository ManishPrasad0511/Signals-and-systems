%% Sawtooth Wave Animation
Np = 220;            % Number of spatial points
dx = 2*pi/Np;        % discretization size
x  = 0:dx:(6*pi);    % utilized x range

% Individual Harmonics for sawtooth wave
f1sin = 2*sin(x);         f1cos = 2*cos(x);
f3sin = -1*sin(2*x);      f3cos = -1*cos(2*x);
f5sin = (2/3)*sin(3*x);   f5cos = (2/3)*cos(3*x);
f7sin = (-0.5)*sin(4*x);  f7cos = (-0.5)*cos(4*x);

Nt = 100;                % Number of points over the circles
dtheta = 2*pi/Nt;        % Discretization over circles
theta  = 0:dtheta:2*pi;  % Span the whole 2pi

% Circle points
x1=2*cos(theta);
y1=2*sin(theta);

x2=-1*cos(2*theta);
y2=-1*sin(2*theta);

x3=(2/3)*cos(3*theta);
y3=(2/3)*sin(3*theta);

x4=(-0.5)*cos(4*theta);
y4=(-0.5)*sin(4*theta);

Lx=length(x);
Lw=2;

for i=1:length(x)
    f1=figure (1); clf;

    sp1=subplot(1,2,1);
    % 1st harmonic
    plot(x1,y1,'Color','b'); hold on; grid on;
    line([0 f1cos(i)],[0 f1sin(i)],'Color','b','LineSmoothing','on');
    set(sp1,'Position',[0.0400    0.1800    0.4    0.677]);
    xlim([-4 4]); ylim([-4 4])

    % 2nd harmonic
    plot(x2+f1cos(i),y2+f1sin(i),'Color','r'); hold on;
    line(f1cos(i)+[0 f3cos(i)],f1sin(i)+[0 f3sin(i)],'Color','r','LineSmoothing','on');

    % 3rd harmonic
    plot(x3+f1cos(i)+f3cos(i),y3+f1sin(i)+f3sin(i),'Color','g'); hold on;
    line(f3cos(i)+f1cos(i)+[0 f5cos(i)],f3sin(i)+f1sin(i)+[0 f5sin(i)],'Color','g','LineSmoothing','on');

    % 4th harmonic
    plot(x4+f1cos(i)+f3cos(i)+f5cos(i),y4+f1sin(i)+f3sin(i)+f5sin(i),'Color','k'); hold on;
    line(f3cos(i)+f1cos(i)+f5cos(i)+[0 f7cos(i)],f3sin(i)+f1sin(i)+f5sin(i)+[0 f7sin(i)],'Color','k','LineSmoothing','on');
    [xf4, yf4] = ds2nfu(f3cos(i)+f1cos(i)+f5cos(i)+f7cos(i),f3sin(i)+f1sin(i)+f5sin(i)+f7sin(i));   
    
    title('Circles')

    sp2=subplot(1,2,2);
    plot(x-pi,pi*sawtooth(x),'k'); hold on; grid on;
    ylim([-4 4]); xlim([0 10])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    % Convert axes coordinates to figure coordinates for 1st axes 
    [xg4, yg4] = ds2nfu(x(i),f7sin(i));    % 4th harmonic
  
    plot(x(1:i),f1sin(1:i)+f3sin(1:i)+f5sin(1:i)+f7sin(1:i),'LineWidth',Lw); hold on; grid on;

    ylim([-4 4]); xlim([0 10])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    [xgt, ygt] = ds2nfu(x(i),f1sin(i)+f3sin(i)+f5sin(i)+f7sin(i));
    annotation('line',[xf4 xgt],[yf4 ygt],'color','m','LineStyle','--');
    title('Four Harmonics of Sawtooth wave')
    xlabel('x')

    pause(0.01);
end