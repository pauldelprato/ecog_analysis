%RANDI  ���U��l���z����̋[����������
%
%   R = RANDI(IMAX,N) �́A1:IMAX ��̗��U��l���z���瓾����[�����������l��
%   �܂� N�~N �̍s���Ԃ��܂��BRANDI(IMAX,M,N) �܂��� RANDI(IMAX,[M,N]) �́A
%   M�~N �̍s���Ԃ��܂��BRANDI(IMAX,M,N,P,...) �܂��� RANDI(IMAX,[M,N,P,...]) �́A
%   M�~N�~P�~... �̔z���Ԃ��܂��BRANDI(IMAX) �́A�X�J����Ԃ��܂��B
%   RANDI(IMAX,SIZE(A)) �́AA �Ɠ����T�C�Y�̔z���Ԃ��܂��B
%
%   R = RANDI([IMIN,IMAX],...) �́AIMIN:IMAX ��̗��U��l���z���瓾����
%   �����l���܂� N�~N �̍s���Ԃ��܂��B
%
%   R = RANDI(..., CLASSNAME) �́A�N���X CLASSNAME �̐����l�̔z���Ԃ��܂��B
%
%   ����: �T�C�Y�̓��� M, N, P... �́A�񕉂̐����ł���K�v������܂��B
%   ���̐����́A0 �Ƃ��Ĉ����܂��B
%
%   RANDI �Ő������ꂽ����́ARAND, RANDI, RANDN �Ɋ�Â���l�[�������������
%   ������ԂŒ�`����܂��BRANDI �́A�e�����l�𐶐����邽�߂Ƀf�t�H���g��
%   �X�g���[������ 1 �̈�l�Ȓl���g�p���܂��B���̃v���p�e�B�ƃ��\�b�h���g����
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
%      �ݒ� 1:10 ��̈�l���z���琮���l�𐶐����܂��B
%         r = randi(10,100,1);
%
%      ��l�� 1:10 ���瓾���鐮���̐����z��𐶐����܂��B
%         r = randi(10,100,1,'uint32');
%
%      ��l�� -10:10 ���瓾���鐮���l�𐶐����܂��B
%         r = randi([-10 10],100,1);
%
%      �f�t�H���g�̃X�g���[���̌��݂̏�Ԃ�ۑ����� 5 �̐����l�𐶐����A
%      ��Ԃ�߂��Ă���A���̃V�[�P���X���J��Ԃ��܂��B
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         i1 = randi(10,1,5)
%         defaultStream.State = savedState;
%         i2 = randi(10,1,5) % i1 �Ɛ��m�ɓ����l���܂݂܂�
%
%   �Q�l RAND, RANDN, RANDSTREAM, RANDSTREAM/RANDI, RANDSTREAM.GETDEFAULTSTREAM.


%   Copyright 2008 The MathWorks, Inc. 
