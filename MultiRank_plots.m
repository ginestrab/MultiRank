%++++++++ MultiRank  (centrality plot)++++++++++++++++++++++++++++++++++++++++++++
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



function MultiRank_plots(XR,ZR,Nnames,Lnames,N,M,N1,M1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%%%%%%
%The following program takes in input:
%1. XR  generated by the MultiRank.m program
%2. ZR generated by the MultiRank.m program
%3. Nnames N dimensional vector of names of nodes
%4. Lnames M dimensiona vector of names of layers
%5. N number of nodes
%6. M number of layers 
%7. N1 number of top ranked nodes that we want to visualize
%8. M1 number of top ranked layers that we want to visualize

%It produces as an output
% - a figure of the top N1 ranked nodes as a function of gamma
% - a figure of the top M1 ranked layers as a function of gamma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


str=cell(1,1)
str2=cell(1,1)
for n=1:N,
str2{1}(n)=Nnames(find(XR(:,30)==n));
end
for n=1:N,
str{1}(n)=Nnames(find(XR(:,1)==n));
end
l=0.1:0.1:3.0;
figure
ch=plotyy(l,XR',l,XR')
set(ch(1),'Units','normal')
set(ch(2),'Units','normal')
set(ch(1),'Position',[0.3 0.3 0.5 0.5])
set(ch(2),'Position',[0.3 0.3 0.5 0.5])
set(ch(1), 'ylim',[N-N1,N],'YTickLabel',str{1}, 'YTick',1:N,'yaxislocation','left ','FontWeight','bold','FontSize',12)
set(ch(2), 'ylim',[N-N1,N],'YTickLabel',str2{1}, 'YTick',1:N,'yaxislocation','right ','FontWeight','bold','FontSize', 12)
xlabel('\gamma','FontWeight', 'bold', 'FontSize', 19)
str=cell(1,1)
str2=cell(1,1)
for n=1:M,
str2{1}(n)=Lnames(find(ZR(:,30)==n));
end
for n=1:M,
str{1}(n)=Lnames(find(ZR(:,1)==n));
end
l=0.1:0.1:3.0;
figure
ch=plotyy(l,ZR',l,ZR')
set(ch(1),'Units','normal')
set(ch(2),'Units','normal')
set(ch(1),'Position',[0.3 0.3 0.5 0.5])
set(ch(2),'Position',[0.3 0.3 0.5 0.5])
set(ch(1), 'ylim',[M-M1,M],'YTickLabel',str{1}, 'YTick',1:M,'yaxislocation','left ','FontWeight','bold','FontSize',12)
set(ch(2), 'ylim', [M-M1,M],'YTickLabel',str2{1}, 'YTick',1:M,'yaxislocation','right ','FontWeight','bold','FontSize', 12)
xlabel('\gamma','FontWeight', 'bold', 'FontSize', 19)
end
