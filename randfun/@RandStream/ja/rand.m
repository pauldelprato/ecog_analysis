%RAND  一様分布からの擬似乱数
%
%   R = RAND(S,N) は、開区間 (0,1) 上の標準一様分布から取り出される擬似乱数値
%   を含む N×N の行列を返します。RAND は、乱数ストリーム S からこれらの値を
%   取得します。RAND(S,M,N) または RAND(S,[M,N]) は、M×N の行列を返します。
%   RAND(S,M,N,P,...) または RAND(S,[M,N,P,...]) は、M×N×P×... の配列を返します。
%   RAND(S) は、スカラを返します。RAND(S,SIZE(A)) は、A と同じサイズの配列を返します。
%
%   R = RAND(..., 'double') または R = RAND(..., 'single') は、指定したクラス
%   の一様な値の配列を返します。
%
%   注意: サイズの入力 M, N, P... は、非負の整数である必要があります。
%   負の整数は、0 として扱われます。
%
%   RAND で生成される数列は、乱数ストリーム S の内部状態で定義されます。
%   ストリームを同じ固定した状態に再設定すると、繰り返し計算が可能になります。
%   ストリームを別の状態に設定すると、計算を固有にしますが、統計的な特性を
%   改善しません。
%
%   参考 RAND, RANDSTREAM, RANDSTREAM/RANDI, RANDSTREAM/RANDN, 
%        RANDSTREAM/RANDPERM.


%   Copyright 2008 The MathWorks, Inc. 
