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
msg25 db 10,13,'                       1. Extra Rice                  Php 20$'
msg26 db 10,13,'                       2. Coke                        Php 30$'
msg27 db 10,13,'                       3. Royal                       Php 30$' 
msg28 db 10,13,'                       4. Sprite                      Php 30$'
msg29 db 10,13,'                       5. Mountain Dew                Php 40$'
msg30 db 10,13,'                       6. Boiled Egg                  Php 10$'

;Exit  
msg32 db 10,13,'                       0. Exit$'
msg33 db 10,13,'                    Please Come Again!$'
msg42 db 10,13,'                    Total Price: Php $'
msg43 db 10,13,'                    Press 1 to Confirm Payment$'
msg44 db 10,13,'                    Press 0 to Cancel Order$'  
msg48 db 10,13,'                    Press 9 to Go Back$'
msg46 db 10,13,'                    Thank You for Ordering! Please Come Again!$'

;Total Price
totPrice dd 0  
currPrice dd 0
Price_str db '0000$', 0Ah
currPrice_str db '0000$', 0Ah 

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
        jmp toMultip

    Twenty:
        mov bl,2
        jmp toMultip

    Thirty:
        mov bl,3
        jmp toMultip
        
    Fourty:
        mov bl,4
        jmp toMultip
        
    Fifty:
        mov bl,5
        jmp toMultip

    Sixty:
        mov bl,6
        jmp toMultip

    Seventy:
        mov bl,7
        jmp toMultip

    Eighty:
        mov bl,8
        jmp toMultip

    Ninety:
        mov bl,9
        jmp toMultip

    Hundred:
        mov bl,10
        jmp toMultip
    
    toMultip:
        call Multip
        call Rerun
    
    menuList:
        call List

    ;To Exit
    Exit:
        call Leave 

    ;Checkout
    Checkout:
        call Newline
        call Newline
        call TotalPrice
        
        mov ah,9
        lea dx,msg42
        int 21h              
        
        cmp totPrice, 0
        jnz printNum
        
        mov ah,2
        mov dl, "0"
        int 21h
        jmp checkOutOptions
        
        printNum:
            mov ah,9
            lea dx, Price_str
            int 21h
        
        checkOutOptions:
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
            
            cmp bl, 1
            jle Exit  
            
            cmp bl, 9
            je Back  
            
            call Invalid
            jmp checkOutOptions

    Back:
        call Rerun
main endp   

Multip proc 
    mov ax, 0
    mov currPrice, ax
    
    lea dx,msg35
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl
    
    mov cx, 10                                               
    mul cx 
  
    add totPrice, ax 
    add currPrice, ax 
     
    mov ax, currPrice
    
    mov si, offset currPrice_str
    
    mov cx, 10
    xor dx, dx
    div cx
    add dl, '0'
    mov [si+3], dl
    
    xor dx, dx
    div cx
    add dl, '0'       
    mov [si+2], dl 
    
    cmp ax, 0
    je moveCurrTwo   
     
    xor dx, dx
    div cx
    add dl, '0'
    mov [si+1], dl
    
    cmp ax, 0
    je moveCurrPrice

    add al, '0'
    mov [si], al 
    jmp printCurrPrice
    
    moveCurrPrice:
       mov al, [si+1]
       mov [si], al
        
       mov al, [si+2]
       mov [si+1], al
       
       mov al, [si+3]
       mov [si+2], al   
       
       mov byte ptr [si+3], '$'
       
       jmp printCurrPrice
       
    movecurrTwo:
       mov al, [si+3]
       mov [si+1], al
        
       mov al, [si+2]
       mov [si], al
       
       mov byte ptr [si+2], '$' 
       
       mov byte ptr [si+3], '$'
    
    printCurrPrice:
        mov ah,9
        lea dx,msg37
        int 21h
        
        cmp currPrice, 0
        jnz printPrice
        
        mov ah,2
        mov dl, "0"
        int 21h
        
        printPrice:
            mov ah,9
            lea dx, currPrice_str
            int 21h            
            
    ret
Multip endp

TotalPrice proc
    mov ax, totPrice
    
    mov si, offset Price_str
    
    mov cx, 10
    xor dx, dx
    div cx
    add dl, '0'
    mov [si+3], dl
    
    xor dx, dx
    div cx
    add dl, '0'
    mov [si+2], dl
    
    cmp ax, 0
    je move_twoSpots
    
    xor dx, dx
    div cx
    add dl, '0'
    mov [si+1], dl
  
    cmp ax, 0
    je move_totPrice
    
    add al, '0'
    mov [si], al 
    jmp doneTotPrice
    
    move_totPrice:
       mov al, [si+1]
       mov [si], al
        
       mov al, [si+2]
       mov [si+1], al
       
       mov al, [si+3]
       mov [si+2], al   
       
       mov byte ptr [si+3], '$'
       
       jmp doneTotPrice
       
    move_twoSpots:
       mov al, [si+3]
       mov [si+1], al
        
       mov al, [si+2]
       mov [si], al
       
       mov byte ptr [si+2], '$' 
       
       mov byte ptr [si+3], '$'
       
    doneTotPrice:
        ret
TotalPrice endp

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
        
        jz Leave
        
        cmp bh,1
        je Chicken
        
        cmp bh,2
        je Beef
        
        cmp bh,3
        je AddOns
        
        cmp bh,4
        je Checkout
        
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
           
Leave proc 
    call NewLine
    call NewLine
     
    mov ah,9
    lea dx,msg46
    int 21h
    mov ah,4ch
    int 21h
Leave endp   
   
Invalid proc
    call NewLine
    call NewLine
    
    mov ah,9
    lea dx,msg36
    int 21h     
    
    call NewLine
    call NewLine 
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