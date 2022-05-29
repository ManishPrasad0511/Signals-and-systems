%% Triangle Wave Animation
Np = 220;            % Number of spatial points
dx = 2*pi/Np;        % discretization size
x  = 0:dx:(6*pi);    % utilized x range

% Individual Harmonics for sawtooth wave
f1sin = cos(x);            f1cos = sin(x);
f3sin = (1/9)*cos(3*x);    f3cos = (1/9)*sin(3*x); 
f5sin = (1/25)*cos(4*x);   f5cos = (1/25)*sin(4*x);
f7sin = (1/49)*cos(4*x);   f7cos = (1/49)*sin(4*x);

Nt = 100;                % Number of points over the circles
dtheta = 2*pi/Nt;        % Discretization over circles
theta  = 0:dtheta:2*pi;  % Span the whole 2pi

% Circle points
x1=sin(x);
y1=cos(x); 

x2=(1/9)*sin(3*x); 
y2=(1/9)*cos(3*x);

x3=(1/25)*sin(4*x);
y3=(1/25)*cos(4*x);

x4=(1/49)*sin(4*x);
y4=(1/49)*cos(4*x); 

Lx=length(x);
Lw=2; Fs=12;

for i=1:length(x)
    f1=figure (1); clf;

    sp1=subplot(1,2,1);
    % 1st harmonic
    plot(x1,y1,'Color','b'); hold on; grid on;
    line([0 f1cos(i)],[0 f1sin(i)],'Color','b','LineSmoothing','on');
    set(sp1,'Position',[0.0400    0.1800    0.4    0.677]);
    xlim([-1.5 1.5]); ylim([-1.5 1.5])

    % 2nd harmonic
    plot(x2+f1cos(i),y2+f1sin(i),'Color','r'); hold on;
    line(f1cos(i)+[0 f3cos(i)],f1sin(i)+[0 f3sin(i)],'Color','r','LineSmoothing','on');

    % 3rd harmonic
    plot(x3+f1cos(i)+f3cos(i),y3+f1sin(i)+f3sin(i),'Color','g'); hold on;
    line(f3cos(i)+f1cos(i)+[0 f5cos(i)],f3sin(i)+f1sin(i)+[0 f5sin(i)],'Color','g','LineSmoothing','on');

    % 4th harmonic
    plot(x4+f1cos(i)+f3cos(i)+f5cos(i),y4+f1sin(i)+f3sin(i)+f5sin(i),'Color','k'); hold on;
    line(f3cos(i)+f1cos(i)+f5cos(i)+[0 f7cos(i)],f3sin(i)+f1sin(i)+f5sin(i)+[0 f7sin(i)],'Color','k','LineSmoothing','on');
    [xf4, yf4] = ds2nfu(f3cos(i)+f1cos(i)+f5cos(i)+f7cos(i),f3sin(i)+f1sin(i)+f5sin(i)+f7sin(i));     % Convert axes coordinates to figure coordinates for 1st axes

    title('Circles')

    sp2=subplot(1,2,2);
    plot(x,(-pi*pi/8)*sawtooth(x,1/2),'k'); hold on; grid on;
    ylim([-1.5 1.5]); xlim([0 10])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    % Convert axes coordinates to figure coordinates for 1st axes 
    [xg1, yg1] = ds2nfu(x(i),f1sin(i));    % 1st harmonic
    [xg2, yg2] = ds2nfu(x(i),f3sin(i));    % 2nd harmonic
    [xg3, yg3] = ds2nfu(x(i),f5sin(i));    % 3rd harmonic
    [xg4, yg4] = ds2nfu(x(i),f7sin(i));    % 4th harmonic
  
    plot(x(1:i),f1sin(1:i)+f3sin(1:i)+f5sin(1:i)+f7sin(1:i),'m','LineWidth',Lw); hold on; grid on;

    ylim([-1.5 1.5]); xlim([0 10])
    set(sp2,'Position',[0.52    0.178200    0.49    0.680]);

    [xgt, ygt] = ds2nfu(x(i),f1sin(i)+f3sin(i)+f5sin(i)+f7sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    annotation('line',[xf4 xgt],[yf4 ygt],'color','m','LineStyle','--');

    title('Four Harmonics of Triangle wave')
    xlabel('x')

    pause(0.01);
end