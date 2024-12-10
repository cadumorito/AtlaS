create database Atlas;
use Atlas;

create table salas (
id_room int auto_increment primary key,
    nome varchar(100) not null);
   
create table categorias (
id_categoria int auto_increment primary key,
nome varchar(100));

insert into categorias (nome)
values
("Coordenador"),
("Instrutor"),
("Apoio técnico"),
("Especialista");

create table usuarios (
id_user int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) unique not null,
    senha varchar(250),
    imagem varchar(250),
    telefone varchar(20),
    id_categoria_id int,
    last_login datetime,
    is_authenticated boolean,
    is_superuser tinyint(1),
	is_staff tinyint(1),
    foreign key (id_categoria_id) references categorias(id_categoria));
   
INSERT INTO usuarios (nome, email, senha, telefone, id_categoria_id)
VALUES ('Indefinido', 'teste@exemplo.com', 'senha123', '123456789', 4);


CREATE TABLE turnos (
id_turno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255)
);

insert into turnos(nome)
values
('Manhã'),
('Tarde');

CREATE TABLE periodos (
id_periodo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255)
);

insert into periodos(nome)
values
('Antes do Intervalo'),
('Após o intervalo');

create table status (
id_status int auto_increment primary key,
    nome varchar(255)
);

insert into status(nome)
values
('Disponível'),
('Indisponível');
   
    CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    status_curso boolean,
    statusPag_curso VARCHAR(20),
    horas_curso TIME,
    imagem_curso MEDIUMBLOB,
    dataInicio_curso DATE,
    dataFim_curso DATE,
    descricao_curso TEXT,
    programacao_curso TEXT,
    requisitos_curso TEXT,
    perfil_curso TEXT,
    topico_curso varchar(100)
);
INSERT INTO Cursos
(nome_curso, status_curso, statusPag_curso, horas_curso, imagem_curso, dataInicio_curso, dataFim_curso, descricao_curso, programacao_curso, requisitos_curso, perfil_curso, topico_curso)
VALUES

('Indefinido', FALSE, 'Indefinido', '000:00:00', null, '2024-01-01', '2024-01-01', 'Indefinido', 'Indefinido', 'Indefinido', 'Indefinido', 'Indefindo'),

('Eletricista Instalador', TRUE, 'Gratuito', '160:00:00', NULL, '2024-04-15', '2024-04-23',
'No curso Eletricista Instalador o aluno irá aprender a interpretar circuitos e diagramas elétricos, planta baixa de instalações elétricas prediais e a montagem de infraestrutura básica para instalação elétrica predial. Ao final do curso, poderá elaborar croquis, executar e conferir instalações elétricas prediais, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho.',
'Fundamentos de Eletricidade: Materiais condutores e isolantes, Tensão, corrente, resistência e potência elétrica, Corrente Contínua e Alternada, Circuitos elétricos (série, paralelo e misto), Leis de Ohm e Kirchoff, Instrumentos de Medição, Multímetro, Alicate amperímetro, Diagramas Elétricos, Unifilar, Multifilar, Funcional. Cabeamento e Conexões: Cabos (flexível, rígido, PP e dados), Métodos de instalação, Tabelas de dimensionamento, Emendas. Segurança e Normalização: Sinalização, Símbolos de advertência. Dispositivos de proteção: Fusíveis, Disjuntor Termomagnético, Disjuntor diferencial residual (DDR), Interruptor diferencial residual (IDR), Dispositivo de proteção contra surto (DPS). Componentes de circuitos elétricos: Interruptores, Tomadas, Campainhas, Sensores. Normas Aplicadas a Instalação Elétrica e Meio Ambiente: Regulamentadora, Técnicas (5410), Ambientais. Dimensionamento de instalações elétricas: Divisão de circuitos, Dimensionamento de proteção (disjuntores, fusíveis, DPS e IDRs), Distribuição de cargas. Técnicas de montagem de infraestrutura: Quadro de distribuição, Conduletes, Perfilado, Eletrodutos, Eletrocalha. Instalação de circuitos de iluminação, tomadas e dispositivos eletrônicos.',
'O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Executa instalações elétricas prediais, interpretando projetos de instalação elétrica e quadros de distribuição de circuitos, reparando defeitos, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho. CAPACIDADES: 1. Interpretar circuitos elétricos de instalações prediais, realizando: Montagem de circuitos série, paralelo e misto; Aplicação das leis de Ohm e Kirchoff; Cálculo de grandezas elétricas; Medição de grandezas elétricas. 2. Interpretar planta baixa com diagrama de instalação elétrica, considerando: Diagrama do quadro de distribuição; Diagramas elétricos unifilar, multifilar e funcional; Componentes e localização dos pontos de instalação; Lista de materiais necessários conforme o diagrama. 3. Elaborar croqui de instalações elétricas, realizando: Levantamento de cotas (medição e posicionamento); Utilização de simbologia; Divisão de circuitos; Distribuição de cargas; Atendimento às normas; Seleção do diagrama adequado. 4. Executar operações mecânicas básicas para instalação de infraestrutura, considerando: Corte de eletroduto; Furação de quadro/painel; Utilização de acessórios para eletrodutos; Seleção de materiais. 5. Executar instalações elétricas, considerando: Seleção das ferramentas de acordo com a operação; Seleção de materiais; Interpretação de diagramas elétricos; Conexões elétricas; Fixação de componentes; Montagem de quadro de distribuição; Identificação de componentes, por meio de anilhas, etiquetas, etc.; Atendimento às normas. 6. Conferir a instalação elétrica, realizando: Testes de componentes; Testes de funcionamento dos circuitos; Medições por meio de instrumentos; Correção de falhas. 7. Trabalhar em equipe; 8. Raciocinar de forma lógica; 9. Atentar-se aos detalhes; 10. Demonstrar organização.',
'Mecatrônica'),


('Eletropneumática', TRUE, 'Pago', '40:00:00', NULL, '2024-04-15', '2024-04-18',
'O Curso de Aperfeiçoamento Profissional - Eletropneumática tem por objetivo o desenvolvimento de competências relativas à interpretar e elaborar e montar circuitos pneumáticos com comandos elétricos.',
'Revisão de fundamentos elétricos (corrente, tensão, resistência), Componentes elétricos (Botoeiras, Fim de curso, Sensores Indutivos, Sensores Capacitivos, Sensores Ópticos, Relés comutadores, Contatores, Contadores, Temporizadores), Simbologia normalizada dos componentes elétricos; Válvulas direcionais; Eletropneumática; Aplicação de sensores eletroeletrônicos; Representação de sequências de movimentos; Diagrama trajeto/passo; Diagrama trajeto/tempo; Sequências diretas e indiretas; Método intuitivo de elaboração de circuitos elétricos; Maximização de contatos; Minimização de contatos; Condições marginais; Montagem de circuitos eletropneumáticos.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Ter conhecimentos de Pneumática.',
'Revisão de fundamentos elétricos (corrente, tensão, resistência), Componentes elétricos (Botoeiras, Fim de curso, Sensores Indutivos, Sensores Capacitivos, Sensores Ópticos, Relés comutadores, Contatores, Contadores, Temporizadores), Simbologia normalizada dos componentes elétricos; Válvulas direcionais; Eletropneumática; Aplicação de sensores eletroeletrônicos; Representação de sequências de movimentos; Diagrama trajeto/passo; Diagrama trajeto/tempo; Sequências diretas e indiretas; Método intuitivo de elaboração de circuitos elétricos; Maximização de contatos; Minimização de contatos; Condições marginais; Montagem de circuitos eletropneumáticos.',
'Mecatrônica'),

('Comandos Elétricos', TRUE, 'Gratuito', '120:00:00', NULL, '2024-11-08', '2025-01-18',
'O Curso de Aperfeiçoamento Profissional Comandos Elétricos tem por objetivo o desenvolvimento de competências relativas à montagem e manutenção de comandos elétricos de máquinas e equipamentos, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho.',
'1. Magnetismo e Eletromagnetismo 2. Transformadores 3. Instrumentos de Medidas para ensaios 4. Técnicas de Ensaios de Transformadores Monofásico 5. Técnicas de Ensaios de Transformadores Trifásicos 6. Motores de Indução - Monofásicos e Trifásicos 7. Dispositivos de segurança e proteção para comandos elétricos 7.1. Fusíveis 7.2. Seccionadoras 7.3. Relés térmicos 7.4. Disjuntores 7.5. Relés de sequência e falta de fase 8. Elementos de comandos e controle e equipamentos auxiliares 8.1. Cabos e conectores 8.2. Contatores e Botoeiras 8.3. Interruptores de posição 8.4. Sinalizadores 8.5. Sensores 9. Norma NR 12 10. Simbologia e diagramas de comandos elétricos 11. Sistemas de partidas e frenagem de motores de indução 12. Técnicas de manutenção em sistemas de partidas 13. Principais Defeitos em Sistemas de Partida 14. Normas Aplicadas a instalação elétrica.',
'O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Ter concluído curso de qualificação na área eletroeletrônica ou comprovar conhecimentos e experiências anteriores referentes a essa qualificação, adquiridos em outros cursos, no trabalho ou em outros meios informais.',
'Executa trabalhos de montagem e manutenção de comandos elétricos de máquinas e equipamentos, interpretando diagramas e esquemas elétricos, utilizando instrumentos, ferramentas e aparelhos de medição, atuando individualmente ou participando de equipes de trabalho, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho.',
'Mecatrônica'),

('Leitura e Interpretação de Desenho Técnico Mecânico', TRUE, 'Gratuito', '60:00:00', NULL, '2024-10-05', '2024-12-07',
'O Curso de Aperfeiçoamento Profissional - Leitura e Interpretação de Desenho Técnico Mecânico tem por objetivo o desenvolvimento de competências relativas à leitura e interpretação de desenhos técnicos de peças e conjuntos mecânicos seguindo normas técnicas, saúde e segurança no trabalho.',
'• Lê e interpreta desenhos técnicos de peças e conjuntos mecânicos seguindo normas técnicas, saúde e segurança no trabalho. • Capacidades Técnicas • Identificar figuras planas; • Identificar sólidos geométricos; • Interpretar perspectivas isométricas; • Interpretar projeções ortogonais; • Interpretar legenda e notas; • Interpretar escalas em desenhos; • Interpretar os tipos de cortes; • Interpretar cotagem; • Interpretar desenhos em forma de curvas; • Interpretar montagens de peças e conjuntos mecânicos.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Executa a leitura e interpretação de desenhos técnicos de peças e conjuntos mecânicos seguindo normas técnicas, saúde e segurança no trabalho. CAPACIDADES: 1. Lê e interpreta desenhos técnicos; 2. Interpreta montagens de peças e conjuntos mecânicos; 3. Identifica as figuras planas e os sólidos geométricos; 4. Reconhece o uso de escalas e cotas; 5. Aplica a interpretação em práticas de leitura e confecção de desenhos técnicos.',
'Fabricação Mecânica'),

('SOLIDWORKS', TRUE, 'Pago', '80:00:00', NULL, '2024-10-05', '2025-03-01',
'O curso de Aperfeiçoamento Profissional de Solidworks tem por objetivo o desenvolvimento de competências relativas à elaboração de modelagem em desenhos de projetos e a modificação deles, utilizando ferramentas típicas da área, visando a alteração das características do produto e a melhoria de sua função, de acordo com normas e especificações técnicas e considerando princípios da qualidade e da produtividade.',
'• Lê e interpreta desenhos técnicos de peças e conjuntos mecânicos seguindo normas técnicas, saúde e segurança no trabalho. • Identificar os comandos e atalhos no software. • Elaborar esboços de figuras geométricas 2D. • Aplicar comandos de 3D a partir de esboços. • Realizar a montagem de conjuntos a partir de peças modeladas. • Realizar o detalhamento das peças e dos conjuntos. • Modelar chapas metálicas dobradas. • Identificar os comandos de Surface (superfície). • Modelar peças em superfície. • Identificar os comandos de Weldment (soldagem). • Aplicar modelagem de estrutura metálica para Weldment (soldagem). • Demonstrar pensamento analítico. • Demonstrar criatividade e inovação. • Demonstrar auto-gestão.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Ter conhecimentos ou experiências anteriores na área de Metalmecânica, adquiridos em outros cursos, no trabalho e ou em outros meios informais.',
'• Realiza a modelagem em desenhos de projetos e a modificação deles, utilizando ferramentas típicas da área, visando a alteração das características do produto e a melhoria de sua função, de acordo com normas e especificações técnicas e considerando princípios da qualidade e da produtividade.',
'Fabricação Mecânica'),

('Torneiro Mecânico', TRUE, 'Pago', '180:00:00', NULL, '2024-10-05', '2025-02-05',
'O Curso de Qualificação Profissional Torneiro Mecânico tem por objetivo o desenvolvimento de competências relativas à operação de torno mecânico convencional de acordo com normas técnicas, ambientais e de segurança do trabalho.',
'• Leitura e Interpretação de Desenho Mecânico - 40h • Tecnologia Mecânica - 40h • Operações em Torno Mecânico - 100h',
'• O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. • O aluno deverá ter completado a 4ª série/ano do Nível Fundamental.',
'Tornear peças de vários perfis, em materiais metálicos e não-metálicos, utilizando ferramentas de corte e fazendo controle de medidas das peças de acordo com o desenho, seguindo normas e procedimentos técnicos, do meio ambiente, de saúde e segurança do trabalho.',
'Fabricação Mecânica'),

('Programação, Preparação e Operação de Torno CNC', TRUE, 'Gratuita', '100:00:00', NULL, '2024-10-08', '2025-02-05',
'O Curso de Aperfeiçoamento Profissional - Programação, Preparação e Operação de Torno CNC tem por objetivo o desenvolvimento de competências para operar, preparar e programar Torno a CNC selecionando estratégias adequadas para usinagem de peças, seguindo procedimentos, normas técnicas, ambientais, de saúde e segurança.',
'1. Reconhecer pontos por meio de sistemas de coordenadas cartesianas; 2. Elaborar programas utilizando as funções ISO; 3. Elaborar programas utilizando ciclos fixos de máquina; 4. Elaborar programas utilizando subprogramas e sub-rotinas; 5. Selecionar ferramentas de acordo com a geometria da peça a ser usinada; 6. Utilizar o painel de operação da máquina; 7. Inicializar máquina; 8. Operar a máquina em modo manual; 9. Fazer o preset das ferramentas; 10. Referenciar o ponto zero-peça; 11. Simular o programa; 12. Usinar peças em modo automático; 13. Identificar as mensagens de falhas.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Comprovar conhecimentos em operações de torno mecânico, desenho técnico mecânico e controle dimensional.',
'Programa, prepara e opera Torno a CNC selecionando estratégias adequadas para usinagem de peças, seguindo procedimentos, normas técnicas, ambientais, de saúde e segurança.',
'Fabricação Mecânica'),

('Inspetor de Qualidade', TRUE, 'Gratuito', '160:00:00', NULL, '2024-09-21', '2025-02-22',
'O Curso de Qualificação Profissional- Inspetor de Qualidade tem por objetivo o desenvolvimento de competências relativas à condução e realização de inspeções de peças e conjuntos mecânicos por meio de medições dimensionais e geométricas, no início, durante e ao término de cada etapa do processo de fabricação, utilizando instrumentos de medição e ferramentas da qualidade seguindo normas de saúde e segurança, técnicas e ambientais.',
'Leitura e Interpretação de Desenho Técnico Mecânico - 60 horas\nCapacidades Técnicas\nIdentificar figuras planas;\nIdentificar sólidos geométricos;\nInterpretar perspectivas isométricas;\nInterpretar projeções ortogonais;\nInterpretar legenda e notas;\nInterpretar escalas em desenhos;\nInterpretar os tipos de cortes;\nInterpretar cotagem;\nInterpretar tolerância dimensional;\nIdentificar simbologias de tolerâncias geométricas;\nIdentificar simbologias do estado da superfície;\nInterpretar desenhos de conjuntos mecânicos conforme normas técnicas.\nCapacidades sociais, organizativas e metodológicas\nDemonstrar visão espacial;\nDemonstrar atenção a detalhes;\nInspeção de Qualidade 100 horas\nCapacidades Técnicas\nConverter unidades de medidas lineares;\nEfetuar medições com instrumentos:\nEscala;\nPaquímetro quadrimensional;\nMicrômetro Externo;\nMicrômetro Interno;\nMicrômetro de Profundidade;\nGoniômetro;\nRugosímetro;\nRelógio comparador;\nRelógio apalpador;\nSúbito;\nCalibrador passa - não passa;\nBloco padrão;\nProjetor de Perfil;\nDurômetro.\nEfetuar medição com acessórios\nMesa de seno\nCalibrador traçador de altura\nCilindros calibrados\nEsferas calibradas\nBase magnética articulada\nDesempeno\nPrisma\nInterpretar normas técnicas de Inspeção e Controle de Qualidade - 20 horas\nElaborar relatórios e instruções de inspeção - 20 horas',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 4ª série/ano do Nível Fundamental. Ter conhecimentos em Leitura e Interpretação de Desenho Técnico Mecânico e Matemática básica.',
'Conduz e realiza inspeções de peças e conjuntos mecânicos por meio de medições dimensionais e geométricas, no início, durante e ao término de cada etapa do processo de fabricação, utilizando instrumentos de medição e ferramentas da qualidade, seguindo normas de saúde e segurança, técnicas e ambientais.',
'Fabricação Mecânica'),

('Desvendando o 5G', TRUE, 'Gratuito', '15:00:00', NULL, '2024-05-25', '2024-06-26',
'O curso de Aperfeiçoamento Profissional Desvendando o 5G, tem por objetivo apresentar os principais conceitos sobre a tecnologia 5G, seu potencial e impacto na sociedade e na economia.',
'Reconhecer o histórico e evolução das gerações de telefonia celular, Identificar os elementos básicos que compõem uma rede 5G, Reconhecer o potencial de transformação do 5G, Identificar as diferentes arquiteturas e possibilidades de implantação das redes 5G, Reconhecer o status atual da implantação do 5G no Brasil e no mundo, Identificar exemplos de aplicações avançadas existentes no mercado mundial ou previstas para implantação futura.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 5ª série/ano do Nível Fundamental. Ter conhecimentos básicos em informática e navegação na internet; Formação inicial em qualquer área ou reconhecimento de competências para aproveitamento em prosseguimento de estudos.',
'Reconhece os principais conceitos sobre a tecnologia 5G, identificando seu potencial e impacto na sociedade e na economia. CAPACIDADES: Reconhecer o histórico e evolução das gerações de telefonia celular, Identificar os elementos básicos que compõem uma rede 5G, Reconhecer o potencial de transformação do 5G, Identificar as diferentes arquiteturas e possibilidades de implantação das redes 5G, Reconhecer o status atual da implantação do 5G no Brasil e no mundo, Identificar exemplos de aplicações avançadas existentes no mercado mundial ou previstas para implantação futura.',
'Logística e Transporte'),

('Caixa de Mudanças de Veículos Pesados', TRUE, 'Gratuito', '40:00:00', NULL, '2025-01-20', '2025-02-18',
'O Curso de Aperfeiçoamento Profissional Caixa de Mudanças de Veículos Pesados tem por objetivo o desenvolvimento de competências relativas à montagem, desmontagem e da caixa de mudanças e seus componentes, de acordo com os dados técnicos do fabricante e utilização de ferramentas especiais.',
'Tipos de ferramentas, Elementos de máquina (Fixação, Apoio, Elástico, Vedação, Transmissão e Lubrificação), Princípio de funcionamento dos sistemas transmissão de veículos pesados, Equipamentos de Proteção Individual e Coletivos, Proteção ao meio ambiente: Utilização de materiais, conservação, descarte e impactos ambientais, Tipos de manutenção, Instrumentos de medição: paquímetros; micrômetros, relógios comparadores, súbitos, calibradores de folga e de raio, torquímetros, Apresentação dos instrumentos de medição, Orientação quanto a manuseio e cuidados com os instrumentos de medição dos componentes da caixa de mudanças, Técnicas de montagem e desmontagem da caixa de mudanças, Técnicas de montagem e desmontagem de rolamentos, Técnicas de ajustes dos componentes da caixa de mudanças, Lubrificação, Ordem de serviço, Manuais de Serviço, Normas, Técnicas, Ambientais, De saúde, Segurança.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Tipos de ferramentas, Elementos de máquina (Fixação, Apoio, Elástico, Vedação, Transmissão e Lubrificação), Princípio de funcionamento dos sistemas transmissão de veículos pesados, Equipamentos de Proteção Individual e Coletivos, Proteção ao meio ambiente: Utilização de materiais, conservação, descarte e impactos ambientais, Tipos de manutenção, Instrumentos de medição: paquímetros; micrômetros, relógios comparadores, súbitos, calibradores de folga e de raio, torquímetros, Apresentação dos instrumentos de medição, Orientação quanto a manuseio e cuidados com os instrumentos de medição dos componentes da caixa de mudanças, Técnicas de montagem e desmontagem da caixa de mudanças, Técnicas de montagem e desmontagem de rolamentos, Técnicas de ajustes dos componentes da caixa de mudanças, Lubrificação, Ordem de serviço, Manuais de Serviço, Normas: Técnicas, Ambientais, de saúde, Segurança.',
'Automotiva'),

('Diagnóstico e Manutenção de Injeção Eletrônica de Motores Diesel', TRUE, 'Pago', '80:00:00', NULL, '2024-10-08', '2025-01-16',
'O curso de Aperfeiçoamento Profissional de Diagnóstico e Manutenção de Injeção Eletrônica de Motores Diesel tem por objetivo a realização da manutenção e diagnóstico do sistema de Diagnóstico e Manutenção de Injeção Eletrônica de Motores Diesel, utilizando ferramentas e equipamentos e seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'• Interpretar o funcionamento dos componentes do sistema de controle do motor, considerando: Sensores, Atuadores e Módulo de gerenciamento eletrônico. • Diagnosticar falhas no chicote elétrico, considerando: Curto-circuito, Continuidade, Sequência de pinos e Queda de tensão. • Realizar os testes nos sensores e atuadores, utilizando: Multímetro, Scanner automotivo e Osciloscópio. • Diagnosticar falhas nos sensores, atuadores e módulos de gerenciamento eletrônico seguindo normas e procedimentos técnicos. • Diagnosticar falhas nos sistemas de controle do motor diesel, considerando: Admissão e escape, Combustível, Arrefecimento, Lubrificação e Freio motor. • Demonstrar pensamento analítico. • Demonstrar auto-gestão.',
'• O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. • O aluno deverá ter concluído o Nível Fundamental. • Ter concluído o curso de qualificação Mecânico de Motor Ciclo Diesel ou Eletricista de veículos Pesados Rodoviários ou comprovar conhecimentos e experiências anteriores referentes a essa qualificação, adquiridos em outros cursos, no trabalho ou em outros meios informais.',
'Realiza a manutenção e o diagnóstico no sistema de Diagnóstico e Manutenção de Injeção Eletrônica de Motores Diesel, utilizando ferramentas e equipamentos e seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Eletricista Automotivo de Veículos Leves', TRUE, 'Pago', '160:00:00', NULL, '2024-10-17', '2025-01-11',
'O curso de Qualificação Profissional de Eletricista Automotivo de Veículos Leves tem por objetivo o desenvolvimento de competências relativas à realização de instalação e manutenção de sistemas carga, partida, sinalização e iluminação em veículos, interpretando esquemas elétricos automotivos e utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Converter unidades de medidas realizando operações fundamentais para a medição de elementos mecânicos; Efetuar medições com os instrumentos identificando as grandezas físicas; Interpretar o plano de manutenção periódica conforme orientações da montadora; Interpretar ordem de serviço para realização da manutenção; Preencher checklist de recebimento e entrega do veículo; Interpretar o manual de reparação quanto ao uso das ferramentas, equipamentos e procedimentos considerando os tipos de manutenção dos sistemas automotivos; Identificar as características dos elementos de máquinas utilizados na área automotiva; Identificar os princípios da eletricidade aplicáveis ao sistema elétrico automotivo; Identificar componentes elétricos aplicáveis ao sistema elétrico automotivo; Interpretar esquemas elétricos automotivos; Medir grandezas elétricas utilizando o multímetro em circuitos elétricos automotivos, considerando: Tensão, Corrente e Resistência; Identificar os princípios de funcionamento dos sistemas de carga e partida; Interpretar as informações prestadas pelo cliente referentes às anomalias no sistema de carga e partida; Realizar diagnósticos do sistema de carga e partida; Realizar remoção e reinstalação dos componentes dos sistemas de carga e partida; Realizar manutenção no alternador e no motor de partida de acordo com normas e procedimentos técnicos, considerando: Remover, Reparar, Testar e Reinstalar; Identificar os princípios de funcionamento dos sistemas de sinalização e iluminação; Realizar diagnósticos do sistema de sinalização e iluminação, considerando: Multímetro, Scanner e Osciloscópio; Realizar manutenção dos sistemas de sinalização e iluminação de acordo com normas e procedimentos técnicos; Demonstrar autogestão; Demonstrar pensamento analítico.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade; O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Realiza manutenção dos sistemas de carga, partida, sinalização e iluminação em veículos leves, interpretando esquemas elétricos automotivos e utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Manutenção e Diagnóstico de Transmissão Mecânica e Automatizada de Veículos Leves', TRUE, 'Gratuito', '112:00:00', NULL, '2024-10-07', '2025-01-10',
'O Curso de Aperfeiçoamento Profissional de Manutenção e Diagnóstico de Transmissão Mecânica e Automatizada de Veículos Leves tem por objetivo o desenvolvimento de competências relativas à realização da manutenção transmissão mecânica e automatizada, diagnosticando e reparando defeitos, utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'• Efetuar medições com instrumentos em transmissão mecânica e automatizada, considerando: micrômetro, relógio comparador, calibre de lâmina e torquímetro. • Interpretar as informações prestadas pelo cliente referentes aos defeitos nas transmissões mecânica e automatizada de veículos leves. • Realizar a manutenção preventiva nas transmissões mecânica e automatizada considerando normas e especificações técnicas do fabricante. • Realizar a inspeção, diagnosticando defeitos em transmissões mecânicas e automatizadas. • Realizar a manutenção corretiva medindo, ajustando e regulando as transmissões mecânicas e automatizadas de veículos leves. • Trabalhar em equipe. • Demonstrar auto-gestão. • Demonstrar pensamento analítico.',
'• O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. • O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. • Ter conhecimentos relacionados a mecânica e/ou eletricidade aplicadas a automotiva, adquiridos em cursos, no trabalho ou em outros meios informais.',
'Realiza manutenção transmissão mecânica e automatizada, diagnosticando e reparando defeitos, utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Mecânico Auxiliar Automotivo de Veículos Leves', TRUE, 'Gratuito', '160:00:00', NULL, '2024-10-07', '2025-01-10',
'O curso de Qualificação Profissional de Mecânico Auxiliar Automotivo de Veículos Leves tem por objetivo o desenvolvimento de competências relativas à realização de inspeções e manutenções em sistemas mecânicos e elétricos de veículos leves, seguindo orientações dos técnicos automotivos, de acordo com normas e procedimentos técnicos, ambientais e de saúde e segurança.',
'Converter unidades de medidas realizando operações fundamentais para a medição de elementos mecânicos. Efetuar medições com os instrumentos identificando as grandezas físicas e considerando: Escala e Paquímetro. Interpretar o plano de manutenção periódica conforme orientações da montadora. Interpretar ordem de serviço para realização da manutenção. Preencher checklist de recebimento e entrega do veículo. Interpretar o manual de reparação quanto ao uso das ferramentas, equipamentos e procedimentos considerando os tipos de manutenção dos sistemas automotivos. Identificar as características dos elementos de máquinas utilizados na área automotiva. Identificar os princípios da eletricidade aplicáveis ao sistema elétrico automotivo. Identificar componentes elétricos aplicáveis ao sistema elétrico automotivo. Interpretar esquemas elétricos automotivos. Medir grandezas elétricas utilizando o multímetro em circuitos elétricos automotivos, considerando: Tensão, Corrente e Resistência. Identificar os sistemas mecânicos que compõem os veículos leves, considerando: Freio, Suspensão, Direção, Transmissão. Identificar os sistemas elétricos que compõem os veículos leves, considerando: Carga e partida, Ignição, Sinalização e iluminação. Identificar os sistemas dos motores de combustão interna, considerando: Arrefecimento, Lubrificação, Alimentação de ar e combustível e Exaustão. Verificar os níveis dos reservatórios dos fluídos de veículos leves, considerando: Líquido do arrefecimento, Direção hidráulica, Óleo do câmbio, Fluído de freio e Óleo do motor.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Realiza inspeções e manutenções em sistemas mecânicos e elétricos de veículos leves, seguindo orientações dos técnicos automotivos, de acordo com normas e procedimentos técnicos, ambientais e de saúde e segurança.',
'Automotiva'),

('Mecânico de Motor Ciclo Diesel', TRUE, 'Gratuito', '160:00:00', NULL, '2024-10-16', '2025-02-16',
'O curso de Qualificação Profissional de Mecânico de Motor Ciclo Diesel tem por objetivo realizar a manutenção nos sistemas mecânicos e elétricos de motores ciclo Diesel, diagnosticando e corrigindo defeitos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Converter unidades de medidas realizando operações fundamentais para a medição de elementos mecânicos.\nEfetuar medições com os instrumentos identificando as grandezas físicas e considerando: Escala e Paquímetro.\nInterpretar o plano de manutenção periódica conforme orientações da montadora.\nInterpretar ordem de serviço para realização da manutenção.\nPreencher checklist de recebimento e entrega do veículo.\nInterpretar o manual de reparação quanto ao uso das ferramentas, equipamentos e procedimentos considerando os tipos de manutenção dos sistemas automotivos.\nIdentificar as características dos elementos de máquinas utilizados na área automotiva.\nIdentificar os princípios da eletricidade aplicáveis ao sistema elétrico automotivo.\nIdentificar componentes elétricos aplicáveis ao sistema elétrico automotivo.\nInterpretar esquemas elétricos automotivos.\nMedir grandezas elétricas utilizando o multímetro em circuitos elétricos automotivos, considerando: Tensão, Corrente e Resistência.\nIdentificar os princípios de funcionamento dos motores de combustão interna ciclo Diesel.\nEfetuar medições com instrumentos em sistemas de motores ciclo Diesel, considerando: Micrômetro, Relógio comparador, Súbito, Goniômetro, Calibre de lâmina e Torquímetro.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade.\nO aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Realiza manutenção em motores ciclo Diesel, diagnosticando e corrigindo defeitos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Mecânico de Motor Ciclo Otto', TRUE, 'Pago', '160:00:00', NULL, '2024-10-02', '2025-02-07',
'O curso de Mecânico de Motor Ciclo Otto tem por objetivo o desenvolvimento de competências relativas à realização de manutenção em motores ciclo Otto, diagnosticando e corrigindo defeitos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'• Converter unidades de medidas realizando operações fundamentais para a medição de elementos mecânicos.\n• Efetuar medições com os instrumentos identificando as grandezas físicas e considerando: Escala e Paquímetro.\n• Interpretar o plano de manutenção periódica conforme orientações da montadora.\n• Interpretar ordem de serviço para realização da manutenção.\n• Interpretar o manual de reparação quanto ao uso das ferramentas, equipamentos e procedimentos considerando os tipos de manutenção dos sistemas automotivos.\n• Identificar as características dos elementos de máquinas utilizados na área automotiva.\n• Identificar os princípios da eletricidade aplicáveis ao sistema elétrico automotivo.\n• Identificar componentes elétricos aplicáveis ao sistema elétrico automotivo.\n• Interpretar esquemas elétricos automotivos.\n• Medir grandezas elétricas utilizando o multímetro em circuitos elétricos automotivos, considerando: Tensão, Corrente e Resistência.\n• Identificar os princípios de funcionamento dos motores de combustão interna ciclo Otto.\n• Efetuar medições com instrumentos em motor ciclo Otto, considerando: Micrômetro, Relógio comparador, Súbito, Goniômetro, Calibre de lâmina e Torquímetro.\n• Interpretar as informações prestadas pelo cliente referentes as anomalias no motor de combustão interna ciclo Otto.\n• Realizar a manutenção do motor de combustão interna ciclo Otto, seguindo as orientações do fabricante.\n• Realizar a manutenção do sistema de arrefecimento do motor de combustão interna ciclo Otto.',
'• O aluno deverá, no início do curso, ter no mínimo 16 anos de idade.\n• O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Realiza manutenção em motores ciclo Otto, diagnosticando e corrigindo defeitos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Mecânico de Transmissão Mecânica e Eixo Traseiro de Veículos Pesados Rodoviários', TRUE, 'Pago', '160:00:00', NULL, '2024-10-16', '2025-02-16',
'O Curso de Mecânico de Transmissão Mecânica e Eixo Traseiro de Veículos Pesados Rodoviários tem por objetivo o desenvolvimento de competências relativas a realização de manutenção em sistemas de transmissão mecânica, automatizada e eixo traseiro de veículos pesados rodoviários, diagnosticando e reparando defeitos, utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'• Converter unidades de medidas realizando operações fundamentais para a medição de elementos mecânicos.\n• Efetuar medições com os instrumentos identificando as grandezas físicas e considerando: Escala e Paquímetro.\n• Interpretar o plano de manutenção periódica conforme orientações da montadora.\n• Interpretar ordem de serviço para realização da manutenção.\n• Preencher checklist de recebimento e entrega do veículo.\n• Interpretar o manual de reparação quanto ao uso das ferramentas, equipamentos e procedimentos considerando os tipos de manutenção dos sistemas automotivos.\n• Identificar as características dos elementos de máquinas utilizados na área automotiva.\n• Identificar os princípios da eletricidade aplicáveis ao sistema elétrico automotivo.\n• Identificar componentes elétricos aplicáveis ao sistema elétrico automotivo.\n• Interpretar esquemas elétricos automotivos.\n• Medir grandezas elétricas utilizando o multímetro em circuitos elétricos automotivos, considerando: Tensão, Corrente e Resistência.',
'• O aluno deverá, no início do curso, ter no mínimo 16 anos de idade.\n• O aluno deverá ter completado a 6ª série/ano do Nível Fundamental.',
'Realiza manutenção em sistemas de transmissão mecânica, automatizada e eixo traseiro de veículos pesados rodoviários, diagnosticando e reparando defeitos, utilizando ferramentas e equipamentos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Automotiva'),

('Automação de Iluminação com Dispositivos Inteligentes', TRUE, 'Gratuito', '40:00:00', NULL, '2024-10-16', '2024-11-16',
'O curso de Aperfeiçoamento Profissional Automação Residencial com Dispositivos Inteligentes tem por objetivo o desenvolvimento de competências relativas a instalação e parametrização de dispositivos conectados, bem como a aplicação de rele de impulso, controle de iluminação, controle de persianas, execução da configuração dos módulos Bluetooth, gateway WI-FI, de acordo com normas técnicas, ambientais, de qualidade, segurança e saúde no trabalho.',
'• Instalar o módulo de acionamento de persiana.\n• Configurar os dispositivos do módulo de acionamento de persiana.\n• Instalar o módulo de controle de Iluminação.\n• Configurar os dispositivos do módulo de controle de Iluminação.\n• Instalar assistente pessoal (comando de voz) e aplicativos móveis.\n• Configurar assistente pessoal (comando de voz) e aplicativos móveis.\n• Integrar os dispositivos por meio de redes conectadas.\n• Zelar pela privacidade dos dados do cliente.\n• Demonstrar atenção a detalhes.\n• Demonstrar visão sistêmica.\n• Demonstrar consciência prevencionista em relação à saúde e segurança no trabalho e meio ambiente.',
'• O aluno deverá, no início do curso, ter no mínimo 18 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Ter concluído o curso de Eletricista Instalador, ou cursos nas áreas de eletroeletrônica, ou comprovar conhecimentos ou experiências anteriores na área de eletroeletrônica.',
'Integra tecnologias, configurando e instalando dispositivos inteligentes por meio de redes sem fio.\n\n• Instalar o módulo de acionamento de persiana.\n• Configurar os dispositivos do módulo de acionamento de persiana.\n• Instalar o módulo de controle de Iluminação.\n• Configurar os dispositivos do módulo de controle de Iluminação.\n• Instalar assistente pessoal (comando de voz) e aplicativos móveis.\n• Configurar assistente pessoal (comando de voz) e aplicativos móveis.\n• Integrar os dispositivos por meio de redes conectadas.\n• Zelar pela privacidade dos dados do cliente.\n• Demonstrar atenção a detalhes.\n• Demonstrar visão sistêmica.\n• Demonstrar consciência prevencionista em relação à saúde e segurança no trabalho e meio ambiente.',
'Mecatrônica'),

('Automação Residencial - Tecnologia e Aplicações de Dispositivos de Segurança e Conforto', TRUE, 'Gratuito', '56:00:00', NULL, '2024-10-01', '2024-12-12',
'O curso de Aperfeiçoamento Profissional de Automação Residencial - Tecnologia e Aplicações de Dispositivos de Segurança e Conforto tem por objetivo desenvolver competências relacionadas às aplicações de tecnologias utilizando dispositivos de segurança e conforto específicos para automação residencial, central de alarme e cerca elétrica, câmeras IP, acionamento e controle de persianas e iluminação e integração com assistente virtual. Instalação e configuração de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho.',
'• Instalar o módulo de acionamento de persiana.\n• Instalar o módulo de controle de Iluminação.\n• Configurar os dispositivos do módulo de acionamento de persiana.\n• Configurar os dispositivos do módulo de controle de Iluminação.\n• Instalar a Central de alarme observando aspectos de infraestrutura física e considerando: Fixação da central de alarme.\n• Conexão da bateria.\n• Instalação da sirene.\n• Realização da conexão elétrica.\n• Interpretar esquemas elétricos automotivos.\n• Sensores e atuadores.\n• Configurar a Central de alarme, considerando: Sensores e atuadores sem fio/Sensores e atuadores com fio.',
'• O aluno deverá, no início do curso, ter no mínimo 18 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Ter concluído o curso de qualificação profissional Eletricista Instalador ou comprovar conhecimentos e experiências anteriores referentes a essa qualificação, adquiridos em outros cursos, no trabalho ou em outros meios informais.',
'Realiza manutenção em motores ciclo Otto, diagnosticando e corrigindo defeitos, seguindo normas e procedimentos técnicos, ambientais e de saúde e segurança no trabalho.',
'Mecatrônica'),

('Inversores', TRUE, 'Gratuito', '24:00:00', NULL, '2024-12-07', '2024-12-21',
'O Curso de Aperfeiçoamento Profissional Inversores tem por objetivo o desenvolvimento de competências relativas à aquisição de conhecimentos, habilidades e atitudes necessários para o desenvolvimento das atividades da função prevista.',
'Revisão de máquinas CA;\nTipos de acionamentos e suas evoluções;\nConceitos de controladores escalar e vetorial;\nVantagens econômicas na operação de inversores;\nTipos, construção e características técnicas: SCR, IGBT, GTO, inversores de 6 a 12 pulsos, PWM;\nParametrização do inversor via painel frontal;',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade.\nO aluno deverá ter concluído o Nível Médio.\nTer concluído o curso de Instrumentação – Qualificação Profissional, ou possuir formação técnica ou experiência em instrumentação.',
'Revisão de máquinas CA;\nTipos de acionamentos e suas evoluções;\nConceitos de controladores escalar e vetorial;\nVantagens econômicas na operação de inversores;\nTipos, construção e características técnicas: SCR, IGBT, GTO, inversores de 6 a 12 pulsos, PWM;\nParametrização do inversor via painel frontal.',
'Mecatrônica'),

('Técnicas de Higienização e Limpeza em Condicionadores de Ar', TRUE, 'Gratuito', '16:00:00', NULL, '2024-08-10', '2024-08-12',
'O curso de Aperfeiçoamento Profissional de Técnicas de Higienização e Limpeza em Condicionadores de Ar visa a Higienização e Limpeza em Condicionadores de Ar, seguindo procedimentos do fabricante, normas ambientais, de segurança e de saúde do trabalho.',
'Identificar o funcionamento de condicionadores de ar; Interpretar legislação e referências técnicas relacionadas ao PMOC; Realizar a desmontagem e montagem dos condicionadores de ar; Realizar a limpeza e higienização dos condicionadores de ar; Trabalhar em equipe de forma colaborativa; Demonstrar capacidade de organização; Demonstrar comprometimento com o trabalho; Demonstrar atenção a detalhes; Demonstrar raciocínio lógico.',
'O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Ter concluído o Ensino Fundamental. No caso de pessoas com deficiência, conforme legislação específica, esse requisito deve considerar, sobretudo, as habilidades e competências relacionadas com a profissionalização e não somente à certificação do nível exigido; Ter idade mínima de 18 anos.',
'PERFIL PROFISSIONAL: Executar a higienização e limpeza em condicionadores de ar, seguindo procedimentos do fabricante, normas ambientais, de segurança e de saúde no trabalho. CAPACIDADES: Identificar o funcionamento de condicionadores de ar; Interpretar legislação e referências técnicas relacionadas ao PMOC; Realizar a desmontagem e montagem dos condicionadores de ar; Realizar a limpeza e higienização dos condicionadores de ar; Trabalhar em equipe de forma colaborativa; Demonstrar capacidade de organização; Demonstrar comprometimento com o trabalho; Demonstrar atenção a detalhes; Demonstrar raciocínio lógico.',
'Refrigeração e Climatização'),

('Competência Transversal - Educação Ambiental', TRUE, 'Gratuito', '14:00:00', NULL, '2024-07-10', '2024-07-11',
'Sensibilizar os participantes do curso para as questões básicas da prevenção de acidentes e segurança do trabalho, de forma a criar uma mentalidade prevencionista.',
'Primavera Silenciosa, Legislação Brasileira de Educação Ambiental, Agenda Ambiental na Administração Pública, Coleta Seletiva de Lixo, Isolamento Térmico, Consumo de Água.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Conhecimento em Windows e Internet; Ter acesso a microcomputadores conectados à Internet e dispor de email pessoal.',
'Primavera Silenciosa, Legislação Brasileira de Educação Ambiental, Agenda Ambiental na Administração Pública, Coleta Seletiva de Lixo, Isolamento Térmico, Consumo de Água.',
'Meio Ambiente'),

('Economia Circular', TRUE, 'Gratuito', '20:00:00', NULL, '2024-09-04', '2024-09-05',
'O curso Economia Circular tem como objetivo apresentar o modelo de produção circular, identificando o sistema econômico vigente e compreendendo as formas de transição nas esferas comportamental, empresarial e político-institucional.',
'1. Modelo de produção: Processo Produtivo, Riscos Lineares, Ciclos biológicos e técnicos, Cinco modelos de negócios, Princípios da Economia Circular, Escolas de pensamento, Evolução. 2. O design como fator transformador: O papel do designer, Desafios e oportunidades circulares, Estratégias, Parcerias e tecnologias, Novos modelos de negócios. 3. A transformação da indústria: A evolução do tema no mundo, O papel do CEO no processo, Desafios e oportunidades para a indústria brasileira, Tecnologias habilitadoras como facilitadoras (Big data, Internet das coisas – IoT, Blockchain e Cloud Computing). 4. Processo de transição: Redes de aceleração e colaboração, Habilidades individuais, Consumo inteligente.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 5ª série/ano do Nível Fundamental. Ter conhecimentos básicos em informática e navegação na internet; Formação inicial em qualquer área ou reconhecimento de competências para aproveitamento em prosseguimento de estudos.',
'PERFIL PROFISSIONAL: Apresenta o modelo de produção circular, identificando o sistema econômico vigente e compreendendo as formas de transição nas esferas comportamental, empresarial e político-institucional. CAPACIDADES TÉCNICAS: Reconhecer o novo modelo de produção circular. Diferenciar modelo de produção linear e circular; Reconhecer formas de implementar mudanças em projetos de negócios tendo em vista a proposta da economia circular. Identificar o papel do design na transformação da economia. Reconhecer ações que contribuam para um consumo inteligente; Identificar como as tecnologias habilitadoras da Indústria 4.0 viabilizam iniciativas circulares.',
'Meio Ambiente'),

('Competência Transversal - Segurança no Trabalho', TRUE, 'Gratuito', '14:00:00', NULL, '2024-07-10', '2024-07-11',
'Sensibilizar os participantes do curso para as questões básicas da prevenção de acidentes e segurança do trabalho, de forma a criar uma mentalidade prevencionista.',
'Conceitos e Principais acidentes de Trabalho, Uma História sobre EPI e EPC, Causas mais comuns dos acidentes de trabalho, CIPA & Mapa de Risco.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Ter conhecimento em Windows e Internet; Ter acesso a microcomputador conectado à internet e dispor de e-mail pessoal; Formação inicial em qualquer área ou reconhecimento de competências para aproveitamento em prosseguimento de estudos.',
'Conceitos e Principais acidentes de Trabalho, Uma História sobre EPI e EPC, Causas mais comuns dos acidentes de trabalho, CIPA & Mapa de Risco, Como Fazer um Suporte para Notebook: Simples, barato e muito eficaz.',
'Meio Ambiente'),

('Montagem de Painéis Elétricos', TRUE, 'Gratuito', '80:00:00', NULL, '2024-04-15', '2024-04-20',
'O Curso de Montagem de Painéis Elétricos tem por objetivo o desenvolvimento de competências relativas à montagem de quadros de comando industriais por meio de instrumentos, ferramentas, procedimentos e métodos que permitam o planejamento e execução de acordo com normas técnicas, ambientais e de segurança.',
'Capacidades Técnicas, Interpretar desenhos de layout e diagramas elétricos de comando; Realizar operações mecânicas de: Medir, Traçar, Puncionar, Furar, Escarear, Serrar, Limar, Fixar componentes. Realizar a montagem elétrica de acordo com o projeto; Posicionar os componentes; Realizar conexões elétricas; Identificar cabos e componentes; Organizar os cabos. Realizar teste de funcionamento. Capacidades sociais, organizativas e metodológicas Ter atenção a detalhes;',
'O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Concluído o curso de qualificação profissional Eletricista Instalador ou equivalente ou comprovar conhecimentos e experiências anteriores a esse aperfeiçoamento.',
'Executa montagem de quadros para comandos elétricos, interpretando diagramas de quadros de força e comandos elétricos, instalando componentes, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho. Capacidades Técnicas: Interpretar desenhos de layout e diagramas elétricos de comando; Realizar operações mecânicas de: Medir, Traçar, Puncionar, Furar, Escarear, Serrar, Limar, Fixar componentes. Realizar a montagem elétrica de acordo com o projeto; Posicionar os componentes; Realizar conexões elétricas; Identificar cabos e componentes; Organizar os cabos. Realizar teste de funcionamento. Capacidades sociais, organizativas e metodológicas Ter atenção a detalhes; Demonstrar organização.',
'Mecatrônica'),

('Instalação de Sistemas para Microgeração Fotovoltaica conectados à Rede', TRUE, 'Gratuito', '48:00:00', NULL, '2024-11-05', '2024-12-10',
'O Curso de Aperfeiçoamento Profissional - Instalação de Sistemas para Microgeração Fotovoltaica conectados à rede - tem por objetivo o desenvolvimento de competências relativas à instalação e manutenção de sistemas de energia solar fotovoltaica conectados à rede, por meio de instrumentos, ferramentas, procedimentos e métodos que permitam o planejamento, execução e avaliação das instalações e suas proteções de acordo com normas técnicas, de segurança, qualidade e ambientais.',
'• Analisar os riscos elétricos e físicos do local de instalação/manutenção do sistema de acordo com normas. • Interpretar projeto. • Avaliar conformidade do projeto com as características técnicas do local de instalação do sistema. • Crimpar conectores fotovoltaicos. • Utilizar megôhmetro para medição de resistência de isolação. • Medir corrente de curto-circuito do arranjo fotovoltaico utilizando alicate amperímetro de corrente contínua. • Fixar componentes do sistema fotovoltaico. • Montar quadros de proteção de corrente contínua e alternada. • Interligar os componentes elétricos e equipamentos. • Configurar os parâmetros de conexão dos equipamentos do gerador fotovoltaico à rede elétrica de distribuição. • Detectar falhas e defeitos nos sistemas fotovoltaicos.',
'• O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. • O aluno deverá ter concluído o Nível Fundamental. • Ter concluído o curso de qualificação profissional na área de informática e eletroeletrônica ou eletricidade ou comprovar conhecimentos e experiências anteriores a esse aperfeiçoamento. • Ter concluído o curso Energia Solar Fotovoltaica - Tecnologias e Aplicações, ou comprovar conhecimentos ou experiências anteriores relacionadas a este curso.',
'Realiza Instala e mantém sistemas de energia solar fotovoltaicos conectados à rede para microgeração distribuída, por meio de instrumentos e ferramentas, de acordo com normas técnicas, de segurança, qualidade e meio ambiente. Demonstrar organização.',
'Mecatrônica'),

('Eletrônica Digital', TRUE, 'Gratuito', '80:00:00', NULL, '2024-11-08', '2024-12-08',
'O curso de Aperfeiçoamento Profissional de Eletrônica Digital tem por objetivo o desenvolvimento de competências relativas à montagem de circuitos eletrônicos digitais, utilizando instrumentos e ferramentas específicas da área, analisando, interpretando e esboçando diagramas, de acordo com normas e procedimentos de segurança e saúde no trabalho e de proteção ao meio ambiente.',
'Simplificar expressões lógicas; Simular em Protoboard funções e portas lógicas utilizando circuitos integrados; Analisar circuitos combinacionais e sequenciais; Implementar circuitos combinacionais e sequenciais; Testar circuitos combinacionais e sequenciais; Solucionar defeitos em circuitos combinacionais e sequenciais; Utilizar manuais e catálogos técnicos; Utilizar simuladores e aplicativos para testes de funções e portas lógicas; Demonstrar pensamento analítico; Demonstrar autogestão;',
'O aluno deverá, no início do curso, ter no mínimo 18 anos de idade. /n O aluno deverá ter concluído o Nível Fundamental. /n Ter concluído o curso de qualificação profissional na área de Eletroeletrônica ou comprovar conhecimentos e experiências anteriores referentes a esse aperfeiçoamento, adquiridos em outros cursos, no trabalho ou em outros meios informais.',
'Executa trabalhos de montagem e manutenção de comandos elétricos de máquinas e equipamentos, interpretando diagramas e esquemas elétricos, utilizando instrumentos, ferramentas e aparelhos de medição, atuando individualmente ou participando de equipes de trabalho, de acordo com normas técnicas, ambientais, de qualidade e de segurança e saúde no trabalho.',
'Mecatrônica'),

 ('Implantação de Serviços em Nuvem - AWS Cloud Practitioner Foundational',
  TRUE,
    'Gratuito',
    '40:00:00',
     NULL,
    '2024-11-04',
    '2024-11-26',
    'O Curso de Aperfeiçoamento Profissional de Implantação de Serviços em Nuvem - AWS Cloud Practitioner Foundational tem por objetivo o desenvolvimento de competências relativas à implantação e gerenciamento de serviços em nuvem, por meio dos conteúdos formativos da AWS Foundation, possibilitando que o profissional pleiteie a certificação AWS Cloud Practitioner Foundational.',
    '• Configurar redes de microcomputadores.\n• Identificar características de serviços em nuvem.\n• Configurar máquina virtual (IaaS) - infraestrutura como serviço.\n• Configurar web server (PaaS) - plataforma como serviço.\n• Configurar armazenamento em nuvem (SaaS) - software como serviço.\n• Configurar soluções de segurança de serviços em nuvem.\n• Integrar serviços de plataforma em nuvem.\n• Definir modelos de contratação de serviços em nuvem.\n• Monitorar serviços em nuvem.\n• Redefinir configurações de serviços em nuvem.\n• Demonstração raciocínio lógico.\n• Demonstrar atenção aos detalhes.',
    '• O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Ter conhecimentos em fundamentos de redes de computadores.',
    'Implementa e gerencia serviços utilizando plataformas em nuvem da empresa AWS, seguindo procedimentos e normas técnicas de qualidade.',
    'Tecnologia '
),

 ('Implantação de Serviços em Nuvem - Microsoft AZ-900',
  TRUE,
    'Gratuito',
    '40:00:00',
     NULL,
    '2024-04-15',
    '2024-04-20',
    'O Curso de Aperfeiçoamento Profissional de Implantação de Serviços em Nuvem - Microsoft AZ-900 tem por objetivo o desenvolvimento de competências relativas à implantação e gerenciamento de serviços em nuvem, por meio dos conteúdos formativos da Microsoft, possibilitando que o profissional pleiteie a certificação Microsoft - AZ-900.',
    '1. Identificar características de serviços em nuvem;\n2. Configurar arquitetura dos serviços da nuvem;\n3. Provisionar recursos em nuvem;\n4. Aplicar gerenciamento de nuvem;\n5. Aplicar governança em serviços de nuvem;\n6. Demonstração raciocínio lógico;\n7. Demonstrar atenção aos detalhes.',
    'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\nO aluno deverá ter concluído o Nível Fundamental.\nTer conhecimentos em informática básica.',
    'PERFIL: Implementa e gerencia serviços utilizando plataformas em nuvem da empresa Microsoft, seguindo procedimentos e normas técnicas de qualidade.\nCAPACIDADES:\n1. Identificar características de serviços em nuvem;\n2. Configurar arquitetura dos serviços da nuvem;\n3. Provisionar recursos em nuvem;\n4. Aplicar gerenciamento de nuvem;\n5. Aplicar governança em serviços de nuvem;\n6. Demonstração raciocínio lógico;\n7. Demonstrar atenção aos detalhes.',
    'Tecnologia'
),

('CCNA V7: INTRODUCTION TO NETWORKS', TRUE, 'Grauito', '72:00:00', NULL, '2024-10-16', '2024-11-26',
'O Curso de Aperfeiçoamento CCNA V7: INTRODUCTION TO NETWORKS tem por objetivo desenvolver competências profissionais referentes ao planejamento, configuração e implementação de redes locais (LAN) de pequeno porte, parametrizando roteadores e switches, bem como endereçamento IP.',
'Capacidades técnicas, configurando switches e roteadores, etc.',
'O aluno deverá ter no mínimo 14 anos de idade, ter concluído o Nível Fundamental e comprovar conhecimentos em Informática Básica.',
'Planeja, configura e implementa redes LAN de pequeno porte, etc.',
'Tecnologia'
),

('CCNA V7: SWITCHING, ROUTING AND WIRELESS ESSENTIALS', TRUE, 'Grauito', '72:00:00', NULL, '2024-11-11', '2024-12-19',
'O Curso CCNA V7: SWITCHING, ROUTING AND WIRELESS ESSENTIALS tem por objetivo desenvolver competências profissionais referentes a configuração e solução de problemas nos dispositivos de camada 2 e 3 (switch e roteador), identificando e mitigando ameaças de segurança de LAN, além de configuração e proteção de uma WLAN básica, tendo em vista a segurança e redundância dos equipamentos em redes de pequeno e médio porte.',
'Configurar switches e roteadores, VLAN, Roteamento Inter-VLAN, etc.',
'O aluno deverá ter no mínimo 14 anos de idade, ter concluído o Nível Fundamental e comprovar conhecimentos e experiências anteriores referentes aos cursos CCNA V7: INTRODUCTION TO NETWORKS.',
'Efetua configurações avançadas em roteadores, switches e redes sem fio, com enfoque em segurança e desempenho de rede.',
'Tecnologia'
),

('Fundamentos de Ciência de Dados - Google Cloud', TRUE, 'Grauito', '20:00:00', NULL, '2024-10-05', '2024-11-02',
'O curso Fundamentos de Ciência de Dados - Google Cloud tem por objetivo desenvolver capacidades que possibilitem ao concluinte implementar serviços de ciência de dados em nuvem, utilizando métodos, processos, algoritmos e sistemas na extração de conhecimento e insights a partir de dados públicos e privados.',
'Análise de Dados, Serviços da Google Cloud (incluindo Big Query, Looker, AppSheet, etc.) e Ambientes de Nuvem.',
'O aluno deverá ter no mínimo 14 anos de idade, ter concluído o Nível Fundamental e comprovar conhecimentos em Informática Básica adquiridos em outros cursos ou meios informais.',
'Implementa serviços de ciência de dados em nuvem, utilizando métodos e processos para extração de conhecimento a partir de dados públicos e privados.',
'Tecnologia'
),

(
    'Implantação e Análise de Dados em Nuvem - Microsoft DP-900',
     TRUE,
    'Gratuito',
    '40:00:00',
     NULL,
    '2024-11-18',
    '2024-12-10',
    'O curso de Implantação e Análise de Dados em Nuvem tem por objetivo preparar o estudante para certificações como a Microsoft DP-900, desenvolvendo capacidades que possibilitem ao concluinte implementar serviços de armazenamento e análise de dados, utilizando as principais tecnologias da área disponíveis nos serviços de nuvem.',
    '• Aplicar os principais conceitos de armazenamento de dados em nuvem.\n• Implementar serviços de banco de dados relacionais em nuvem.\n• Implementar serviços de banco não-relacionais em nuvem.\n• Realizar análises de Data Warehouse em nuvem.',
    '• O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Ter conhecimento básico de serviços relacionados à nuvem.\n• Ter conhecimentos básicos em banco de dados.',
    'Implementa e analisa serviços de armazenamento de dados, utilizando as principais tecnologias da área disponíveis nos serviços de nuvem.',
    'Tecnologia'
),

(
    'Soluções integradas com IOT',
     TRUE,
    'Gratuito',
    '60:00:00',
     NULL,
    '2024-10-16',
    '2024-11-19',
    'O Curso de Aperfeiçoamento Profissional de Soluções integradas com IoT tem por objetivo o desenvolvimento de competências relativas à implementação de soluções com tecnologias de IoT para a integração de sistemas, por meio de sensores, atuadores e aplicações de interfaces gráficas, seguindo boas práticas, procedimentos e normas.',
    '• Identificar as diferenças entre as aplicações do IoT e IIoT.\n• Identificar os tipos de hardwares e soluções disponíveis.\n• Utilizar ambientes de desenvolvimento.\n• Implantar protocolos de comunicação.\n• Integrar a automação em plataforma na nuvem.\n• Conectar as aplicações gráficas.\n• Demonstrar capacidade de organização.\n• Demonstrar atenção a detalhes.\n• Demonstrar raciocínio lógico.',
    '• O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Comprovar conhecimentos referentes à Informática Básica adquiridos em outros cursos, no trabalho ou em outros meios informais.',
    'Integrar sistemas por meio de sensores, atuadores e aplicações, seguindo boas práticas, procedimentos e normas.',
    'Tecnologia'
),

 (
    'Microsoft Power BI',
     TRUE,
    'Gratuito',
    '32:00:00',
     NULL,
    '2024-10-01',
    '2024-10-24',
    'O curso de Aperfeiçoamento Profissional de Microsoft Power BI tem por objetivo o desenvolvimento de competências relacionadas desenvolver soluções por meio da plataforma de business intelligence (BI), utilizado para transformar dados brutos em informações úteis, insights de negócios e seguindo boas práticas, procedimentos e normas.',
    '• Preparar dados de acordo com fontes de dados variadas.\n• Criar modelo de dados por meio da extração, transformação e limpeza de dados.\n• Fornecer representações visuais dos dados.\n• Implantar ativos.\n• Demonstrar capacidade de organização.\n• Demonstrar atenção a detalhes.\n• Demonstrar raciocínio lógico.',
    '• O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Comprovar conhecimentos referentes à Informática Básica adquiridos em outros cursos, no trabalho ou em outros meios informais.',
    'Criar indicadores, coletar, analisar e visualizar dados de maneira eficaz para auxiliar na tomada de decisões nas organizações e seguindo boas práticas, procedimentos e normas.',
    'Tecnologia'
),

(
    'Programação em Python para Data Science',
     TRUE,
    'Gratuito',
    '60:00:00',
     NULL,
    '2024-04-15',
    '2024-05-01',
    'O Curso de Aperfeiçoamento Profissional Programação em Python para Data Science tem por objetivo o desenvolvimento de competências relativas a programação utilizando codificações na linguagem Python, com vistas a coleta, limpeza, organização e transformação de dados e seguindo boas práticas, procedimentos e normas.',
    '• Utilizar modelos estatísticos para coleta e tratamento de dados;\n• Elaborar programas em linguagem Python para coleta, limpeza, organização e visualização de dados;\n• Utilizar bibliotecas em Python para data science;\n• Realizar o tratamento, análise e visualização dos dados (refatoração);\n• Demonstrar raciocínio lógico;\n• Demonstrar capacidade de organização;\n• Demonstrar atenção a detalhes.',
    '• O aluno deverá, no início do curso, ter no mínimo 14 anos de idade.\n• O aluno deverá ter concluído o Nível Fundamental.\n• Ter conhecimentos na área, adquiridos em cursos ou trabalhos formais e informais.',
    'PERFIL: Programar em linguagem Python, por meio de técnicas e codificações com vistas a coleta, limpeza, organização e transformação de dados, seguindo as boas práticas, procedimentos e normas.\nCAPACIDADES: Utilizar modelos estatísticos para coleta e tratamento de dados;\nElaborar programas em linguagem Python para coleta, limpeza, organização e visualização de dados;\nUtilizar bibliotecas em Python para data science;\nRealizar o tratamento, análise e visualização dos dados (refatoração);\nDemonstrar raciocínio lógico;\nDemonstrar capacidade de organização;\nDemonstrar atenção a detalhes.',
    'Tecnologia'
),

('Competência Transversal - Finanças Pessoais', TRUE, 'Gratuito', '14:00:00', NULL,'2024-04-15', '2025-04-16',
'Tornar o estudante apto a identificar a importância do equilíbrio financeiro para obter mais qualidade de vida, tranquilidade e motivação.',
'Perfil financeiro. Importância da educação financeira. Planejamento e Finanças pessoais. Gestão de dívidas. Direitos do consumidor endividado. Investimentos.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Conhecimento em Windows e Internet; Ter acesso a microcomputadores conectados à Internet e dispor de email pessoal.',
'Determine o seu perfil financeiro, Importância da educação financeira, Planejamento e finanças pessoais, Gerenciando suas dívidas, Direitos do consumidor endividado, Investimentos, Conteúdo Extra',
'Administração e Gestão'),

('Competência Transversal - Fundamentos de Logística', TRUE, 'Gratuito', '14:00:00', NULL, '2024-04-15', '2025-04-16',
'Conhecer as questões fundamentais da logística, seu histórico, conceitos, e de como utilizar melhor a logística num ambiente empresarial envolvido no mercado globalizado.',
'Contexto histórico do transporte no Brasil, Modalidades de Transporte, Sistemas de Transporte, Modal Rodoviário, Modal Ferroviário, Modal Aquaviário, Modal Dutoviário, Modal Aéreo, Gestão da Qualidade, Logística de almoxarifado.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Conhecimento em Windows e Internet; Ter acesso a microcomputadores conectados à Internet e dispor de email pessoal.',
'Contexto histórico do transporte no Brasil, Modalidades de Transporte, Sistemas de Transporte, Modal Rodoviário, Modal Ferroviário, Modal Aquaviário, Modal Dutoviário, Modal Aéreo, Gestão da Qualidade, Logística de almoxarifado.',
'Administração e Gestão'),

('Competência Transversal - Propriedade Intelectual', TRUE, 'Gratuito', '14:00:00', NULL, '2024-04-15', '2025-04-16',
'Compreender aspectos ligados à propriedade intelectual, bem como, os benefícios da proteção dos produtos derivados da criatividade e da inovação.',
'Falsificação de produtos. Falsificação de softwares. Patente e sigilo industrial. Proteção do desenho industrial. Uso da marca. Proteção da origem e procedência. Proteções especiais.',
'O aluno deverá, no início do curso, ter no mínimo 14 anos de idade. O aluno deverá ter completado a 6ª série/ano do Nível Fundamental. Ter conhecimento em Windows e Internet; Ter acesso a microcomputador conectado à internet e dispor de e-mail pessoal; Formação inicial em qualquer área ou reconhecimento de competências para aproveitamento em prosseguimento de estudos.',
'Falsificação de produtos. Falsificação de softwares. Patente e sigilo industrial. Proteção do desenho industrial. Uso da marca. Proteção da origem e procedência. Proteções especiais.',
'Administração e Gestão'),

('Alimentos Funcionais', TRUE, 'Gratuito', '20:00:00', NULL, '2024-11-04', '2024-11-07',
'O curso de Aperfeiçoamento Profissional de Alimentos Funcionais tem por objetivo o desenvolvimento de capacidades relativas ao aperfeiçoamento de acadêmicos, docentes, pesquisadores, profissionais das indústrias da área de alimentos e o público no geral sobre alimentos funcionais, bem como sobre as substâncias bioativas contidas nestes alimentos, visando sua aplicação na indústria de alimentos, de acordo com os seus requisitos legais.',
'Reconhecer os alimentos funcionais, benefícios, mercado nacional e internacional, componentes bioativos, normas e legislações, propriedades e efeitos fisiológicos, veracidade das informações, tendências e inovações.',
'Ter no mínimo 18 anos, 6ª série/ano do Nível Fundamental, curso de qualificação na área eletroeletrônica ou comprovar conhecimentos anteriores.',
'Aperfeiçoamento de acadêmicos, docentes, pesquisadores, profissionais das indústrias da área de alimentos e o público no geral sobre alimentos funcionais, visando sua aplicação na indústria de alimentos.',
'Alimentos e Bebidas'),

('Desvendando o BIM', TRUE, 'Gratuito', '20:00:00', NULL, '2024-06-05', '2024-06-07',
'O Curso de Aperfeiçoamento Profissional Desvendando o BIM tem por objetivo apresentar a metodologia BIM, sua influência, requisitos e benefícios para cadeia de construção civil.',
'Definições de BIM, Histórico do uso do BIM, Usos do BIM, Modelagem parametrizada, Ciclo de vida da Construção, Softwares, Tendências para futuro do BIM.',
'O aluno deverá ter no mínimo 16 anos, completado a 4ª série/ano do Nível Fundamental, conhecimentos básicos em informática e navegação na internet; formação inicial em qualquer área ou reconhecimento de competências.',
'Atuar na identificação do uso da metodologia BIM em projetos da Arquitetura, Engenharia e Construção (AEC), reconhecendo a linguagem tridimensional para clareza das informações na construção civil.',
'Construção Civil'),

('Costureiro sob medida', TRUE, 'Pago', '160:00:00', NULL, '2024-05-25', '2024-06-02',
'O Curso de Qualificação Profissional Costureiro sob medida tem por objetivo o desenvolvimento de competências relativas à elaboração de modelagem, corte em tecido plano e costura de saia, calça, blusa básica e com pence considerando medidas tomadas do corpo humano, realizando a prova e os ajustes das peças conforme os tipos de silhuetas, seguindo normas ambientais e de saúde e segurança do trabalho.',
'Capacidades: Tomar medidas do corpo humano utilizando fita métrica, Identificar as partes do corpo humano, aplicando conceitos de antropometria, Diagramar saia, calça, blusa básica e com pence...',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 4ª série/ano do Nível Fundamental.',
'PERFIL PROFISSIONAL: Executa a modelagem, corte em tecido plano e costura peças básicas, considerando medidas tomadas do corpo humano, realizando a prova e os ajustes das peças conforme os tipos de silhuetas, seguindo normas ambientais e de saúde e segurança do trabalho.',
'Design de Moda'),

('Costureiro de Máquina Reta e Overloque', TRUE,  'Gratuito', '160:00:00', NULL, '2024-02-20', '2024-02-28',
'O Curso Costureiro de máquina reta e overloque tem por objetivo o desenvolvimento de competências relativas às operações de costura em tecidos planos e de malha, em máquinas reta e overloque e a realização de montagem de peças do vestuário, controlando a qualidade do trabalho, seguindo especificações da ficha técnica, procedimentos da empresa, normas ambientais, de saúde e segurança do trabalho.',
'Capacidades: Identificar tipos de máquinas, Identificar partes da máquina reta, Identificar partes da máquina overloque, Identificar tipos de tecidos, Identificar partes do produto, Selecionar acessórios de acordo a operação, Identificar aviamentos de acordo com ficha técnica, Preparar máquina reta de acordo com ficha técnica e tecido, Preparar máquina overloque de acordo com ficha técnica e tecido, Interpretar ficha técnica, Interpretar peça piloto, Identificar falhas no processo, Realizar preparação de peças para costura considerando: chuleado, vinco de acordo com o gabarito ou medida, zíper, bolso, pence, elástico, vista, carcela, punho, gola. Realizar montagem de peças considerando as costuras de: cós, gancho, gola, elástico, lateral, manga, carcela, punho, ombro, pala, entrepernas, recortes. Realizar acabamento de peças para costura considerando: barra, pesponto, gola, cós, arremate, passante, passadoria. Demonstrar organização, Demonstrar atenção a detalhes, Prever consequências.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter completado a 4ª série/ano do Nível Fundamental.',
'PERFIL PROFISSIONAL: Executa a modelagem, corte em tecido plano e costura peças básicas, considerando medidas tomadas do corpo humano, realizando a prova e os ajustes das peças conforme os tipos de silhuetas, seguindo normas ambientais e de saúde e segurança do trabalho. CAPACIDADES: Tomar medidas do corpo humano utilizando fita métrica, Identificar as partes do corpo humano, aplicando conceitos de antropometria, Diagramar saia, calça, blusa básica e com pence, Destacar molde de corte saia, calça, blusa básica e com pence, Selecionar o material para a construção do molde, Dimensionar metragem do papel de acordo com as medidas utilizando as linhas de referência do corpo humano, Dimensionar metragem do tecido de acordo com o molde pronto, Contornar o molde utilizando o giz, fazendo marcações necessárias, Cortar o tecido utilizando tesoura marcando os piques, Identificar tipos de máquinas, Identificar partes da máquina reta, Identificar partes da máquina overloque, Identificar partes do produto, Selecionar acessórios de acordo a operação, Identificar aviamentos, Preparar máquina reta de acordo com o tecido, Preparar máquina overloque de acordo com o tecido, Identificar falhas no processo, Realizar preparação da calça, saia, blusa básica e com pence para costura, Realizar montagem da calça, saia, blusa básica e com pence, Realizar acabamento da calça, saia, blusa básica e com pence para costura, Alinhavar as partes que compõem a peça, Realizar a prova da peça, fazendo os ajustes necessários, Prever consequências, Demonstrar raciocínio lógico, Demonstrar atenção a detalhes, Demonstrar capacidade de organização.',
'Design de Moda'),

('Alinhamento Estratégico Aplicado à Gestão', TRUE, 'Grauito', '12:00:00', NULL, '2024-04-14', '2024-04-16',
'O curso de Aperfeiçoamento Profissional de Alinhamento Estratégico Aplicado à Gestão tem por objetivo desenvolver competências relacionadas à análise da concorrência, identificação de diferenciais competitivos para alinhamento estratégico da organização.',
'1. Identificar os principais concorrentes; 2. Identificar os diferenciais competitivos da Indústria; 3. Reconhecer ferramentas de mercado.',
'O aluno deverá, no início do curso, ter no mínimo 16 anos de idade. O aluno deverá ter concluído o Nível Fundamental. Formação inicial em qualquer área ou reconhecimento de competências para aproveitamento em prosseguimento de estudos; Ter conhecimento de informática básica e navegação na internet.',
'PERFIL: Reconhece a análise da concorrência, identificando seus diferenciais competitivos para alinhamento estratégico da organização.',
'Administração e Gestão');

INSERT INTO salas(nome)
VALUES
('Auditório'),
('Biblioteca'),
('Oficina de Automobilística'),
('Oficina de Costura'),
('Laboratório de Metrologia'),
('Laboratório de Automoção Residencial'),
('Sala de Solda'),
('Oficina de Usinagem'),
('Laboratório de Redes - TI'),
('Sala C1'),
('Sala C2'),
('Sala C3'),
('Laboratório de Administração'),
('Sala C5'),
('Laboratório CAD'),
('Laboratório CAM'),
('Laboratório TI 1'),
('Laboratório TI 2'),
('Laboratório TI 3'),
('Laboratório TI 4'),
('Laboratório de Hidráulica'),
('Sala CLP'),
('Laboratório de Eletroeletrônica'),
('Laboratório de Máquina e Comandos'),
('Oficina Elétrica 1'),
('Oficina Elétrica 2');

CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_user_id INT,
    id_room_id INT,
    id_turno_id INT,
    id_periodo_id INT,
    reserved_day DATE,
    id_curso_id INT,
    id_status_id INT,
    reserve_time DATETIME,
    FOREIGN KEY (id_status_id) REFERENCES status(id_status),
    FOREIGN KEY (id_periodo_id) REFERENCES periodos(id_periodo),
    FOREIGN KEY (id_turno_id) REFERENCES turnos(id_turno),
    FOREIGN KEY (id_user_id) REFERENCES usuarios(id_user),
    FOREIGN KEY (id_room_id) REFERENCES salas(id_room),
    FOREIGN KEY (id_curso_id) REFERENCES cursos(id_curso)
);

CREATE TABLE reservas_log (
    id_log INT AUTO_INCREMENT PRIMARY KEY,  -- ID do log de auditoria
    id_reserva_id INT,                      -- ID da reserva (chave estrangeira)
    id_room_id INT,                         -- ID da sala (chave estrangeira)
    id_turno_id INT,                        -- ID do turno (chave estrangeira)
    id_periodo_id INT,                      -- ID do período (chave estrangeira)
    reserved_day DATE,                      -- Data da reserva
    id_curso_id INT,                        -- ID do curso (chave estrangeira)
    id_user_id INT,                         -- ID do usuário (chave estrangeira)
    reserve_time DATETIME,                  -- Hora de reserva
    FOREIGN KEY (id_reserva_id) REFERENCES reservas(id_reserva),  -- Relaciona com a tabela reservas
    FOREIGN KEY (id_room_id) REFERENCES salas(id_room),       -- Relaciona com a tabela salas
    FOREIGN KEY (id_turno_id) REFERENCES turnos(id_turno),    -- Relaciona com a tabela turnos
    FOREIGN KEY (id_periodo_id) REFERENCES periodos(id_periodo), -- Relaciona com a tabela periodos
    FOREIGN KEY (id_curso_id) REFERENCES cursos(id_curso),    -- Relaciona com a tabela cursos
    FOREIGN KEY (id_user_id) REFERENCES usuarios(id_user)     -- Relaciona com a tabela usuarios
);




DELIMITER $$

CREATE TRIGGER after_update_reservas
AFTER UPDATE ON reservas
FOR EACH ROW
BEGIN
    INSERT INTO reservas_log (
        id_reserva_id, 
        id_room_id, 
        id_turno_id, 
        id_periodo_id, 
        reserved_day, 
        id_curso_id, 
        id_user_id, 
        reserve_time
    )
    VALUES (
        old.id_reserva,      -- Pegando o ID da reserva do novo valor
        old.id_room_id,      -- Pegando o ID da sala do novo valor
        old.id_turno_id,     -- Pegando o ID do turno do novo valor
        old.id_periodo_id,   -- Pegando o ID do período do novo valor
        old.reserved_day,    -- Pegando a data da reserva do novo valor
        NEw.id_curso_id,     -- Pegando o ID do curso do novo valor
        new.id_user_id,      -- Pegando o ID do usuário do novo valor
        NEW.reserve_time     -- Pegando o tempo da reserva do novo valor
    );
END $$

DELIMITER ;






DELIMITER $$

CREATE PROCEDURE InserirReservasParaAnoInteiro()
BEGIN
    DECLARE data_atual DATE;
    DECLARE ultima_data DATE;
    DECLARE hoje DATE;
    DECLARE status_reserva INT;
    DECLARE id_sala INT;

    -- Define a data inicial e final para o ano
    SET data_atual = '2024-01-01';
    SET ultima_data = '2024-12-31';
    SET hoje = CURDATE(); -- Define a data atual do sistema

    -- Loop para percorrer todas as datas do ano
    WHILE data_atual <= ultima_data DO

        -- Define o status: 2 (Indisponível) se for antes de hoje, senão 1 (Disponível)
        IF data_atual < hoje THEN
            SET status_reserva = 2; -- Indisponível (Reservado)
        ELSE
            SET status_reserva = 1; -- Disponível
        END IF;

        -- Loop para percorrer cada sala de 1 a 26
        SET id_sala = 1;
        WHILE id_sala <= 26 DO

            -- Insere as 4 combinações de turno e período para cada dia e sala, com id_curso_id = 1
            INSERT INTO reservas (id_user_id, id_room_id, id_turno_id, id_periodo_id, reserved_day, id_status_id, id_curso_id, reserve_time)
            VALUES
            (1, id_sala, 1, 1, data_atual, status_reserva, 1, NOW()), -- Manhã, Antes do Intervalo
            (1, id_sala, 1, 2, data_atual, status_reserva, 1, NOW()), -- Manhã, Após o Intervalo
            (1, id_sala, 2, 1, data_atual, status_reserva, 1, NOW()), -- Tarde, Antes do Intervalo
            (1, id_sala, 2, 2, data_atual, status_reserva, 1, NOW()); -- Tarde, Após o Intervalo

            -- Avança para a próxima sala
            SET id_sala = id_sala + 1;

        END WHILE;

        -- Avança para o próximo dia
        SET data_atual = DATE_ADD(data_atual, INTERVAL 1 DAY);

    END WHILE;
END $$

DELIMITER ;



CALL InserirReservasParaAnoInteiro();