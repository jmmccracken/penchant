B = [0:0.1:1.0];
xytol = [0:0.1:1];
lag = 1;

leans_stored = nan(length(B),length(xytol));
leans_keep = nan(1,length(lag));

liblength = 200;
hitspace = 5;
hititer = 0;
x = zeros(1,liblength);
x(2) = 2;
for xiter = 2:1:liblength,
    if( hititer > hitspace ),
        x(xiter) = 2;
        hititer = 0;
    end;
    hititer = hititer + 1;
end;

for lstep = 1:1:length(lag), 
    for outer = 1:1:length(xytol),
        for step = 1:1:length(B),

            fprintf('B = %.2f; xytol = %.2f; lag = %i ...',B(step),xytol(outer),lag(lstep));
            tic;
            y = zeros(1,length(x));
            for iter = 2:1:length(y),
                y(iter) = x(iter-1) + B(step)*randn();
            end;

            leans_temp = leans_lagged(x,y,0,xytol(outer),lag(lstep));
            leans_stored(step,outer) = leans_temp(1,2);
            leans_keep(1,lstep) = leans_temp(1,2);
            
    %         if( isnan(leans_stored(step,outer)) ),
    %             pause
    %         end;

            fprintf(' done. [%.3f]\n',toc);

        end;
    end;
end;
