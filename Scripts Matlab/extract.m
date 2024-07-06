% Processar dados do Linkedim em txt
% Extrair as competencias faltantes
% Pesquisa de TCC - Maxela Martins
L=116455;
% Abrir dados de txt
file = fopen('log.txt','r');
% Colocar texto em celulas
Ctext = cell(L,1);
for j = 1 : 1 : L=
    Ctext{j} = fgetl(file);
end

% Extrair as competencias
Ccomp = cell(T,1); i = 1;
for j = 1 : 1 : L
    str = Ctext{j};
    % Filtrar linhas
    bool = length(str) > 4;
    % Obter linha seguinte==
    if bool && strcmp(str(1:5),'Falta')
        Ccomp{i} = Ctext{j+1};
        i = i + 1;
    end
end

% Criar arquivo csv 
arq = fopen('comp.csv','w','n','latin1');
for i = 1 : 1 : T
    % Remover letra e 
    str = strrep(Ccomp{i},' e',',');
    % Escrever linha
    fprintf(arq,'%s\n',str);
end
fclose(arq);
