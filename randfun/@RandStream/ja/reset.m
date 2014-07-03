%RESET  乱数ストリームを初期の内部状態にリセット
%
%   RESET(S) は、乱数ストリーム S に対する発生器を初期の内部状態にリセットします。
%   これは、RESET がストリームの RandnAlg, Antithetic, Precision プロパティを
%   オリジナルの値に設定しないことを除いては、S をクリアして、RANDSTREAM(TYPE,...) 
%   を使用することとほとんど同じです。
%
%   RESET(S,SEED) は、乱数ストリーム S に対する発生器をシード SEED に対応する
%   初期の内部状態にリセットします。ストリームのシードをリセットすると、
%   他のストリームで独立に無効にすることができます。
%
%   ストリームのリセットは、主に作成した結果に対して使う必要があります。
%
%   参考 RANDSTREAM, RANDSTREAM/RANDSTREAM.


%   Copyright 2008 The MathWorks, Inc. 
