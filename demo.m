% demo
% modified from the code from Karanam, S., Li, Y., and Radke, R.J.: ��Person re-identification with
% discriminatively trained viewpoint invariant dictionaries��, IEEE Conf.
% Computer Vision and Pattern Recognition (CVPR), Boston, USA, 2015,pp. 4516�C4524
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
% save Rank_orthogonal_prid2 %�µĲ���MaxIteration_num=1;beta = 0.002;
% save Rank_orthogonal_prid3 %�µĲ���nIters=2;���������ȵ�metaface����
save Rank_orthogonal_ilids3%%�µĲ���nIters=2;���������ȵ�metaface����
% save rank_original_prid % load('prid_Dictionary.mat');������ԭ����
% save rank_original_prid2 %�Լ�����train���ݣ�����ԭ����
for m = 1 : 25
    fprintf('%4d    %4.2f%%\n', m, rank(m));
end