
b=load('EUAirTransportation_multiplex.edges');
M=max(b(:,1));
N=max(max(b(:,2)),max(b(:,3)));
for n=1:M,
    A{n}=zeros(N,N);
end
for n=1:max(size(b)),
    A{b(n,1)}(b(n,2),b(n,3))=1;
    A{b(n,1)}(b(n,3),b(n,2))=1;
end
fileID = fopen('EUAirTransportation_layers2.txt');
C = textscan(fileID,'%d %s');
fclose(fileID);
Lnames=C{2};
fileID = fopen('EUAirTransportation_nodes2.txt');
XY = textscan(fileID,'%d %s %f %f');
fclose(fileID);
for n=1:N,
    Nnames(n)=XY{2}(n);
end
