%RANDSTREAM  乱数ストリーム
%
%   MATLAB の (擬似) 乱数は、複数の乱数ストリームから成ります。乱数の配列を
%   生成する最も簡単な方法は、RAND, RANDN または RANDI を使用することです。
%   これらのすべての関数は、デフォルトのストリームとして知られている、一様乱数の
%   同じストリームに依存します。デフォルトのストリームから別々に機能する他の
%   ストリームを作成することができ、乱数の配列を生成するために、それらの RAND, 
%   RANDN または RANDI メソッドを使用することができます。さらに、乱数ストリームを
%   作成し、それをデフォルトのストリームにすることも可能です。
%
%   単一の乱数ストリームを作成するには、RANDSTREAM コンストラクタ、または、
%   RANDSTREAM.CREATE ファクトリメソッドのいずれかを使用してください。
%   複数の独立な乱数ストリームを作成するには、RANDSTREAM.CREATE を使用してください。
%
%   STREAM = RANDSTREAM.GETDEFAULTSTREAM は、デフォルトの乱数ストリーム、
%   すなわち、RAND, RANDI, RANDN 関数で現在使用されているものを返します。
%
%   PREVSTREAM = RANDSTREAM.SETDEFAULTSTREAM(STREAM) は、現在のデフォルトの
%   ストリームを返し、RAND, RANDI, RANDN 関数で新たにデフォルトとして使用する
%   乱数ストリーム STREAM を指定します。
%
%   乱数ストリーム S は、その動作を制御するプロパティを持っています。
%   P = S.Property または S.Property = P を使用して、プロパティのアクセス、
%   または、代入を行います。
%
%   RandStream プロパティ:
%      Type          - (読み取り専用) ストリームで使用された発生器の
%                      アルゴリズムのタイプを特定。
%      Seed          - (読み取り専用) ストリームを作成するために使われる
%                      シード値。
%      NumStreams    - (読み取り専用) ストリームと同時に作成された
%                      ストリーム数。
%      StreamIndex   - (読み取り専用) 作成されたストリームにおける
%                      グループの中のストリームのインデックス。
%      State         - 発生器の内部状態。このプロパティの形式に依存しません。
%                      S.State に代入する値は、前の S.State から読み込まれた値で
%                      なければなりません。
%      Substream     - 現在設定されているストリームのサブストリームの
%                      インデックス。デフォルトは 1 です。複数のサブストリームは、
%                      すべての発生器のタイプでサポートされません。
%      RandnAlg      - 正規分布の擬似乱数値を生成するために RANDN(S, ...) で
%                      使用されている現在のアルゴリズム。'Ziggurat' (デフォルト), 
%                      'Polar', 'Inversion' のいずれかです。
%      Antithetic    - S が対称の一様擬似乱数値、すなわち、1 から減算した
%                      通常値を生成するかどうかを示す論理値。デフォルトは false です。
%      FullPrecision - S が完全精度を使って値を生成するかどうかを示す論理値。
%                      FullPrecision が false の場合、いくつかの発生器は、
%                      擬似乱数値を少ない乱数ビットで高速に作成することができます。
%                      デフォルトは true です。
%
%   乱数ストリーム S で生成された擬似乱数列は、その乱数発生器の内部状態で
%   定義されます。'State' プロパティにより発生器の内部状態を保存して復元することで、
%   出力を再生することができます。
%
%   例:
%
%      3 つの独立なストリームを作成する:
%         [s1,s2,s3] = RandStream.create('mrg32k3a','NumStreams',3);
%         r1 = rand(s1,100000,1); r2 = rand(s2,100000,1); r3 = rand(s3,
%         100000,1);
%         corrcoef([r1,r2,r3])
%
%      3 つの独立なストリームの集合から 1 つのストリームのみ作成する:
%         s2 = RandStream.create('mrg32k3a','NumStreams',3,'StreamIndices',
%         2);
%
%      前の結果を再現するために、RAND, RANDI, RANDN に基づくデフォルトの
%      ストリームを始めに戻すよう発生器をリセットする:
%         reset(RandStream.getDefaultStream);
%
%      RAND の出力を再現するためにデフォルトのストリームの状態を保存して
%      復元する:
%         defaultStream = RandStream.getDefaultStream;
%         savedState = defaultStream.State;
%         u1 = rand(1,5)
%         defaultStream.State = savedState;
%         u2 = rand(1.5); % u1 と正確に同じ値を含みます。
%
%      RAND, RANDI, RANDN をデフォルトの初期設定に戻す:
%         s = RandStream.create('mt19937ar','seed',5489);
%         RandStream.setDefaultStream(s);
%
%      デフォルトのストリームが毎回異なるように初期化する:
%         s = RandStream.create('mt19937ar','seed',sum(100*clock));
%         RandStream.setDefaultStream(s);
%
%      RANDN を使用するアルゴリズムを選択する:
%         defaultStream = RandStream.getDefaultStream;
%         defaultStream.RandnAlg = 'inversion';
%
%   RandStream メソッド:
%       RandStream/RandStream - 乱数ストリームを作成。
%       create           - 複数の独立な乱数ストリームを作成。
%       list             - 使用可能な乱数発生器のアルゴリズムのリスト。
%       getDefaultStream - デフォルトの乱数ストリームを取得。
%       setDefaultStream - デフォルトの乱数ストリームを設定。
%       reset            - ストリームを初期の内部状態にリセット。
%       rand             - 一様分布からの擬似乱数。
%       randn            - 標準正規分布からの擬似乱数。
%       randi            - 離散一様分布からの擬似乱数。
%       randperm         - ランダムな置換。
%
%   参考 RANDFUN/RAND, RANDFUN/RANDN, RANDFUN/RANDI.


%   Copyright 2008 The MathWorks, Inc. 
