%RESET Reset a random stream to its initial internal state.
%   RESET(S) resets the generator for the random stream S to the internal
%   state corresponding to its seed.  This is almost equivalent to clearing
%   S and recreating it using RandStream(TYPE,...), except RESET does not
%   set the stream's NormalTransform, Antithetic, and FullPrecision
%   properties to their original values.
%
%   RESET(S,SEED) resets the generator for the random stream S to the internal
%   state corresponding to the seed SEED, and updates the SEED property of S.
%   SEED is an integer from 0 to 2^32-1.  Resetting a stream's seed can
%   invalidate independence with other streams.
%
%   Resetting a stream should be used primarily for reproducing results.
%
%   Examples:
%
%      Reset a random number stream to its initial state.  This does not
%      create a random number stream, it simply resets the stream.
%         stream = RandStream('twister','Seed',0)
%         reset(stream);
%         stream.Seed
%
%      Reset a random number stream using a specific seed.
%         stream = RandStream('twister','Seed',0)
%         reset(stream,1);
%         stream.Seed
%
%   See also RANDSTREAM, RANDSTREAM/RANDSTREAM, RANDSTREAM/GETGLOBALSTREAM.

%   Copyright 2008-2012 The MathWorks, Inc. 
%   Mex function.
