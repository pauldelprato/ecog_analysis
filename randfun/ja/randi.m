%RANDI  離散一様分布からの擬似乱数整数
%
%   R = RANDI(IMAX,N) は、1:IMAX 上の離散一様分布から得られる擬似乱数整数値を
%   含む N×N の行列を返します。RANDI(IMAX,M,N) または RANDI(IMAX,[M,N]) は、
%   M×N の行列を返します。RANDI(IMAX,M,N,P,...) または RANDI(IMAX,[M,N,P,...]) は、
%   M×N×P×... の配列を返します。RANDI(IMAX) は、スカラを返します。
%   RANDI(IMAX,SIZE(A)) は、A と同じサイズの配列を返します。
%
%   R = RANDI([IMIN,IMAX],...) は、IMIN:IMAX 上の離散一様分布から得られる
%   整数値を含む N×N の行列を返します。
%
%   R = RANDI(..., CLASSNAME) は、クラス CLASSNAME の整数値の配列を返します。
%
%   注意: サイズの入力 M, N, P... は、非負の整数である必要があります。
%   負の整数は、0 として扱われます。
%
%   RANDI で生成された数列は、RAND, RANDI, RANDN に基づく一様擬似乱数発生器の
%   内部状態で定義されます。RANDI は、各整数値を生成するためにデフォルトの
%   ストリームから 1 つの一様な値を使用します。そのプロパティとメソッドを使って
%   デフォルトのストリームを制御します。デフォルトのストリームに関する詳細は、
%   RANDSTREAM を参照してください。
%
%   デフォルトのストリームを同じ固定した状態に再設定すると、繰り返し計算が
%   可能になります。ストリームを別の状態に設定すると、計算を固有にしますが、
%   統計的な特性を改善しません。MATLABは、起動する度に同じ状態を使用するため、
%   RAND, RANDN, RANDI は、状態が変更されない限り、各セッションで同じ数列を
%   発生します。
%
%   例:
%
%      設定 1:10 上の一様分布から整数値を生成します。
%         r = randi(10,100,1);
%
%      一様に 1:10 から得られる整数の整数配列を生成します。
%         r = randi(10,100,1,'uint32');
%
%      一様に -10:10 から得られる整数値を生成します。
%         r = randi([-10 10],100,1);
%
%      デフォルトのストリームの現在の状態を保存して 5 つの整数値を生成し、
%      状態を戻してから、そのシーケンスを繰り返します。
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         i1 = randi(10,1,5)
%         defaultStream.State = savedState;
%         i2 = randi(10,1,5) % i1 と正確に同じ値を含みます
%
%   参考 RAND, RANDN, RANDSTREAM, RANDSTREAM/RANDI, RANDSTREAM.GETDEFAULTSTREAM.


%   Copyright 2008 The MathWorks, Inc. 
