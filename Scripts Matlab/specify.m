% Processar dados do Linkedim em txt
% Especificar os nomes das vagas e empresas
% Pesquisa de TCC - Maxela Martins
T=266;
% Abrir dados de txt
meta = fopen('meta.txt','r');

% Obter ambos os nomes
Cvaga = cell(T,1);
Cempr = cell(T,1);
for j = 1 : 1 : T
    % Obter linha do txt
    str = fgetl(meta);
    k = 5;
    % Achar primeiro indice com |
    while not(strcmp(str(k),'|'))
        k = k + 1;
    end
    % Extrair o nome da vaga
    Cvaga{j} = str(5:k-2);
    i = k + 2;
    % Achar segundo indice com |
    while not(strcmp(str(i),'|'))
        i = i + 1;
    end
    % Extrair o nome da empresa
    Cempr{j} = str(k+2:i-2);
end

% Escrever nomes na planilha
Cname = [Cvaga Cempr];
writecell(Cname,'name.xlsx');
