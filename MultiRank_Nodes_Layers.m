%++++++++ MultiRank  Nodes and Layer Centrality ++++++++++++++++++++++++++++++++++++++++++++
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
function [x,z]=MultiRank_Nodes_Layers(A,M,N,alpha,gamma,s,a)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following program takes in input:

%1. a cell A of M sparse adjacency matrices (ordered layers of the multiplex network)
%   ex. A{1} is a N times N adjacency matrix of layer 1
%   we adopt the convention for directed network A{1}(i,j)=1 if node i
%   points to node j in layer 1
%2. M the number of layers of the multiplex network
%3. N the number of nodes of the multiplex networks
%4. alpha the teleportation parameter usually set at 0.85
%5. gamma parameter of the MultiRank gamma>0.
%6. s=1,-1 parameter of the MultiRank s=-1 elite layers s=1 popular layers
%7. a=0,1 parameter of the MultiRank a=1 centrality of the layers not
%normalized with the total number of links, a=0 centrality of the layers
%normalized with the total number of links.

%It produces as an output:

%1. vector of  centrality of each node  
% x(i) centrality of node i 
%2. vector z centrality (influence) of each layer 
%    z(m) influence of layerm 


v_quadratic_error=0.0001;
		for n=1:M,
		A{n}=A{n}';
		end
		 for n=1:M,
			for i=1:N,
			Bin(n,i)=sum(A{n}(i,:));
			end
         end
%%%%%%%%%%%%%%%%%%%%%%%%%%
         z=ones(1,M);
         Aaus=zeros(N,N);
             for n=1:M,
                 Aaus=Aaus+A{n}*z(n);
             end
             D=sum(Aaus,1)+(sum(Aaus,1)==0);
             D=ones(1,N)./D;
             D=spdiags(D(:),0,N,N);
                     
           
             x0=((sum(Aaus,1)>0)+(sum(Aaus,2)>0)')>0;
             x0=x0'/nnz(x0);
             l=sum(Aaus,1)>0;
             jump=alpha*l';
             x=x0;

             
		     x=Aaus*D*(x.*jump)+(sum((1-jump).*x,1)*x0);        
		
          z=(sum(Bin,2)).^a.*(((Bin)*(x+(x==0)).^(s*gamma))./((sum(Bin,2))+(sum(Bin,2)==0))).^(s);  
		  z=z/sum(z);
        
			 last_x = ones(N,1) * inf;
				 
				 while(norm(x - last_x, 2) > v_quadratic_error*norm(x))

				 last_x = x;
				 Aaus=zeros(N,N);
				 for n=1:M,
					Aaus=Aaus+A{n}*z(n);
				 end
				 D=sum(Aaus,1)+(sum(Aaus,1)==0);
				 D=ones(1,N)./D;
				 D=spdiags(D(:),0,N,N);
                     
           
				 x0=((sum(Aaus,1)>0)+(sum(Aaus,2)>0)')>0;
				x0=x0'/nnz(x0);
				l=sum(Aaus,1)>0;
				jump=alpha*l';
             
				x=Aaus*D*(x.*jump)+(sum((1-jump).*x,1)*x0);
       
            
             z=(sum(Bin,2)).^a.*(((Bin)*(x+(x==0)).^(s*gamma))./((sum(Bin,2))+(sum(Bin,2)==0))).^(s);   
		     z=z/sum(z);
			
		end
	end









