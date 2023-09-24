# Program Hitung Komponen di Python
### Muhammad Alfan Irsyadi Hutagalung - [190803102]
https://instagram.com/alfanirsyadi_/


```python
import numpy as np
```


```python
msisi = np.array([
    [1, 4],
    [5, 7],
    [3, 4],
    [2, 3],
    [5, 6],
    [7, 8],
    [1, 2],
    [6, 8],
])
```


```python
def hitung_komponen(matriks_sisi, banyak_titik):
    banyak_komponen = banyak_titik
    komponen = np.arange(1, banyak_komponen+1)        
    for sisi_ke_i in matriks_sisi:
        a , b = sisi_ke_i # contoh: jika sisi ke-i = (1,2), maka a = 1 dan b = 2
        if komponen[a-1] != komponen[b-1]:            
            banyak_komponen -= 1
            mini, maxi = komponen[a-1], komponen[b-1]            
            if mini > maxi:
                mini, maxi = maxi, mini # tukar tempat
            komponen[maxi-1] = komponen[mini-1]        
            for titik in range(1, banyak_titik+1):
                if komponen[titik-1] == maxi:                    
                    komponen[titik-1] = mini        
    return banyak_komponen, komponen
```


```python
banyak_komponen, komponen = hitung_komponen(msisi, 8)
print(f'Banyak komponen : {banyak_komponen}')
print(f'Komponen        : {komponen}')
```

    Banyak komponen : 2
    Komponen        : [1 1 1 1 5 5 5 5]
    

# Source Code in MATLAB (.m)

```Matlab
% Source code by M Alfan Irsyadi Htg
% NOTE : source code belum tentu sama persis dengan punnya pak saib

function [hitung, komponena] = hitung_komponen(matriks_sisi, banyak_titik)
banyak_sisi = size(matriks_sisi,1); 
hitung_komponen = banyak_titik; 
komponen = 1:banyak_titik;
for sisi = 1:banyak_sisi
    ujung_kiri = matriks_sisi(sisi,1); ujung_kanan = matriks_sisi(sisi,2);
    if komponen(ujung_kiri) ~= komponen(ujung_kanan)        
        hitung_komponen =  hitung_komponen-1;
        mini = komponen(ujung_kiri); maxi= komponen(ujung_kanan);
        if mini > maxi
            mini = komponen(ujung_kanan);
            maxi = komponen(ujung_kiri);
        end
        komponen(maxi) = komponen(mini);
        for i = 1:banyak_titik
            if komponen(i) == maxi
                komponen(i) = komponen(mini);
            end
        end
    end    
end
hitung = hitung_komponen; komponena = komponen;
end
```
