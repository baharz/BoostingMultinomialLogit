% Written by Bahar Zarin, 2015

function [] = weighted_random(XMAT1,weights)
    % Weights: a vector with number of humans elemnts
    % indices: a vector with n_selected elements which are selected indices
    global XMAT NCS
    
    NCS1= size(XMAT1,1);
    n_selected = NCS;
    
    XMAT=zeros(n_selected,size(XMAT1,2));
    cum_weights = cumsum(weights);
    total_sum = cum_weights(NCS1);
    already_selected = zeros(1,NCS1);
    cur_n_selected = 0;
    while cur_n_selected<n_selected
        Rnd = randi(total_sum);
        Slc_indx = find(cum_weights >= Rnd);
        if already_selected(1, Slc_indx(1))== 0
         already_selected(1, Slc_indx(1))= 1;
         cur_n_selected = cur_n_selected + 1;
        end;
    end;
    idcase_selected= find(already_selected);
    XMAT=XMAT1(idcase_selected,:);
    for n=1:n_selected
      XMAT(n,1)=n;
    end;
end