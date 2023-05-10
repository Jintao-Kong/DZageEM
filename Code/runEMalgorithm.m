function [EMage,EMsigma,EMweight,EMBIC] = runEMalgorithm(data,cluster,h)
if nargin == 2    
    h = 30;
end
[kderesult,~] = AgeDistribution(data(:,1),data(:,2),h);
data2 = data(:,1);
[~,locs] = findpeaks(kderesult,1:4000);
if length(locs) < cluster
    EMage = []; EMsigma = []; EMweight=[];EMBIC= [];
else
    C = nchoosek(locs,cluster);
    [m,~] = size(C);
    weight = zeros(m,cluster);
    sigma = zeros(m,cluster);
    group = zeros(m,cluster);
    BIC = zeros(m,1);
    if cluster == 2
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end            
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML2KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 3
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML3KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 4
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML4KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 5
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML5KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 6
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML6KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 7
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML7KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 8
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML8KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);            
        end
        delete(hwait);
    elseif cluster == 9
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);        
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML9KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 10
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML10KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);                
        end
        delete(hwait);
    elseif cluster == 11
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);        
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML11KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 12
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML12KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);     
        end
        delete(hwait);
    elseif cluster == 13
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML13KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);     
        end
        delete(hwait);
    elseif cluster == 14
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML14KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);    
        end
        delete(hwait);
    elseif cluster == 15
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML15KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);    
        end
        delete(hwait);
    elseif cluster == 16
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML16KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);   
        end
        delete(hwait);
    elseif cluster == 17
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML17KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);
        end
        delete(hwait);
    elseif cluster == 18
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML18KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);  
        end
        delete(hwait);
    elseif cluster == 19
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML19KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);  
        end
        delete(hwait);
    elseif cluster == 20
        hwait = waitbar(0,'please wait...','CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
        setappdata(hwait,'canceling',0);
        for i = 1:m
            if getappdata(hwait,'canceling')
                break
            end
            initialages = C(i,:);
            [weight(i,:), sigma(i,:), group(i,:), BIC(i)]...
                = ML20KDE (data2,initialages,20);
            k = round((i/m),2)*100;
            waitbar(i/m,hwait,['Processing data:',num2str(k),'%...']);  
        end
        delete(hwait);
    end
    
    [soBIC,soIndex] = sort(BIC);
    
    if length(soBIC)<100
        range = length(soBIC);
    else
        range = round(0.2*length(soBIC));
    end
    
    preIndex = soIndex(1:range);
    newBIC = soBIC(1:range);
    newgroup = group(preIndex,:);
    newsigma = sigma(preIndex,:);
    newweight = weight(preIndex,:);
    tempindex = zeros(range,1);
    
    for i = 1:range
        tempweight = newweight(i,:);
        temp = tempweight(tempweight < 0.02);
        if length(temp) == 1
            tempindex(i) = 0;
        else
            tempindex(i) = 1;
        end
    end
    finalIndex = find(tempindex==1);
    finalage = newgroup(finalIndex,:);
    finasigma = newsigma(finalIndex,:);
    finalweight = newweight(finalIndex,:);
    finalBIC = newBIC(finalIndex,:);
    [finalhang,finallie] = size(finalage);
    finaltemp = ones(finalhang,finallie);
    
    for i = 1:finalhang
        for j = 1:finallie
            if finasigma(i,j) <20 && finalage(i,j) > 500
                finaltemp(i,j) = 0;
            elseif finasigma(i,j) > 100 && finalage(i,j) < 200
                finaltemp(i,j) = 0;
            else
                finaltemp(i,j) = 1;
            end
        end
    end
    
    IIindex = zeros(finalhang,1);
    for i = 1:finalhang
        if sum(finaltemp(i,:)) < finallie
            IIindex(i) = 0;
        else
            IIindex(i) = 1;
        end
    end
    
    idx = find(IIindex == 1);
    FFfinalage = finalage(idx,:);
    FFfinasigma = finasigma(idx,:);
    FFfinalweight = finalweight(idx,:);
    FFfinalBIC = finalBIC(idx,:);
    EMage = FFfinalage(1,:)';
    EMsigma = FFfinasigma(1,:)';
    EMweight = FFfinalweight(1,:)';
    EMBIC = FFfinalBIC(1,:);
    tempageindex = isnan(EMage);
    if sum(tempageindex) > 0
        EMage = []; EMsigma = []; EMweight=[];EMBIC= [];
    end
 
end
end