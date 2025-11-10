% GRUPO: Arthur Garcia Torrezani, Luiz Felipe Sena e Pedro Augusto Nascimento

% Usuarios (ID, Nome, Idade, Pais)
usuario(1, 'Alice', 25, 'Brasil').
usuario(2, 'Bob', 30, 'EUA').
usuario(3, 'Carlos', 28, 'México').
usuario(4, 'Diana', 22, 'Canadá').
usuario(5, 'Eva', 35, 'Brasil').
usuario(6, 'Frank', 33, 'Alemanha').
usuario(7, 'Grace', 27, 'Espanha').
usuario(8, 'Hugo', 40, 'Brasil').
usuario(9, 'Ivy', 26, 'Japão').
usuario(10, 'Jack', 31, 'Austrália').

% Posts (ID_Post, ID_Usuario, Conteudo, Likes, Data)
post(1, 1, 'Bom dia a todos!', 15, '2024-01-01').
post(2, 2, 'Adorando a vida!', 22, '2024-01-02').
post(3, 3, 'Viajando pelo mundo!', 45, '2024-01-03').
post(4, 4, 'Estudando Prolog hoje.', 10, '2024-01-04').
post(5, 5, 'Almoço em família.', 30, '2024-01-05').
post(6, 6, 'Trabalhando no projeto.', 25, '2024-01-06').
post(7, 7, 'Lindo dia de sol!', 18, '2024-01-07').
post(8, 8, 'Visitando o Rio de Janeiro!', 50, '2024-01-08').
post(9, 9, 'Lendo um livro incrível.', 12, '2024-01-09').
post(10, 10, 'Relaxando na praia.', 20, '2024-01-10').

% Curtidas (ID_Post, ID_Usuario)
curtida(1, 2).
curtida(1, 3).
curtida(2, 1).
curtida(2, 4).
curtida(3, 5).
curtida(4, 6).
curtida(5, 7).
curtida(6, 8).
curtida(7, 9).
curtida(8, 10).
curtida(9, 1).
curtida(10, 2).
curtida(1, 4).
curtida(3, 6).
curtida(2, 5).
curtida(5, 8).
curtida(6, 9).
curtida(7, 10).

% amizade (ID_Usuario1, ID_Usuario2)
amizade(1, 2).
amizade(1, 3).
amizade(2, 4).
amizade(2, 5).
amizade(3, 6).
amizade(3, 7).
amizade(4, 8).
amizade(4, 9).
amizade(5, 10).
amizade(6, 1).
amizade(7, 2).
amizade(8, 3).
amizade(9, 4).
amizade(10, 5).
amizade(6, 7).
amizade(8, 9).
amizade(1, 10).

% Mensagens (ID_Msg, ID_Usuario1, ID_Usuario2, Conteudo, Data)
mensagem(1, 1, 2, 'Oi, tudo bem?', '2024-01-01').
mensagem(2, 2, 1, 'Tudo sim, e vc?', '2024-01-01').
mensagem(3, 3, 4, 'Vamos nos encontrar hoje?', '2024-01-02').
mensagem(4, 4, 3, 'Claro, que horas?', '2024-01-02').
mensagem(5, 5, 6, 'Parabéns pelo projeto!', '2024-01-03').
mensagem(6, 6, 5, 'Obrigado!', '2024-01-03').
mensagem(7, 7, 8, 'Te vejo mais tarde.', '2024-01-04').
mensagem(8, 8, 7, 'Combinado!', '2024-01-04').
mensagem(9, 9, 10, 'Gostei do post.', '2024-01-05').
mensagem(10, 10, 9, 'Valeu!', '2024-01-05').

% Interacoes (ID_Usuario1, ID_Usuario2, Tipo, Data)
interacao(1, 2, comentario, '2024-01-01').
interacao(2, 1, curtida, '2024-01-01').
interacao(3, 4, mensagem, '2024-01-02').
interacao(4, 3, mensagem, '2024-01-02').
interacao(5, 6, curtida, '2024-01-03').
interacao(6, 5, comentario, '2024-01-03').
interacao(7, 8, curtida, '2024-01-04').
interacao(8, 7, mensagem, '2024-01-04').
interacao(9, 10, comentario, '2024-01-05').
interacao(10, 9, curtida, '2024-01-05').

% I. Identificar amizades bidirecionais (amizade recíproca).

amizade_bidirecional(AMIGO1, AMIGO2) :- amizade(AMIGO1, AMIGO2), amizade(AMIGO2, AMIGO1).

% II. Identificar amigos em comum entre dois usuários.

amigos_em_comum(AMIGO1, AMIGO2) :- amizade(AMIGO1, AMIGO3), amizade(AMIGO3, AMIGO2).

% III. Verificar se um usuário curtiu um post de um amigo. Observação: utilize o operador ‘_’ (variável anônima).

curtiu_post_amigo(AMIGO1, AMIGO2) :- curtida(POST, AMIGO1), post(POST, AMIGO2, _, _, _).

% IV. Verificar se dois usuários interagiram diretamente (mensagem ou comentário). Observação: utilize ‘; ’ (or) e ‘_’ (variável anônima).

interacao_usuarios(U1, U2) :- interacao(U1, U2, mensagem, _); interacao(U1, U2, comentario, _).

% V. Descobrir amigos de amigos (relacionamento indireto). Observação: utilize ‘\+ ’ (not).

amigo_indireto(USUARIO, AMIGO_DO_AMIGO) :-
    amizade(USUARIO, AMIGO_INTERMED),
    amizade(AMIGO_INTERMED, AMIGO_DO_AMIGO),
    USUARIO \= AMIGO_DO_AMIGO,
    \+ amizade(USUARIO, AMIGO_DO_AMIGO).

% VI. Calcular o número de amigos de um usuário. Observação: utilize a função findall.

numero_de_amigos(USUARIO, N_AMIGOS) :- findall(_, (amizade(USUARIO, X); amizade(X, USUARIO)), LISTA), sort(LISTA, UNICOS), length(UNICOS, N_AMIGOS).

% VII. Encontrar a quantidade de curtidas por usuário. Observação: utilize as funções findall e lenght;

quantidade_de_curtidas(USUARIO, N_CURTIDAS) :- findall(_, curtida(POST, USUARIO), Lista), length(Lista, N_CURTIDAS).

% I. Contar quantas interações um usuário realizou (em ambos os sentidos)
quantidade_de_interacoes(USUARIO, QTD_INTERACAO) :-
    findall(_, interacao(USUARIO, OUTRO, Tipo, Data), LISTA1),
    findall(_, interacao(OUTRO, USUARIO, Tipo, Data), LISTA2),
    append(LISTA1, LISTA2, LISTA_INTERACOES),
    length(LISTA_INTERACOES, QTD_INTERACAO).

% II. Calcular o número total de curtidas que os posts de um usuário receberam.
total_curtidas(USUARIO, N_CURTIDAS) :-
    findall(ID_Post, (post(ID_Post, USUARIO, _, _, _), curtida(ID_Post, _)), LISTA),
    length(LISTA, N_CURTIDAS).

% III. Encontrar usuários que podem ser sugeridos como amigos (amigos de amigos).
sugestao_amigos(USUARIO, AMIGO_SUGERIDO) :-
    amizade(USUARIO, AMIGO2),
    amizade(AMIGO2, AMIGO_SUGERIDO),
    USUARIO \= AMIGO_SUGERIDO,
    \+ amizade(USUARIO, AMIGO_SUGERIDO).

% IV. Identificar grupos de três usuários que são todos amigos entre si.
amigos_entre_si(USUARIO, AMIGO1, AMIGO2) :-
    amizade_bidirecional(USUARIO, AMIGO1),
    amizade_bidirecional(USUARIO, AMIGO2),
    amizade_bidirecional(AMIGO1, AMIGO2).

% V. Contar quantas amizades um usuário possui.
quantidade_amizade(USUARIO, QTD_AMIGOS) :-
    findall(_, amizade(USUARIO, AMIGO), LISTA),
    length(LISTA, QTD_AMIGOS).

% VI. Encontrar usuários que interagiram mais de uma vez.
interacoes_a_mais(USUARIO, QTD_INTERACAO) :-
    findall(USUARIO, interacao(USUARIO, _, _, _), LISTA1),
    findall(USUARIO, interacao(_, USUARIO, _, _), LISTA2),
    append(LISTA1, LISTA2, LISTA_INTERACOES),
    length(LISTA_INTERACOES, QTD_INTERACAO),
    QTD_INTERACAO > 1.

% VII. Definir centralidade – quantidade de amigos + total de iterações – (mede a relevância do usuário na
% rede). Observação: utilize o operador is.
centralidade_amigos(USUARIO, C) :- quantidade_amizade(USUARIO, N1), quantidade_de_interacoes(USUARIO, N2), C is N1 + N2.

% VIII. Gerar um ranking de usuários com base nas interações e amizades.
ranking_usuarios(Ranking) :-
    findall(C-Nome, (usuario(U, Nome, _, _),centralidade_amigos(U, C)), Lista),
    keysort(Lista, Ordenada),
    reverse(Ordenada, Ranking).
