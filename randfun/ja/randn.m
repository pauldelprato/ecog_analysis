%RANDN  ���K���z�̋[������
%
%   R = RAND(N) �́A�W�����K���z������o�����[�������l���܂� N�~N �̍s���
%   �Ԃ��܂��BRANDN(M,N) �܂��� RANDN([M,N]) �́AM�~N �̍s���Ԃ��܂��B
%   RANDN(M,N,P,...) �܂��� RANDN([M,N,P,...]) �́AM�~N�~P�~... �̔z���Ԃ��܂��B
%   RANDN �́A�X�J����Ԃ��܂��BRANDN(SIZE(A)) �́AA �Ɠ����T�C�Y�̔z���Ԃ��܂��B
%
%   R = RANDN(..., 'double') �܂��� R = RANDN(..., 'single') �́A�w�肵��
%   �N���X�̐��K�l�̔z���Ԃ��܂��B
%
%   ����: �T�C�Y�̓��� M, N, P... �́A�񕉂̐����ł���K�v������܂��B
%   ���̐����́A0 �Ƃ��Ĉ����܂��B
%
%   RANDN �Ő������ꂽ����́ARAND, RANDI, RANDN �Ɋ�Â���l�[�������������
%   ������ԂŒ�`����܂��BRANDN �́A�e���K�l�𐶐����邽�߂Ƀf�t�H���g��
%   �X�g���[�����畡���̈�l�Ȓl���g�p���܂��B���̃v���p�e�B�ƃ��\�b�h���g����
%   �f�t�H���g�̃X�g���[���𐧌䂵�܂��B�f�t�H���g�̃X�g���[���Ɋւ���ڍׂ́A
%   RANDSTREAM ���Q�Ƃ��Ă��������B
%
%   �f�t�H���g�̃X�g���[���𓯂��Œ肵����ԂɍĐݒ肷��ƁA�J��Ԃ��v�Z��
%   �\�ɂȂ�܂��B�X�g���[����ʂ̏�Ԃɐݒ肷��ƁA�v�Z���ŗL�ɂ��܂����A
%   ���v�I�ȓ��������P���܂���BMATLAB�́A�N������x�ɓ�����Ԃ��g�p���邽�߁A
%   RAND, RANDN, RANDI �́A��Ԃ��ύX����Ȃ�����A�e�Z�b�V�����œ��������
%   �������܂��B
%
%   ��:
%
%      ���� 1 �ŕW���΍��� 2 �̐��K���z����l�𐶐����܂��B
%         r = 1 + 2.*randn(100,1);
%
%      �w�肵���x�N�g���Ƌ����U�s������� 2 �ϐ����K���z����l�𐶐����܂��B
%         mu = [1 2];
%         Sigma = [1 .5; .5 2]; R = chol(Sigma);
%         z = repmat(mu,100,1) + randn(100,2)*R;
%
%      �f�t�H���g�̃X�g���[���̌��݂̏�Ԃ�ۑ����� 5 �̒l�𐶐����A
%      ��Ԃ�߂��Ă���A���̃V�[�P���X���J��Ԃ��܂��B
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         z1 = randn(1,5)
%         defaultStream.State = savedState;
%         z2 = randn(1,5) % z1 �Ɛ��m�ɓ����l���܂݂܂��B
%
%   �Q�l RAND, RANDI, RANDSTREAM, RANDSTREAM/RANDN, RANDSTREAM.GETDEFAULTSTREAM.


%   Copyright 1984-2008 The MathWorks, Inc.
