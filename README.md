# MultiRank

This repository comprizes all the MATLAB files implementing  the MultiRank algorithm 
to rank nodes and layers in large multiplex networks.

It includes:

1) MultiRank_Nodes_Layers .m
the actual MultiRank algorithm generating a ranking of node and a ranking of layers for every parameter values
gamma, s, a.
2) MultiRank.m evaluating the Multirank for different values of gamma in the interval (0,3) for  given values of s and a.
3) MultiRank_plots.m is the code to generate the plots of the top rank nodes and layers

4) The datasets of the European Air Multiplex Transportation Network
EUAirTransportation_layers.txt
EUAirTransportation_nodes.txt
EUAir Transportation_multiplex.edges

5) The file read_airports.m to read the above dataset and put in in the format to be read by the MATLAB codes.

If you want to see how the algorithm works for the given dataset execute the following commands
 
 read_airports
 
 [X,Z,XR,ZR]=MultiRank(A,M,N,1,1)
 
 MultiRank_plots(XR,ZR,Nnames,Lnames,N,M,15,15)
 
   
 If you use the included MATLAB code please cite 

 [1]   C. Rahmede, J.Iacovacci, A. Arenas and G. Bianconi, 
"Centralities of Nodes and Influences of Layers in Large Multiplex Networks"
 arxiv:1703.05833 (2017).

 (c) Christoph Rahmede (c.rahmede@kit.edu)
     Ginestra Bianconi (g.bianconi@qmul.ac.uk)  

The European Air Multiplex Transportation Network is taken from the data repository of Manlio de Domenico available at 
http://deim.urv.cat/~manlio.dedomenico/data.php

If you use this dataset please cite:

[2] Alessio Cardillo, Jesús Gómez-Gardenes, Massimiliano Zanin, Miguel Romance, David Papo, Francisco del Pozo and Stefano Boccaletti - Emergence of network features from multiplexity. Scientific Reports 3, Article number: 1344 doi:10.1038/srep01344 

 This code can be redistributed and/or modified
 under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or (at
 your option) any later version.
  
 This program is distributed ny the authors in the hope that it will be 
 useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
