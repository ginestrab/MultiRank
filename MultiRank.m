%++++++++ MultiRank  ++++++++++++++++++++++++++++++++++++++++++++
% 
% This code can be redistributed and/or modified
% under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or (at
% your option) any later version.
%  
% This program is distributed ny the authors in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%
%  
% If you use this code please cite 
%
% [1]   C. Rahmede, J.Iacovacci, A. Arenas and G. Bianconi, 
%"Centralities of Nodes and Influences of Layers in Large Multiplex Networks"
% arxiv:1703.05833 (2017).
%
% (c) Christoph Rahmede (c.rahmede@kit.edu)
%     Ginestra Bianconi (g.bianconi@qmul.ac.uk)  
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function [X,Z,XR,ZR]=MultiRank(A,M,N,s,a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following program takes in input:

%1. a cell A of M sparse adjacency matrices (ordered layers of the multiplex network)
%   ex. A{1} is a N times N adjacency matrix of layer 1
%   we adopt the convention for directed network A{1}(i,j)=1 if node i
%   points to node j in layer 1
%2. M the number of layers of the multiplex network
%3. N the number of nodes of the multiplex networks
%4. s=1,-1 parameter of the MultiRank s=-1 elite layers s=1 popular layers
%5. a=0,1 parameter of the MultiRank a=1 centrality of the layers not
%normalized with the total number of links, a=0 centrality of the layers
%normalized with the total number of links.

%It produces as an output:

%1. matrix X centrality of each node as a function of gamma in (0.1,3)
% X(i,ig) centrality of node i for gamma=0.1*ig
%2. matrix Z centrality (influence) of each layer as a function of gamma
%(0.1,3)
%    Z(m,ig) influence of layerm for gamma=0.1*ig
%3. matrix XR rank of each node as a function of gamma (top rank n bottom rank 1)
%   XR(i,ig) is the rank of node i for gamma=0.1*ig
%4. matrix ZR rank of each layer as a function of gamma (top rank N bottom rank 1)
%   ZR(m,ig) rank of layer m for gamma=0.1*ig

for ig=1:30,
    gamma=ig*0.1;    
    %%%%%%%%%%%%%%%%%%Changed line%%%%%%%%%%%
    [x,z]=MultiRank_Nodes_Layers(A,M,N,0.85,gamma,s,a);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    X(:,ig)=x;
    [I,V]=sort(x,'ascend');
    Z(:,ig)=z;
    [I2,V2]=sort(z,'ascend');
    for i=1:N,
    XR(i,ig)=find(V==i);
    end
    for m=1:M,
    ZR(m,ig)=find(V2==m);  
    end
end