% Written by Bahar Zarin, 2015
function [new_idalt,probs, new_weights] = Prdc_per_person_matlabreg (model,weights,id_alts,VARS1)
    new_weights = weights;
    probs = mnrval(model.coef,VARS1);
    [~,new_idalt] = max(probs,[],2);
    new_idalt=new_idalt-1;
    error_ids = (id_alts ~= new_idalt);
    new_weights(error_ids) = new_weights(error_ids)+1;
end