<declaração> -> <tipo> <lista_de_variáveis> ; <declaração_lista>

<declaração_lista> ->  <tipo> <lista_de_variáveis>; <declaração_lista> | lambda


<tipo> -> int | char | float | double

<lista_de_variáveis> -> <variável>, <lista_de_variáveis> | <variável>

<variável> ->  <nome> | <nome> <arranjo>
<arranjo> -> [ <número> ] <arranjo> | [ <número> ]

<nome> -> <caractere> <palavra>
<palavra> -> <caractere> <palavra_continuação>
                | <número> <palavra_constinuação>
<palavra_constinuação> -> <caractere> <palavra_continuação>
                | <número> <palavra_constinuação>
                | lambda

<caractere> -> a ... z | A ... Z
<número> -> <dígito> <número> | <dígito>
<dígito> -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9


//----------------------------------------------------------------------------------------------------

<atribuição> -> <variável> = <expressão> | <variável> = <chamada_de_método>

<expressão> -> <expressão_lógica_or>

<expressão_lógica_or> -> <expressão_lógica_and> || <expressão_lógica_or>
                            | <expressão_lógica_and>

<expressão_lógica_and> -> <expressão_lógica_not> && <expressão_lógica_and>
                            | <expressão_lógica_not>

<expressão_lógica_not> -> !<expressão_relacional>
                            | <expressão_relacional>

<expressão_relacional> -> <expressão_matemática> <operador_relacional> <expressão_matemática>
                            | <expressão_matemática>

<operador_relacional> -> < | > | <= | >= | == | !=

<expressão_matemática> ->  <termo> + <expressão_matemática>
                            | <termo> - <expressão_matemática>
                            | <termo>

<termo> -> <fator> * <termo>
            | <fator> / <termo>
            | <fator>

<fator> -> ( <expressão> )
            | <numero>
            | <variável>

//----------------------------------------------------------------------------------------------

<bloco_de_código> -> { <possibilidades_de_bloco> }
<possibilidades_de_bloco> -> <bloco_inicial> <restante_do_bloco>
<restante_do_bloco> -> <bloco_inicial> <restante_do_bloco> | lambda
<bloco_inicial> -> <declaração>
                 | <atribuição>
                 | <cláusula_if>
                 | <estrutura_while>
                 | <estrutura_for>
                 | <chamada_de_método>

//--------------------------------------------------------------------------------
<cláusula_if> -> if (<expressão>) <bloco_de_código> <lista_if>

<lista_if> -> else if (<expressão>) <bloco_de_código> <lista_if>
           | else <bloco_de_código>
           | lambda

<ternario> -> <expressão> ? <atribuição> : <atribuição>;
//--------------------------------------------------------------------------------
<início> -> int main() <bloco_de_código>

//--------------------------------------------------------------------------------
<estrutura_while> -> while( <expressão> ) <bloco_de_código>

<estrutura_while> -> do <bloco_de_código> while(<expressão>);
//--------------------------------------------------------------------------------
<estrutura_for> -> for( <inicialização> ; <teste> ; <incremento> ) <bloco_de_código>
<inicialização> -> <declaração> | <atribuição> | lambda
<teste> -> <expressão> | lambda
<incremento> -> <atribuição> | lambda

//--------------------------------------------------------------------------------

<lista_de_parâmetros> -> <tipo> <variável>, <lista_de_parâmetros> | <tipo> <variável>

<procedimento> -> void <nome> (<lista_de_parâmetros>) <bloco_de_código>

<função> -> <tipo> <nome> (<lista_de_parâmetros>) <bloco_de_código>

<chamada_de_método> -> <nome>(<lista_de_argumentos>) | <nome>();

<lista_de_argumentos> -> <nome> , <lista_de_argumentos> | <nome> | <expressão>, <lista_de_argumentos> | <expressão>
