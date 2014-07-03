%RAND  一様分布の擬似乱数
%
%   R = RAND(N) は、開区間 (0,1) 上の標準一様分布から取り出される擬似乱数値を
%   含む N×N の行列を返します。RAND(M,N) または RAND([M,N]) は、M×N の行列を
%   返します。RAND(M,N,P,...) または RAND([M,N,P,...]) は、M×N×P×... の配列を
%   返します。RAND は、スカラを返します。RAND(SIZE(A)) は、A と同じサイズの配列を
%   返します。
%
%   R = RAND(..., 'double') または R = RAND(..., 'single') は、指定したクラス
%   の一様な値の配列を返します。
%
%   注意: サイズの入力 M, N, P... は、非負の整数である必要があります。
%   負の整数は、0 として扱われます。
%
%   RAND で生成された数列は、RAND, RANDI, RANDN に基づく一様擬似乱数発生器の
%   内部状態で定義されます。そのプロパティとメソッドを使ってデフォルトの乱数
%   ストリームを制御します。デフォルトのストリームに関する詳細は、RANDSTREAM を
%   参照してください。
%
%   デフォルトのストリームを同じ固定した状態に再設定すると、繰り返し計算が
%   可能になります。ストリームを別の状態に設定すると、計算を固有にしますが、
%   統計的な特性を改善しません。MATLABは、起動する度に同じ状態を使用するため、
%   RAND, RANDN, RANDI は、状態が変更されない限り、各セッションで同じ数列を
%   発生します。
%
%   例:
%
%      区間 [a, b] 上の一様分布から値を生成します。
%         r = a + (b-a).*rand(100,1);
%
%      設定 1:n 上の一様分布から整数値を生成します。
%         r = randi(100,1);
%
%      デフォルトのストリームの現在の状態を保存して 5 つの値を生成し、
%      状態を戻してから、そのシーケンスを繰り返します。
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         u1 = rand(1,5)
%         defaultStream.State = savedState;
%         u2 = rand(1.5); % u1 と正確に同じ値を含みます。
%
%   参考 RANDI, RANDN, RANDSTREAM, RANDSTREAM/RAND, RANDSTREAM.GETDEFAULTSTREAM,
%        SPRAND, SPRANDN, RANDPERM.


%   Copyright 1984-2008 The MathWorks, Inc.
