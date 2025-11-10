# Estudando o neovim

## Modo Visual Block
#### Selecionar blocos retangulares de texto
CTRL + V: Ativa o modo Visual Block, permitindo selecionar blocos retangulares de texto.

Estando neste modo:
- Se pressionar 'I' (letra i maiúscula), você pode inserir texto no início de cada linha selecionada.
- Se pressionar 'A' (letra a maiúscula), você pode adicionar texto ao final de cada linha selecionada.
- Se pressionar 'D', você pode deletar o bloco selecionado.
- Se pressionar 'C', você pode substituir o bloco selecionado com novo texto.
- Se pressionar 'X', você pode cortar o bloco selecionado.
- Se pressionar 'Y', você pode copiar o bloco selecionado.
- Se pressionar 'P', você pode colar o conteúdo copiado ou cortado antes do bloco selecionado.
- Se pressionar 'p', você pode colar o conteúdo copiado ou cortado após o bloco selecionado.
- Se pressionar 'U', você pode desfazer a última ação realizada no bloco selecionado.
- Se pressionar 'CTRL + R', você pode refazer a última ação desfeita no bloco selecionado.
- Após digitar o texto desejado, pressione 'ESC' para aplicar a inserção ou adição em todas as linhas selecionadas.

## Modo Normal
#### Selecionar todo o conteúdo do arquivo
ggVG: Move o cursor para o início do arquivo (gg), seleciona até o final

- Pressione a tecla Esc para garantir que você esteja no modo normal.
- Pressione gg: Isso move o cursor para a primeira linha do arquivo.
- Pressione VG (Shift + v, seguido de Shift + g):
- - V entra no modo visual de linha (seleciona a linha inteira onde o cursor está).
- - G move o cursor para a última linha do arquivo, estendendo a seleção para incluir todas as linhas do documento.
