%RAND  ��l���z�̋[������
%
%   R = RAND(N) �́A�J��� (0,1) ��̕W����l���z������o�����[�������l��
%   �܂� N�~N �̍s���Ԃ��܂��BRAND(M,N) �܂��� RAND([M,N]) �́AM�~N �̍s���
%   �Ԃ��܂��BRAND(M,N,P,...) �܂��� RAND([M,N,P,...]) �́AM�~N�~P�~... �̔z���
%   �Ԃ��܂��BRAND �́A�X�J����Ԃ��܂��BRAND(SIZE(A)) �́AA �Ɠ����T�C�Y�̔z���
%   �Ԃ��܂��B
%
%   R = RAND(..., 'double') �܂��� R = RAND(..., 'single') �́A�w�肵���N���X
%   �̈�l�Ȓl�̔z���Ԃ��܂��B
%
%   ����: �T�C�Y�̓��� M, N, P... �́A�񕉂̐����ł���K�v������܂��B
%   ���̐����́A0 �Ƃ��Ĉ����܂��B
%
%   RAND �Ő������ꂽ����́ARAND, RANDI, RANDN �Ɋ�Â���l�[�������������
%   ������ԂŒ�`����܂��B���̃v���p�e�B�ƃ��\�b�h���g���ăf�t�H���g�̗���
%   �X�g���[���𐧌䂵�܂��B�f�t�H���g�̃X�g���[���Ɋւ���ڍׂ́ARANDSTREAM ��
%   �Q�Ƃ��Ă��������B
%
%   �f�t�H���g�̃X�g���[���𓯂��Œ肵����ԂɍĐݒ肷��ƁA�J��Ԃ��v�Z��
%   �\�ɂȂ�܂��B�X�g���[����ʂ̏�Ԃɐݒ肷��ƁA�v�Z���ŗL�ɂ��܂����A
%   ���v�I�ȓ��������P���܂���BMATLAB�́A�N������x�ɓ�����Ԃ��g�p���邽�߁A
%   RAND, RANDN, RANDI �́A��Ԃ��ύX����Ȃ�����A�e�Z�b�V�����œ��������
%   �������܂��B
%
%   ��:
%
%      ��� [a, b] ��̈�l���z����l�𐶐����܂��B
%         r = a + (b-a).*rand(100,1);
%
%      �ݒ� 1:n ��̈�l���z���琮���l�𐶐����܂��B
%         r = randi(100,1);
%
%      �f�t�H���g�̃X�g���[���̌��݂̏�Ԃ�ۑ����� 5 �̒l�𐶐����A
%      ��Ԃ�߂��Ă���A���̃V�[�P���X���J��Ԃ��܂��B
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         u1 = rand(1,5)
%         defaultStream.State = savedState;
%         u2 = rand(1.5); % u1 �Ɛ��m�ɓ����l���܂݂܂��B
%
%   �Q�l RANDI, RANDN, RANDSTREAM, RANDSTREAM/RAND, RANDSTREAM.GETDEFAULTSTREAM,
%        SPRAND, SPRANDN, RANDPERM.


%   Copyright 1984-2008 The MathWorks, Inc.
