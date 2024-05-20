.model small
.stack 1000h
.data

;Welcome
msg1 db 10,13,'                   ******************************************$'
msg2 db 10,13,'                   **                Welcome               **$'
msg3 db 10,13,'                   **                  To                  **$'
msg4 db 10,13,'                   **           Pastilan ni Itan           **$'
msg6 db 10,13,'                   ******************************************$'

;Choose
msg7 db 10,13,'                    Menu---$'
msg8 db 10,13,'                          Enter Your Choice: $'
msg31 db 10,13,'                          Enter 1 to See Menu Options $'
msg40 db 10,13,'                          Enter 0 to Exit $' 
msg34 db 10,13,'                          Pick Your Item: $'
msg35 db 10,13,'                          Enter Quantity: $'
msg36 db 10,13,'                        Invalid Input! Please Try Again.$'
msg37 db 10,13,'                          Order Price: Php $'
msg38 db 10,13,'                       1. Menu $'
msg39 db 10,13,'                       2. Proceed to Checkout $'
msg47 db 10,13,'                       9. Back $'
msg45 db 10,13,'                       0. Cancel Order$'

;Menu
msg9 db 10,13,'                       1. Chicken$'
msg10 db 10,13,'                       2. Beef$'
msg11 db 10,13,'                       3. Add-Ons/Drinks$'
msg49 db 10,13,'                       4. Proceed to Checkout$'

;Chicken List
msg12 db 10,13,'                  ********      Chicken Pastil      ********$'
msg13 db 10,13,'                       1. Regular Chicken             Php 20$'
msg14 db 10,13,'                       2. Spicy Chicken               Php 30$'
msg15 db 10,13,'                       3. Double Regular              Php 40$'
msg16 db 10,13,'                       4. Double Spicy                Php 60$'
msg17 db 10,13,'                       5. Mixed Chicken               Php 50$'

;Beef List
msg18 db 10,13,'                  ********        Beef Pastil       ********$'
msg19 db 10,13,'                       1. Regular Beef                Php 40$'
msg20 db 10,13,'                       2. Spicy Beef                  Php 50$'
msg21 db 10,13,'                       3. Double Regular              Php 80$'
msg22 db 10,13,'                       4. Double Spicy                Php 100$'
msg23 db 10,13,'                       5. Mixed Beef                  Php 90$'

;Add-Ons List
msg24 db 10,13,'                  ********      Add-Ons/Drinks      ********$'
msg25 db 10,13,'                       1. Extra Rice                  Php 20/-$'
msg26 db 10,13,'                       2. Coke                        Php 30/-$'
msg27 db 10,13,'                       3. Royal                       Php 30/-$' 
msg28 db 10,13,'                       4. Sprite                      Php 30/-$'
msg29 db 10,13,'                       5. Mountain Dew                Php 40/-$'
msg30 db 10,13,'                       6. Boiled Egg                  Php 10/-$'

;Exit  
msg32 db 10,13,'                       0. Exit$'
msg33 db 10,13,'                    Please Come Again!$'
msg42 db 10,13,'                    Total Price: Php $'
msg43 db 10,13,'                    Press 1 to Confirm Payment$'
msg44 db 10,13,'                    Press 0 to Cancel Order$'  
msg48 db 10,13,'                    Press 9 to Go Back$'
msg46 db 10,13,'                    Thank You for Ordering! Please Come Again!$'

;Total Price
totPrice db 0
Price_str db '000$', 0Ah
currPriceL db 0
currPriceH db 0 
temp db 0

.code
main proc

mov ax,@data
mov ds,ax

call Welcome ; welcome page

call List ; Menu page
 
;Chicken list
Chicken:

;new line
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,msg12
int 21h

call NewLine

mov ah,9
lea dx,msg13
int 21h
lea dx,msg14
int 21h
lea dx,msg15
int 21h
lea dx,msg16
int 21h
lea dx,msg17
int 21h   
lea dx,msg32
int 21h    
lea dx,msg47
int 21h

;condition checking
lea dx,msg34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,1
je twenty

cmp bl,2
je thirty

cmp bl,3
je fourty

cmp bl,4
je sixty

cmp bl,5
je fifty 

cmp bl,9
je menuList 

call Invalid
jmp Chicken

;Beef List
Beef:
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,msg18
int 21h

call NewLine

mov ah,9
lea dx,msg19
int 21h
lea dx,msg20
int 21h
lea dx,msg21
int 21h
lea dx,msg22
int 21h
lea dx,msg23
int 21h
lea dx,msg32
int 21h   
lea dx,msg47
int 21h

;condition checking
lea dx,msg34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,1
je fourty

cmp bl,2
je fifty

cmp bl,3
je eighty

cmp bl,4
je hundred

cmp bl,5
je ninety 

cmp bl,9
je menuList   

call Invalid
jmp Beef

AddOns:
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,msg24
int 21h

call NewLine

mov ah,9
lea dx,msg25
int 21h
lea dx,msg26
int 21h
lea dx,msg27
int 21h
lea dx,msg28
int 21h
lea dx,msg29
int 21h 
lea dx,msg30
int 21h 
lea dx,msg32
int 21h   
lea dx,msg47
int 21h

;condition checking
lea dx,msg34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,1
je twenty

cmp bl,2
je thirty

cmp bl,3
je thirty

cmp bl,4
je thirty

cmp bl,5
je fourty 

cmp bl,6
je ten 

cmp bl,9
je menuList 

call Invalid
jmp AddOns


;Prices
Ten:
mov bl,1
call Multip

call Rerun

Twenty:
mov bl,2
call Multip

call Rerun

Thirty:
mov bl,3
call Multip

call Rerun

Fourty:
mov bl,4
call Multip

call Rerun

Fifty:
mov bl,5
call Multip

call Rerun

Sixty:
mov bl,6
call Multip

call Rerun

Seventy:
mov bl,7
call Multip

call Rerun

Eighty:
mov bl,8
call Multip

call Rerun

Ninety:
mov bl,9
call Multip

call Rerun

Hundred:
mov bl,10
call Multip

call Rerun

menuList:
call List

;To Exit
Exit:
call Alis 


;Checkout
Checkout:
leave: 
call Newline
call Newline
call TotalPrice

mov ah,9
lea dx,msg42
int 21h              

mov ah,9
lea dx, Price_str
int 21h

mov ah,9
lea dx,msg43
int 21h   

mov ah,9
lea dx,msg44
int 21h

mov ah,9
lea dx,msg48
int 21h 

mov ah,9
lea dx,msg8
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl, 9
je Back

cmp bl, 1
jne inv  

call Newline
call Newline 
mov ah,9
lea dx, msg46
int 21h
mov ah,4ch
int 21h     

Back:
call Rerun

Inv:
call Invalid
jmp leave

main endp   

Multip proc
lea dx,msg35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam               

mov [currPriceL], al
mov [currPriceH], ah

mov cx, 10                                               
mul cx
add totPrice, al

mov al, [currPriceL]
mov ah, [currPriceH]

mov cx,ax
add ch,48
add cl,48

lea dx,msg37
mov ah,9
int 21h

mov ah,2
mov dl,ch

int 21h
mov dl,cl
int 21h

mov dl,'0'
int 21h   

ret
Multip endp

TotalPrice proc
mov al, [totPrice]
xor ah, ah
aam

mov si, offset Price_str

add al, '0'
mov [si+2], al

mov al, ah
xor ah, ah
aam
add al, '0'
mov [si+1], al

add ah, '0'
mov [si], ah
ret
TotalPrice endp

mov ah,2
mov dl, [si]
int 21h

Welcome proc
MainPage:
mov ah,9
lea dx,msg1
int 21h
lea dx,msg2
int 21h
lea dx,msg3
int 21h
lea dx,msg4
int 21h
lea dx,msg6
int 21h

call NewLine
call NewLine

;take input to start
mov ah,9
lea dx,msg31
int 21h 
lea dx,msg40
int 21h  
lea dx,msg8
int 21h     

mov ah,1
int 21h
mov bh,al
sub bh,48
       
jz Exit

cmp bh,1
je Menu

call Invalid
call NewLine                 
jmp MainPage

ret
Welcome endp

List proc
Menu:
call NewLine
call NewLine

mov ah,9
lea dx,msg7
int 21h
lea dx,msg9
int 21h
lea dx,msg10
int 21h
lea dx,msg11
int 21h   
lea dx,msg32
int 21h   
lea dx,msg49
int 21h

;list choose
lea dx,msg8
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

jz Alis

cmp bh,1
je Chicken

cmp bh,2
je Beef

cmp bh,3
je AddOns

cmp bh,4
je Leave

call Invalid   
jmp Menu
ret
List endp
           
Rerun proc   
TryAgain:
call NewLine

mov ah,9
lea dx,msg38
int 21h

mov ah,9
lea dx,msg39
int 21h   

mov ah,9
lea dx, msg45
int 21h    

mov ah,9
lea dx,msg8
int 21h

mov ah,1
int 21h
sub al,48

jz Exit

cmp al,1
je Menu

cmp al,2
je Checkout

call Invalid 
jmp TryAgain
ret
Rerun endp           
           
Alis proc 
call NewLine
call NewLine
 
mov ah,9
lea dx,msg33
int 21h
mov ah,4ch
int 21h
Alis endp   
   
Invalid proc
call NewLine
call NewLine


mov ah,9
lea dx,msg36
int 21h    
ret
Invalid endp

NewLine proc
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
ret
NewLine endp   

end main