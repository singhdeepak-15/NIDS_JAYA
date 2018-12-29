function fit = Fitness(pop,val,dim)
fea = val;
for i = 1 : size(pop,1)
    %for j = 1 : size(pop,2)
        fe = val(:,pop(i,:));
        fea(:,1:dim) = fe;
        [a b] = trainClassifier_35(fea,dim);
        fit(i) = b;
    %end
end