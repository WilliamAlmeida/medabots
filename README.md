# Medabots

Game baseado no anime Medabots em 2D

O estilo do jogo é batalhas por turnos, PVE não tem limite de tempo entre os turnos, no pvp tem 30 segundos.

**MOB**: Personagens (Medabots)

Equipe de até 3 Mobs.

Cada mob é formado por 4 medapeças: Núcleo, Braço Direito, Braço Esquerdo e Pernas.

Atributos dos Mobs e de suas Peças:

**HP**: Vida

**ATK**: Força usada para calcular a força das cartas

**DEF**: Resistência aos danos sofridos

**SPD**: Influência na ordem que o Mob irá atacar durante aquele turno

Esses atributos são resultados do somatório das peças do mob, que possui também mesmos atributos.

**Peças:**

Cada peça do mob tem cartas vinculadas que serão usadas na batalha, porém a quantidade depende do tipo da peça.

**Núcleo**: 2 Cartas
Braço Direito, Esquerdo e Pernas: 1 Carta

**As Cartas tem:**

**Custo de Energia**: Vai de 0-3

**Dano**: Ataque que o Mob irá usar e causar dano a um mob ou mais (inimigos)

**Escudo**: Fornece um escudo temporário durante o turno atual ou permanente até que o escudo seja reduzido a zero, podendo ser adicionado ao usuário da carta ou seus aliados

Efeitos que podem causar, mas irei escrever mais tarde.

**Turno:**

Quando o Turno começa é fornecido 3 pontos de energia para usar com as cartas, você pode iniciar com mais energia caso tenha lançado alguma carta no turno anterior que lhe dá mais energia no próximo turno.

Toda vez que troca de turno é randomizado o Deck de Cartas e fornecido sempre 5 cartas, com base nos Mobs vivo em sua equipe.
