## GNSS C/A code generator

# define some functions
def shift(a,arr):
    leng = len(arr)
    arr = [a] + arr[:1] + arr[1:leng - 1]
    return arr

def g1_gen(arr):
    result = arr[2] ^ arr[9]
    return result

def g2_gen(arr):
    result = arr[1] ^ arr[2] ^ arr[5] ^ arr[7] ^ arr[8] ^ arr[9]
    return result

def g2(a, arr):
    match a:
        case 1:
            result = arr[1] ^ arr[5]
        case 2:
            result = arr[2] ^ arr[6]
        case 3:
            result = arr[3] ^ arr[7]
        case 4:
            result = arr[4] ^ arr[8]
        case 5:
            result = arr[0] ^ arr[8]
        case 6:
            result = arr[1] ^ arr[9]
        case 7:
            result = arr[0] ^ arr[7]
        case 8:
            result = arr[1] ^ arr[8]
        case 9:
            result = arr[2] ^ arr[9]
        case 10:
            result = arr[1] ^ arr[2]
        case 11:
            result = arr[2] ^ arr[3]
        case 12:
            result = arr[4] ^ arr[5]
        case 13:
            result = arr[5] ^ arr[6]
        case 14:
            result = arr[6] ^ arr[7]
        case 15:
            result = arr[7] ^ arr[8]
        case 16:
            result = arr[8] ^ arr[9]
        case 17:
            result = arr[0] ^ arr[3]
        case 18:
            result = arr[1] ^ arr[4]
        case 19:
            result = arr[2] ^ arr[5]
        case 20:
            result = arr[3] ^ arr[6]
        case 21:
            result = arr[4] ^ arr[7]
        case 22:
            result = arr[5] ^ arr[8]
        case 23:
            result = arr[0] ^ arr[2]
        case 24:
            result = arr[3] ^ arr[5]
        case 25:
            result = arr[4] ^ arr[6]
        case 26:
            result = arr[5] ^ arr[7]
        case 27:
            result = arr[6] ^ arr[8]
        case 28:
            result = arr[7] ^ arr[9]
        case 29:
            result = arr[0] ^ arr[5]
        case 30:
            result = arr[1] ^ arr[6]
        case 31:
            result = arr[2] ^ arr[7]
        case 32:
            result = arr[3] ^ arr[8]
    return result

# claim all the variables
rst = 0
G1_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
G2_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

## Circuit Input
rst = 1
prn_select = 1

# init the circuit
if (rst):
    G1_array = [1] * 10
    G2_array = [1] * 10
print(G2_array)

# Circuit Output
for x in range (0,10):

    CA_code = G1_array[9] ^ g2(prn_select , G2_array)
    G1_array = shift(g1_gen(G1_array),G1_array)
    G2_array = shift(g2_gen(G2_array),G2_array)
    print(CA_code)

