% Written by Bahar Zarin, 2015
function [models,binary_vote,accuracy]=main(n_itrn,dbname)
global XMAT IDV
IDV = 3:11;
XMAT1=load(dbname);
%categorical_vars = [5];
XMAT1(XMAT1(:,2)==6|XMAT1(:,2)==5,2) = 4;
%dummy1 = dummyvar(XMAT1(:,5));


%XMAT1(:,categorical_vars) = [];
%XMAT1 = [XMAT1,dummy1];

idalts1 = XMAT1(:,2);
VARS1 = XMAT1(:,IDV);
NCS1= length(unique(XMAT1(:,1)));
alts=zeros(NCS1,n_itrn);
models=cell(1,n_itrn);
n_class = length(unique(XMAT1(:,2)));
probabilities=zeros(size(XMAT1,1),n_itrn*n_class);
weights=ones(NCS1,1);
logit
for i=1:n_itrn 
    
 weighted_random(XMAT1,weights);
 
 [coef,~,stat] = mnrfit(XMAT(:,IDV),categorical(XMAT(:,2)));
 %model=oursdo();
 model.coef =  coef;
 model.stat = stat;
 models{i}= model;
 [new_idalt,probs, new_weights] = Prdc_per_person_matlabreg(model,weights,idalts1,VARS1);
 %[new_depvar, probs,new_weights,new_idalt]=Prdc_per_person(model.coef,weights,XMAT1);
 alts(:,i)= new_idalt;
 probabilities(:,(i-1)*n_class+1:i*n_class) = probs;
 weights=new_weights;
end;
 binary_vote=mode(alts,2);
 accuracy = sum(binary_vote==idalts1)/length(idalts1);
 fprintf('The accuracy of the fitted model is: %2.2f',accuracy*100);
end
