%RANDSTREAM  �����X�g���[��
%
%   MATLAB �� (�[��) �����́A�����̗����X�g���[�����琬��܂��B�����̔z���
%   ��������ł��ȒP�ȕ��@�́ARAND, RANDN �܂��� RANDI ���g�p���邱�Ƃł��B
%   �����̂��ׂĂ̊֐��́A�f�t�H���g�̃X�g���[���Ƃ��Ēm���Ă���A��l������
%   �����X�g���[���Ɉˑ����܂��B�f�t�H���g�̃X�g���[������ʁX�ɋ@�\���鑼��
%   �X�g���[�����쐬���邱�Ƃ��ł��A�����̔z��𐶐����邽�߂ɁA������ RAND, 
%   RANDN �܂��� RANDI ���\�b�h���g�p���邱�Ƃ��ł��܂��B����ɁA�����X�g���[����
%   �쐬���A������f�t�H���g�̃X�g���[���ɂ��邱�Ƃ��\�ł��B
%
%   �P��̗����X�g���[�����쐬����ɂ́ARANDSTREAM �R���X�g���N�^�A�܂��́A
%   RANDSTREAM.CREATE �t�@�N�g�����\�b�h�̂����ꂩ���g�p���Ă��������B
%   �����̓Ɨ��ȗ����X�g���[�����쐬����ɂ́ARANDSTREAM.CREATE ���g�p���Ă��������B
%
%   STREAM = RANDSTREAM.GETDEFAULTSTREAM �́A�f�t�H���g�̗����X�g���[���A
%   ���Ȃ킿�ARAND, RANDI, RANDN �֐��Ō��ݎg�p����Ă�����̂�Ԃ��܂��B
%
%   PREVSTREAM = RANDSTREAM.SETDEFAULTSTREAM(STREAM) �́A���݂̃f�t�H���g��
%   �X�g���[����Ԃ��ARAND, RANDI, RANDN �֐��ŐV���Ƀf�t�H���g�Ƃ��Ďg�p����
%   �����X�g���[�� STREAM ���w�肵�܂��B
%
%   �����X�g���[�� S �́A���̓���𐧌䂷��v���p�e�B�������Ă��܂��B
%   P = S.Property �܂��� S.Property = P ���g�p���āA�v���p�e�B�̃A�N�Z�X�A
%   �܂��́A������s���܂��B
%
%   RandStream �v���p�e�B:
%      Type          - (�ǂݎ���p) �X�g���[���Ŏg�p���ꂽ�������
%                      �A���S���Y���̃^�C�v�����B
%      Seed          - (�ǂݎ���p) �X�g���[�����쐬���邽�߂Ɏg����
%                      �V�[�h�l�B
%      NumStreams    - (�ǂݎ���p) �X�g���[���Ɠ����ɍ쐬���ꂽ
%                      �X�g���[�����B
%      StreamIndex   - (�ǂݎ���p) �쐬���ꂽ�X�g���[���ɂ�����
%                      �O���[�v�̒��̃X�g���[���̃C���f�b�N�X�B
%      State         - ������̓�����ԁB���̃v���p�e�B�̌`���Ɉˑ����܂���B
%                      S.State �ɑ������l�́A�O�� S.State ����ǂݍ��܂ꂽ�l��
%                      �Ȃ���΂Ȃ�܂���B
%      Substream     - ���ݐݒ肳��Ă���X�g���[���̃T�u�X�g���[����
%                      �C���f�b�N�X�B�f�t�H���g�� 1 �ł��B�����̃T�u�X�g���[���́A
%                      ���ׂĂ̔�����̃^�C�v�ŃT�|�[�g����܂���B
%      RandnAlg      - ���K���z�̋[�������l�𐶐����邽�߂� RANDN(S, ...) ��
%                      �g�p����Ă��錻�݂̃A���S���Y���B'Ziggurat' (�f�t�H���g), 
%                      'Polar', 'Inversion' �̂����ꂩ�ł��B
%      Antithetic    - S ���Ώ̂̈�l�[�������l�A���Ȃ킿�A1 ���猸�Z����
%                      �ʏ�l�𐶐����邩�ǂ����������_���l�B�f�t�H���g�� false �ł��B
%      FullPrecision - S �����S���x���g���Ēl�𐶐����邩�ǂ����������_���l�B
%                      FullPrecision �� false �̏ꍇ�A�������̔�����́A
%                      �[�������l�����Ȃ������r�b�g�ō����ɍ쐬���邱�Ƃ��ł��܂��B
%                      �f�t�H���g�� true �ł��B
%
%   �����X�g���[�� S �Ő������ꂽ�[��������́A���̗���������̓�����Ԃ�
%   ��`����܂��B'State' �v���p�e�B�ɂ�蔭����̓�����Ԃ�ۑ����ĕ������邱�ƂŁA
%   �o�͂��Đ����邱�Ƃ��ł��܂��B
%
%   ��:
%
%      3 �̓Ɨ��ȃX�g���[�����쐬����:
%         [s1,s2,s3] = RandStream.create('mrg32k3a','NumStreams',3);
%         r1 = rand(s1,100000,1); r2 = rand(s2,100000,1); r3 = rand(s3,
%         100000,1);
%         corrcoef([r1,r2,r3])
%
%      3 �̓Ɨ��ȃX�g���[���̏W������ 1 �̃X�g���[���̂ݍ쐬����:
%         s2 = RandStream.create('mrg32k3a','NumStreams',3,'StreamIndices',
%         2);
%
%      �O�̌��ʂ��Č����邽�߂ɁARAND, RANDI, RANDN �Ɋ�Â��f�t�H���g��
%      �X�g���[�����n�߂ɖ߂��悤����������Z�b�g����:
%         reset(RandStream.getDefaultStream);
%
%      RAND �̏o�͂��Č����邽�߂Ƀf�t�H���g�̃X�g���[���̏�Ԃ�ۑ�����
%      ��������:
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         u1 = rand(1,5)
%         defaultStream.State = savedState;
%         u2 = rand(1.5); % u1 �Ɛ��m�ɓ����l���܂݂܂��B
%
%      RAND, RANDI, RANDN ���f�t�H���g�̏����ݒ�ɖ߂�:
%         s = RandStream.create('mt19937ar','seed',5489);
%         RandStream.setDefaultStream(s);
%
%      �f�t�H���g�̃X�g���[��������قȂ�悤�ɏ���������:
%         s = RandStream.create('mt19937ar','seed',sum(100*clock));
%         RandStream.setDefaultStream(s);
%
%      RANDN ���g�p����A���S���Y����I������:
%         defaultStream = RandStream.getDefaultStream;
%         defaultStream.RandnAlg = 'inversion';
%
%   RandStream ���\�b�h:
%       RandStream/RandStream - �����X�g���[�����쐬�B
%       create           - �����̓Ɨ��ȗ����X�g���[�����쐬�B
%       list             - �g�p�\�ȗ���������̃A���S���Y���̃��X�g�B
%       getDefaultStream - �f�t�H���g�̗����X�g���[�����擾�B
%       setDefaultStream - �f�t�H���g�̗����X�g���[����ݒ�B
%       reset            - �X�g���[���������̓�����ԂɃ��Z�b�g�B
%       rand             - ��l���z����̋[�������B
%       randn            - �W�����K���z����̋[�������B
%       randi            - ���U��l���z����̋[�������B
%       randperm         - �����_���Ȓu���B
%
%   �Q�l RANDFUN/RAND, RANDFUN/RANDN, RANDFUN/RANDI.


%   Copyright 2008 The MathWorks, Inc. 
