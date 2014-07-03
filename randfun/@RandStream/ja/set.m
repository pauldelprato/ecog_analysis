%SET  乱数ストリームのプロパティ値の設定
%
%   SET(S,'PropertyName',VALUE) は、乱数ストリーム S のプロパティ 
%   'PropertyName' を値 VALUE に設定します。
%
%   SET(S,'Property1',Value1,'Property2',Value2,...) は、複数の乱数ストリーム
%   のプロパティ値を単一のステートメントで設定します。
%
%   SET(S,A) は、A がフィールド名が乱数ストリーム S のプロパティ名である
%   構造体の場合、これらのフィールドに含まれる値を持つ各フィールドによって
%   名前が付けられた S のプロパティを設定します。
%
%   SET(S,'Property') または A = SET(S,'Property') は、S の指定したプロパティ
%   に対して使用可能な値を表示または返します。
%
%   SET(S) または A = SET(S) は、S のすべてのプロパティと使用可能な値を表示
%   または返します。
%
%   参考 RANDSTREAM, RANDSTREAM/GET.


%   Copyright 2008-2009 The MathWorks, Inc. 
