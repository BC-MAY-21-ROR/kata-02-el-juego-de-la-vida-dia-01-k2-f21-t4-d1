@rows = gets.to_i
@cols = gets.to_i

@matriz = []
@matrizpuntos = []

#llenar matrizpuntos de ceros
@rows.times do
  row = []
  @cols.times do
    row.push(0)
  end
  @matrizpuntos.push(row)
end

#llenar matriz de celulas vivas ■ o muertas □
@rows.times do
  @row = []
  @cols.times do
    if rand(5) == 1
      @row.push('■')
    else
      @row.push('□')
    end
  end
  @matriz.push(@row)
end

def imprimir(matriz)
  @rows.times do |r|
    @cols.times do |c|
      print matriz[r][c]
    end
    puts ''
  end
end

def sumarUno(r, c)
  if r >= 0 and r < @rows and c >= 0 and c < @cols
    @matrizpuntos[r][c] += 1
  end
end

def puntuar
  @rows.times do |r|
    @cols.times do |c|
      if @matriz[r][c] == '■'
        sumarUno(r-1, c-1)
        sumarUno(r-1, c)
        sumarUno(r-1, c+1)

        sumarUno(r, c-1)
        sumarUno(r, c+1)

        sumarUno(r+1, c-1)
        sumarUno(r+1, c)
        sumarUno(r+1, c+1)
      end
    end
  end
end

puntuar




# print @matrizpuntos

imprimir(@matriz)
imprimir(@matrizpuntos)