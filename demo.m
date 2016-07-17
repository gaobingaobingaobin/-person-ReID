% demo
% modified from the code from Karanam, S., Li, Y., and Radke, R.J.: ‘Person re-identification with
% discriminatively trained viewpoint invariant dictionaries’, IEEE Conf.
% Computer Vision and Pattern Recognition (CVPR), Boston, USA, 2015,pp. 4516–4524
% pretrain=1;
pretrain=0;
load('ilids-vid_data.mat');
% load('prid_data.mat');
if(pretrain)
    load('ilids-vid_Dictionary.mat');
%     load('prid_Dictionary.mat');
    
else
    [D,X,Y,errs]=dvdlTrain(galleryTrainingFeatures,galleryTrainingId,probeTrainingFeatures,probeTrainingId,1e-3);
end

rank=dvdlTest(D,galleryTestingFeatures,galleryTestingId,probeTestingFeatures,probeTestingId,1e-3);
%  rank_original_prid=rank;
%   rank_original_prid2=rank;
% rank_original=rank;
% Rank_orthogonal_ilids=rank;
Rank_orthogonal_ilids3=rank;
% Rank_orthogonal_prid=rank;
% Rank_orthogonal_prid3=rank;
% save rank_original
% save Rank_orthogonal_ilids
% save Rank_orthogonal_prid2 %新的参数MaxIteration_num=1;beta = 0.002;
% save Rank_orthogonal_prid3 %新的参数nIters=2;启用了杨萌的metaface策略
save Rank_orthogonal_ilids3%%新的参数nIters=2;启用了杨萌的metaface策略
% save rank_original_prid % load('prid_Dictionary.mat');，利用原文献
% save rank_original_prid2 %自己生成train数据，利用原文献
for m = 1 : 25
    fprintf('%4d    %4.2f%%\n', m, rank(m));
end