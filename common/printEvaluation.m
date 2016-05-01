function printEvaluation(tc, tt, fc, ft)

    tc = rows(tc); tt = rows(tt);
    fc = rows(fc); ft = rows(ft);
    
    f = @(x) sprintf('%d', x);
    a = {'' 'Cars' 'Trucks'; ...
         'True' f(tc) f(tt); ...
         'False' f(ft) f(fc)};
    printMatrix(a);


    f = @(x) sprintf('%.2f%%', x*100);    
    acc = (tc + tt)/sum([tc, tt, fc, ft]);
    rec = tc / (tc + fc);
    ppv = tc / (tc + ft);
    npv = tt / (tt + fc);
    f1 = 2*ppv*rec / (ppv+rec);
    a = {'Accuracy' f(acc); 'Recall' f(rec); ...
         'Cars prediction value' f(ppv);...
         'Trucks prediction value' f(npv);...
         'F1' f(f1)};
    printMatrix(a);
end