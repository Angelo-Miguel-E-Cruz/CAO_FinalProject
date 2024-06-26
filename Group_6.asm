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
msg7 db 10,13,'                  ********           Menu            ********$'
msg8 db 10,13,'                       Enter Your Choice: $'
msg31 db 10,13,'                       Enter 1 to See Menu Options $'
msg40 db 10,13,'                       Enter 0 to Exit $' 
msg34 db 10,13,'                       Pick Your Item: $'
msg35 db 10,13,'                       Enter Quantity: $'
msg36 db 10,13,'                       Invalid Input! Please Try Again.$'
msg37 db 10,13,'                       Order Price: Php $'
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
msg33 db 10,13,'                       Please Come Again!$'  
msg50 db 10,13,'                       Order Breakdown:$'
msg42 db 10,13,'                       Total Price:                Php $'
msg43 db 10,13,'                       Press 1 to Confirm Payment$'
msg44 db 10,13,'                       Press 0 to Cancel Order$'  
msg48 db 10,13,'                       Press 9 to Go Back$'
msg46 db 10,13,'                  Thank You for Ordering! Please Come Again!$'

;Total Price
totPrice dw 0  
currPrice dw 0
Price_str db '0000$', 0Ah
currPrice_str db '0000$', 0Ah  

;Check for first run
isFirstRun db 1
                                                     
;Space String
strSpace db 0Ah, 0Dh, '                       $', 0            
strSpace2 db '             Php $', 0

;Menu Strings
c1 db 'Regular Chicken$', 0  
c2 db 'Spicy Chicken  $', 0
c3 db 'Double Regular $', 0
c4 db 'Double Spicy   $', 0
c5 db 'Mixed Chicken  $', 0  

b1 db 'Regular Beef   $', 0
b2 db 'Spicy Beef     $', 0
b5 db 'Mixed Beef     $', 0

a1 db 'Extra Rice     $', 0
a2 db 'Coke           $', 0
a3 db 'Royal          $', 0
a4 db 'Sprite         $', 0
a5 db 'Mountain Dew   $', 0
a6 db 'Boiled Egg     $', 0

;Receipt
filename db "receipt.txt", 0
rec1 db "                   SALES REPORT             $", 0
rec2 db 0Dh, 0Ah
rec3 db "          Thank You for Ordering! Please Come Again!$", 0
rec4 db "             Total Price:       $", 0
fileHandle dw ?
ROrder db ?
    
;Arrays
arOrder db 10 * 20 dup('$')   
arPrice db 10 * 20 dup('$')

.code
main proc

    mov ax,@data
    mov ds,ax

    call Welcome ; welcome page

    call List ; Menu page
main endp   

toMultip proc
    call Multip
    call Rerun
    ret
toMultip endp

;Prices
Ten proc
    mov bl,1
    call toMultip
    ret
Ten endp

Twenty proc
    mov bl,2
    call toMultip
    ret
Twenty endp

Thirty proc
    mov bl,3
    call toMultip
    ret
Thirty endp
    
Fourty proc
    mov bl,4
    call toMultip
    ret
Fourty endp
    
Fifty proc
    mov bl,5
    call toMultip
    ret
Fifty endp

Sixty proc
    mov bl,6
    call toMultip
    ret
Sixty endp

Seventy proc
    mov bl,7
    call toMultip
    ret
Seventy endp

Eighty proc
    mov bl,8
    call toMultip
    ret
Eighty endp

Ninety proc
    mov bl,9
    call toMultip
    ret
Ninety endp

Hundred proc
    mov bl,10
    call toMultip
    ret
Hundred endp

OrderBreakdown proc
    lea di, arOrder
    lea si, arPrice
    mov cx, 10
    
    printLoop:
    cmp byte ptr [di], '$'
    je exitPrint
    
    mov ah, 9
    lea dx, strSpace
    int 21h
    
    lea dx, [di]
    int 21h 
    
    lea dx, strSpace2
    int 21h
    
    lea dx, [si]
    int 21h
    
    add di, 20
    add si, 20
                                  
    loop printLoop
    
    exitPrint:
    ret
OrderBreakdown endp

ReceiptOrderBreakdown proc
    lea di, arOrder
    lea si, arPrice
    mov cx, 10
    
    RprintLoop:
    cmp byte ptr [di], '$'
    je exitRPrint
    
    mov ah, 40h
    mov bx, fileHandle
    lea dx, strSpace
    mov cx, 15
    int 21h
    
    mov ah, 40h
    mov bx, fileHandle
    lea dx, [di]
    mov cx, 15
    int 21h 
    
    mov ah, 40h
    mov bx, fileHandle
    lea dx, strSpace2
    mov cx, 4
    int 21h

    mov ah, 40h
    mov bx, fileHandle    
    lea dx, [si]
    mov cx, 4
    int 21h
    
    add di, 20
    add si, 20
                                  
    loop RprintLoop
    
    exitRPrint:
    ret
ReceiptOrderBreakdown endp

Checkout proc
    call Newline
    call Newline
    call TotalPrice
        
    mov ah,9
        
    lea dx, msg50
    int 21h 
    
    call OrderBreakdown 
    call Newline 
    
    mov ah,9
    lea dx,msg42
    int 21h                 
    
    mov ax, totPrice
    
    cmp ax, 0
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
        call Newline 
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
        
	jz checkOutExit
    
        cmp bl, 1
        je checkOutExit  
            
        cmp bl, 9
        je checkOutBack  
            
        call Invalid
        jmp checkOutOptions
        
        checkOutExit:
    call Receipt
	call Exit

        checkOutBack:
	call Rerun    
    
    ret
Checkout endp

Multip proc 
    mov ax, 0
    mov currPrice, ax
    
    lea dx,msg35
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp ax, 0
    jge notInvalid
    
    cmp ax, 9
    jle notInvalid

    call Invalid

    notInvalid:    
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
                       
    lea si, currPrice_str
    call FindEmptyPrice
    call CopyOrder        
    ret
Multip endp

FindEmptyPrice proc
    lea di, arPrice
    mov cx, 10
    mov dx, 20
    
    findPriceLoop:
    cmp byte ptr [di], '$'
    je foundEmptyPrice
    
    add di, dx
    loop findPriceLoop
    
    foundEmptyPrice:
    ret
FindEmptyPrice endp

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
               
        jz earlyExit

        cmp bh,1
        je toList
        
        call Invalid
        call NewLine                 
        jmp MainPage

	toList:
	call List

    earlyExit:
	call Exit        
        ret
Welcome endp

CopyOrder proc  
    copyLoop:
        mov al, [si]
        mov [di], al
        inc si
        inc di
        cmp al, '$'  
        je endCopy
        jmp copyLoop
    endCopy:
    ret
CopyOrder endp

FindEmpty proc
    lea di, arOrder
    mov cx, 10
    mov dx, 20
    
    findLoop:
    cmp byte ptr [di], '$'
    je foundEmpty
    
    add di, dx
    loop findLoop
    
    foundEmpty:
    ret
FindEmpty endp

Chicken proc
    ChickenMenu:
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
        
        jz exitC
        
        cmp bl,1    
        je twentyC
        
        cmp bl,2     
        je thirtyC
        
        cmp bl, 3   
        je fourtyC
        
        cmp bl,4    
        je sixtyC
        
        cmp bl,5        
        je fiftyC 
        
        cmp bl,9
        je menuC

        call Invalid
        jmp ChickenMenu
        
	twentyC:   
	lea si, c1
	call FindEmpty
	call CopyOrder
	call Twenty
	
	thirtyC:   
	lea si, c2
	call FindEmpty
	call CopyOrder
	call Thirty

	fourtyC:                               
	lea si, c3
	call FindEmpty
	call CopyOrder
	call Fourty

	sixtyC:   
	lea si, c4
	call FindEmpty
	call CopyOrder 
	call Sixty

	fiftyC:   
	lea si, c5
	call FindEmpty
	call CopyOrder  
	call Fifty

	exitC:
	call Exit
	
	menuC:
	call List

	ret
Chicken endp

Beef proc
    BeefMenu:
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
        
        jz exitB
        
        cmp bl,1       
        je fourtyB
       
        cmp bl,2       
        je fiftyB
        
        cmp bl,3      
        je eightyB
        
        cmp bl,4       
        je hundredB
        
        cmp bl,5       
        je ninetyB
        
        cmp bl,9
        je menuB
        
        call Invalid
        jmp BeefMenu

	fourtyB:   
	lea si, b1
	call FindEmpty
	call CopyOrder
	call Fourty

	fiftyB:   
	lea si, b2
	call FindEmpty
	call CopyOrder 
	call Fifty

	eightyB:   
	lea si, c3 
	call FindEmpty
	call CopyOrder
	call Eighty

	hundredB:   
	lea si, c4  
	call FindEmpty
	call CopyOrder
	call Hundred

	ninetyB:   
	lea si, b5   
	call FindEmpty
	call CopyOrder  
	call Ninety
        
	exitB:
	call Exit

	menuB:
	call List 

	ret
Beef endp

Extra proc
    AddOnsMenu:
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
        
        jz exitE
        
        cmp bl,1     
        je twentyE
        
        cmp bl,2          
        je thirtyEC
        
        cmp bl,3            
        je thirtyER
        
        cmp bl,4            
        je thirtyES
        
        cmp bl,5     
        je fourtyE
        
        cmp bl,6      
        je tenE 
        
        cmp bl,9
        je menuE 
        
        call Invalid
        jmp AddOnsMenu
        
	twentyE:   
	lea si, a1   
	call FindEmpty
	call CopyOrder 
	call Twenty

	thirtyEC:
	lea si, a2  
    call FindEmpty
    call CopyOrder       
	call Thirty 

	thirtyER:
	lea si, a3  
    call FindEmpty
    call CopyOrder       
	call Thirty

	thirtyES:
	lea si, a4  
    call FindEmpty
    call CopyOrder       
	call Thirty

	fourtyE:     
	lea si, a5   
	call FindEmpty
	call CopyOrder
	call Fourty

	tenE:     
	lea si, a6    
	call FindEmpty
	call CopyOrder
	call Ten

	exitE:
	call Exit
	
	menuE:
	call List

	ret
Extra endp

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
        
        cmp isFirstRun, 0
        jne FirstRun    
        
        lea dx,msg49
        int 21h
        
        FirstRun:
        ;list choose
        lea dx,msg8
        int 21h
        
        mov ah,1
        int 21h
        mov bh,al
        sub bh,48
        
        jz menuExit
        
        cmp bh,1
        je toChicken
        
        cmp bh,2
        je toBeef
        
        cmp bh,3
        je toExtra
        
        cmp isFirstRun, 0
        jne FirstRunOptions
        
        cmp bh,4
        je toCheckOutM
        
        FirstRunOptions:
        call Invalid   
        jmp Menu

        toChicken:
        mov ah, 1
        cmp isFirstRun, 0
        jg subChicken
        
        callChicken:
        call Chicken
        
        subChicken:
        sub isFirstRun, ah  
        jmp callChicken

        toBeef:        
        mov ah, 1
        cmp isFirstRun, 0
        jg subBeef
        
        callBeef:
        call Beef
        
        subBeef:
        sub isFirstRun, ah  
        jmp callBeef

        toExtra:     
        mov ah, 1
        cmp isFirstRun, 0
        jg subExtra
        
        callExtra:
        call Extra
        
        subExtra:
        sub isFirstRun, ah  
        jmp callExtra
        
        menuExit:
	    call Exit

        toCheckOutM:
	    call Checkout
        ret
List endp

Receipt proc
    
    mov ah, 5bh ; open file function
    mov al, 02h ; open for write
    lea dx, filename ; point to filename
    int 21h ; call DOS
    mov fileHandle, ax ; save file handle

    ; write to file
    
    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec1 ; point to message
    mov cx, 31 ; number of bytes to write
    int 21h ; call DOS
    
    call ReceiptOrderBreakdown
    
    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec2 ; point to newline
    mov cx, 2 ; number of bytes to write (carriage return and line feed)
    int 21h

    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec2 ; point to newline
    mov cx, 2 ; number of bytes to write (carriage return and line feed)
    int 21h

    
    mov ah,40h
    mov bx, fileHandle ;
    lea dx, rec4
    mov cx, 32 
    int 21h                 
    
    mov ax, totPrice    
    mov ah,40h
    mov bx, fileHandle ;
    lea dx, Price_str
    mov cx, 4
    int 21h
        
    mov ah, 40h
    mov bx, fileHandle ;
    mov dx, "0"
    mov cx, 1
    int 21h

    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec2 ; point to newline
    mov cx, 2 ; number of bytes to write (carriage return and line feed)
    int 21h

    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec2 ; point to newline
    mov cx, 2 ; number of bytes to write (carriage return and line feed)
    int 21h

    mov ah, 40h ; write to file function
    mov bx, fileHandle ; file handle
    lea dx, rec3 ; point to message
    mov cx, 52 ; number of bytes to write
    int 21h ; call DOS

    ; close file
    mov ah, 3Eh ; close file function
    mov bx, fileHandle ; file handle
    int 21h ; call DOS
    ret 
        

Receipt endp
           
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
        
        jz finish
        
        cmp al,1
        je toMenu
        
        cmp al,2
        je toCheckoutR

        call Invalid 
        jmp TryAgain

	finish:
	call Exit
        
	toMenu:
	call List

	toCheckOutR:
	call Checkout

        ret
Rerun endp           
           
Exit proc 
    call NewLine
    call NewLine
     
    mov ah,9
    lea dx,msg46
    int 21h
    mov ah,4ch
    int 21h
Exit endp   
   
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