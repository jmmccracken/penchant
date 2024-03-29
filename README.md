Causal penchant and leaning
===
> :warning: **This code should be considered a research resource. This repo is not actively maintained.** 

These MATLAB scripts calculate the causal penchant and causal leaning introduced in [1].  These scripts all assume the tolerance domains are symmetric and only calculate penchants and leanings for l-standard cause-effect assignments.  

The penchant is calculated using the _pen\_lagged_ script as

    penout = pen_lagged(x,y,xtol,ytol,lag)

where _x_ and _y_ are 1 dimensional vectors of time series data, _xtol_ and _ytol_ are the symmetric tolerance domains for _x_ and _y_, repsectively, and _lag_ is the lag to use for the l-standard cause-effect assignment.  The output _penout_ is a single value, the observed penchant given the input arguments.  

The weighted mean observed leaning is caluclated using the _leans\_lagged_ script as

    leanout = leans_lagged(x,y,xtol,ytol,lags)

where _x_, _y_, _xtol_, and _ytol_ are arguments for _pen\_lagged_ as described above, and _lags_ is the set of lags for the desired l-standard cause-effect assignments.  The output _leanout_ is a 2 dimensional array with the first column being the requested lags _lags_ and the second column being the weighted mean observed leaning calculated using each requested lag.

Running the script _SimpleIRexample_ will produce a array of leanings similar to the ones used to produce Figure 1 of [1].  

The scripts use the following internal MATLAB functions: _nan_, _zeros_, _length_, _mean_, _fprintf_, _tic_, _toc_, and _randn_.  It has not been tested on any open source MATLAB equivalents such as Octave or Scilab.

This code has been tested on Ubuntu 13.10 with kernel version 3.13.0-68-generic x86_64 x86_64 x86_64 GNU/Linux with Matlab 7.9.1.671 (R2009b) Service Pack 1 64-bit (glnxa64).

[1] arXiv:1506.06823 ( 	
https://doi.org/10.1103/PhysRevE.93.022207)
