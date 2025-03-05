import random
import time

SIZE = 100

def sumar_posiciones_siguientes(arr):
    resultado = [arr[i] + arr[i + 1] for i in range(len(arr) - 1)]
    return resultado

def main():
    arr = [random.randint(0, 99) for _ in range(SIZE)]

    start_time = time.time()
    resultado = sumar_posiciones_siguientes(arr)
    end_time = time.time()

    time_taken = end_time - start_time


    # print("Arreglo original:")
    # print(arr)
    # print("Resultado de la suma de cada elemento con el siguiente:")
    # print(resultado)

    print(f"La suma tomó {time_taken:.6f} segundos en ejecutarse")

if __name__ == "__main__":
    main()
