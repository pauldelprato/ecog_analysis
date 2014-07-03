%RANDI  離散一様分布からの擬似乱数整数
%
%   R = RANDI(S,IMAX,N) は、1:IMAX 上の離散一様分布から得られる擬似乱数整数値
%   を含む N×N の行列を返します。RANDI は、乱数ストリーム S からこれらの値を取得
%   します。RANDI(S,IMAX,M,N) または RANDI(S,IMAX,[M,N]) は、M×N の行列を返します。
%   RANDI(S,IMAX,M,N,P,...) or RANDI(S,IMAX,[M,N,P,...]) は、M×N×P×... の配列を
%   返します。RANDI(S,IMAX) は、スカラを返します。RANDI(S,IMAX,SIZE(A)) は、
%   A と同じサイズの配列を返します。
%
%   R = RANDI(S,[IMIN,IMAX],...) は、IMIN:IMAX 上の離散一様分布から得られる
%   整数値を含む N×N の行列を返します。
%
%   R = RANDI(..., CLASSNAME) は、クラス CLASSNAME の整数値の配列を返します。
%
%   注意: サイズの入力 M, N, P... は、非負の整数である必要があります。
%   負の整数は、0 として扱われます。
%
%   RANDI で生成される数列は、乱数ストリーム S の内部状態で定義されます。
%   RANDI は、各整数値を生成するために S から 1 つの一様な値を使用します。
%   ストリームを同じ固定した状態に再設定すると、繰り返し計算が可能になります。
%   ストリームを別の状態に設定すると、計算を固有にしますが、統計的な特性を
%   改善しません。
%
%   参考 RANDI, RANDSTREAM, RANDSTREAM/RAND, RANDSTREAM/RANDN.


%   Copyright 2008 The MathWorks, Inc. 
