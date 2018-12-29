clc
clear

[fn fp] = uigetfile('*.xlsx');
if fn == 0
    msgbox('NONE SELECTED');
else
    fl = fullfile(fp,fn);
    [num text raw] = xlsread(fl);
    cls = unique(text(2:end,end));
    [r c] = size(num);
    for i = 1 : length(cls)
        matchStr = regexp(text(2:end,end),char(cls(i)),'match');
        cind = cellfun(@isempty,matchStr);
        pacol = find(cind==0);
        num(pacol,c+1) = i;
    end
    
    prot = unique(text(2:end,2));
    for i = 1 : length(prot)
        matchStr = regexp(text(2:end,2),char(prot(i)),'match');
        cind = cellfun(@isempty,matchStr);
        pacol = find(cind==0);
        num(pacol,2) = i;
    end
    
    apro = unique(text(2:end,3));
    for i = 1 : length(apro)
        matchStr = regexp(text(2:end,3),char(apro(i)),'match');
        cind = cellfun(@isempty,matchStr);
        pacol = find(cind==0);
        num(pacol,3) = i;
        
    end
    
    aro = unique(text(2:end,4));
    for i = 1 : length(aro)
        matchStr = regexp(text(2:end,4),char(aro(i)),'match');
        cind = cellfun(@isempty,matchStr);
        pacol = find(cind==0);
        num(pacol,4) = i;
       
    end
    
    [man st] = JAYA(20,35,5,1,41,-5.12,5.12,num,35);
    
end