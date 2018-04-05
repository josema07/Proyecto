require "colorize"

def get_keypressed()
    system("stty raw -echo")
    t = STDIN.getc
    system("stty -raw echo")
    t

end
#🐵🐼
#-------------------------llenar tablero------------------------
def rellenar_tablero(ancho,matriz,bear_ran,panda_ran)
    for i in 0..14 do
        matriz[i] = []
        for j in 0..ancho - 1 do #valor por parametro 
            matriz[i][j] = "🎍".colorize(:green)
        end
    end
    bears(ancho,matriz,bear_ran)
    panda(ancho,matriz,panda_ran)
    cosecha(ancho,matriz)  

end

def mostrar(matriz)
    for i in 0..14 do
        print "| " + matriz[i].join("  | ") + "  |"
        puts
    end

end

def bears(ancho,matriz,bear_ran)
    contador = 0
    r = 0
    while contador < bear_ran 
        r = rand(ancho)
        if matriz[0][r] != "🐻"
            matriz[0][r] = "🐻"
            contador += 1
        end
    end

end

def panda(ancho,matriz,panda_ran)
    contador = 0
    r = 0
    while contador < panda_ran 
        r = rand(ancho)
        if matriz[13][r] != "🐼"
            matriz[13][r] = "🐼"
            contador += 1
        end
    end
end

def cosecha(ancho,matriz)
    for i in 0..14 do
        for j in 0..ancho - 1 do
            matriz[14][j] = "🍯".colorize(:yellow)
        end
    end

end
#-------------------------------jugadas del oso--------------------------------
def plays()

end

def bear_down(ancho,matriz)
    for i in 0..14 do
        for j in 0..ancho - 1 do
            
        end
    end
     mostrar(matriz)

end

def main()
    ancho = 0
    bear_ran = 0
    panda_ran = 0
    loop do
        print "Digite el ancho del tablero, sabiendo que la cantidad menor es 5: "
        ancho = gets.chomp.to_i
        break if ancho > 4
    end
    loop do
        print "Digite la cantidad de osos que desea: "
        bear_ran = gets.chomp.to_i
        break if bear_ran <= ancho
    end
    loop do 
        print "Dijite la cantidad de pandas que desea: "
        panda_ran = gets.chomp.to_i
        break if panda_ran <= ancho
    end
    puts "Los controles para jugar son: 
    s: bajar
    a: izquierda
    d: derecha"
    matriz = []
    rellenar_tablero(ancho,matriz,bear_ran,panda_ran)
    bear_down(ancho,matriz)
end
main()