% Extrair estatísticas dos arquivos excel
% Contabilizar as ocorrências de cada requisito
% Especificar as linhas em que ocorrem as instâncias

% Abrir a planilha
Cdata = readcell('Full Stack dados 1/comp.xlsx');

% Remover o cabeçalho
Cdata(1,:) = [];

% Obter dimensões da célula
[m,n] = size(Cdata);

% Dispor dados em uma só coluna

Cvec = reshape(Cdata,[m*n,1]);
% Célula p/ armazenar instâncias
Cins = cell(17,2); k = 1;
% Indices de todas as ocorrências
index = zeros(1);

% Enquanto vetor busca não vazio
while not(isempty(Cvec))
    % Armazena primeira instância
    Cins{k,1} = Cvec{1};
    index(1) = 1; j = 1;
    % Busca repetições da instância
    for i = 2 : 1 : size(Cvec)
        if strcmp(Cvec{i},Cins{k,1})
            j = j + 1;
            index(j) = i;
        end
    end
    % Remove ocorrências do vetor
    Cvec(index) = [];
    index = zeros(1);
    % Armazena número de ocorrências
    Cins{k,2} = j;
    k = k + 1;
end

% Ordenar por maior n° de repetições
v = cell2mat(Cins(:,2));
[~,c] = sort(v,'descend');
Csort = Cins(c,:);
% escrever no arquivo 
writecell(Csort,'dados_Full_.xlsx');
