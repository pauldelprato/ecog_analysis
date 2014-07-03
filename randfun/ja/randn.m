%RANDN  正規分布の擬似乱数
%
%   R = RAND(N) は、標準正規分布から取り出される擬似乱数値を含む N×N の行列を
%   返します。RANDN(M,N) または RANDN([M,N]) は、M×N の行列を返します。
%   RANDN(M,N,P,...) または RANDN([M,N,P,...]) は、M×N×P×... の配列を返します。
%   RANDN は、スカラを返します。RANDN(SIZE(A)) は、A と同じサイズの配列を返します。
%
%   R = RANDN(..., 'double') または R = RANDN(..., 'single') は、指定した
%   クラスの正規値の配列を返します。
%
%   注意: サイズの入力 M, N, P... は、非負の整数である必要があります。
%   負の整数は、0 として扱われます。
%
%   RANDN で生成された数列は、RAND, RANDI, RANDN に基づく一様擬似乱数発生器の
%   内部状態で定義されます。RANDN は、各正規値を生成するためにデフォルトの
%   ストリームから複数の一様な値を使用します。そのプロパティとメソッドを使って
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
%      平均 1 で標準偏差が 2 の正規分布から値を生成します。
%         r = 1 + 2.*randn(100,1);
%
%      指定したベクトルと共分散行列を持つ 2 変数正規分布から値を生成します。
%         mu = [1 2];
%         Sigma = [1 .5; .5 2]; R = chol(Sigma);
%         z = repmat(mu,100,1) + randn(100,2)*R;
%
%      デフォルトのストリームの現在の状態を保存して 5 つの値を生成し、
%      状態を戻してから、そのシーケンスを繰り返します。
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         z1 = randn(1,5)
%         defaultStream.State = savedState;
%         z2 = randn(1,5) % z1 と正確に同じ値を含みます。
%
%   参考 RAND, RANDI, RANDSTREAM, RANDSTREAM/RANDN, RANDSTREAM.GETDEFAULTSTREAM.


%   Copyright 1984-2008 The MathWorks, Inc.
