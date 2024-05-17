.model large
.stack 1000h
.data

;welcome page
a1 db 10,13,'                   ******************************************$'
a2 db 10,13,'                   **                 Welcome              **$'
a3 db 10,13,'                   **                    To                **$'
a4 db 10,13,'                   **            Resturant Management      **$'
a5 db 10,13,'                   **                  System              **$'
a6 db 10,13,'                   ******************************************$'

;choose
a7 db 10,13,'                    Schedule---$'
a8 db 10,13,'                    Enter Your Choise: $'
a19 db 10,13,'                          Enter 1 to Display Schedule: $'
a34 db 10,13,'                            Peak Your Item: $'
a35 db 10,13,'                            Enter Quantity: $'
a36 db 10,13,'                        Invalid Input !! Rerun the Program$'
a37 db 10,13,'                            Total Price: $'
a38 db 10,13,'                    1.Schedule: $'
a39 db 10,13,'                    2.Exit: $'


;Schedulelist
a9 db 10,13,'                        1. Breakfast$'
a10 db 10,13,'                        2. Lunch$'
a11 db 10,13,'                        3. Dinner$'

;Breakfast List
a12 db 10,13,'                  ********      Breakfast List      ********$'
a13 db 10,13,'                       1.Paratha+Dal             50/-$'
a14 db 10,13,'                       2.Paratha+Vegetable       50/-$'
a15 db 10,13,'                       3.Paratha+Fried Egg       50/-$'
a16 db 10,13,'                       4.Luchi+Chicken Curry     50/-$'
a17 db 10,13,'                       5.Chicken Soup+Nan        50/-$'
a18 db 10,13,'                       6.Nehari+Nan              50/-$'


;Lunch List
a20 db 10,13,'                  ********        Lunch List        ********$'
a21 db 10,13,'                       1.Kachchi Birani          100/-$'
a22 db 10,13,'                       2.Chicken Birani          100/-$'
a23 db 10,13,'                       3.Chicken Bhuna Khichuri  100/-$'
a24 db 10,13,'                       4.Rice+Fish Curry         100/-$'
a25 db 10,13,'                       5.Rice+Chicken Curry      100/-$'
a26 db 10,13,'                       6.Rice+Beaf Curry         100/-$'


;Dinner List
a27 db 10,13,'                  ********        Dinner List       ********$'
a28 db 10,13,'                       1.Rice+Mutton Curry       200/-$'
a29 db 10,13,'                       2.Rice+Beef Curry         200/-$'
a30 db 10,13,'                       3.Polaw+Mutton Curry      200/-$'
a31 db 10,13,'                       4.Rice+Hilsha Fish Fry    200/-$'
a32 db 10,13,'                       5.Bottle Gourd Soup       200/-$'
a33 db 10,13,'                       6.Mixed Vegetable Soup    200/-$'
  
a100 db 10,13,'                        0. Exit$'
a101 db 10,13,'                    Tanginamo---$'
.code
main proc

mov ax,@data
mov ds,ax

call Welcome ; welcome page

call Sched ; schedule page
 
;Breakfast list
Breakfast:

;new line
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,a12
int 21h

call NewLine

mov ah,9
lea dx,a13
int 21h
lea dx,a14
int 21h
lea dx,a15
int 21h
lea dx,a16
int 21h
lea dx,a17
int 21h
lea dx,a18
int 21h  
lea dx,a100
int 21h

;condition checking
lea dx,a34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,6
jle fifty  

call Invalid
jmp Breakfast


Lunch:
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,a20
int 21h

call NewLine

mov ah,9
lea dx,a21
int 21h
lea dx,a22
int 21h
lea dx,a23
int 21h
lea dx,a24
int 21h
lea dx,a25
int 21h
lea dx,a26
int 21h 
lea dx,a100
int 21h

;condition checking
lea dx,a34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,6
jle Hundred 

call Invalid
jmp Lunch

Dinner:
call NewLine
call NewLine

;List Start
mov ah,9
lea dx,a27
int 21h

call NewLine

mov ah,9
lea dx,a28
int 21h
lea dx,a29
int 21h
lea dx,a30
int 21h
lea dx,a31
int 21h
lea dx,a32
int 21h
lea dx,a33
int 21h  
lea dx,a100
int 21h

;condition checking
lea dx,a34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

jz Exit

cmp bl,6
jle TwoHundred 

call Invalid
jmp Dinner

Fifty:
mov bl,5
call Multip

call Rerun

Hundred:
mov bl,10
call Multip

call Rerun

TwoHundred:
mov bl,20
call Multip

call Rerun

Exit:
call Alis
main endp   

Multip proc
lea dx,a35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48


lea dx,a37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h
ret
Multip endp

Welcome proc
MainPage:
mov ah,9
lea dx,a1
int 21h
lea dx,a2
int 21h
lea dx,a3
int 21h
lea dx,a4
int 21h
lea dx,a5
int 21h
lea dx,a6
int 21h

call NewLine
call NewLine

;take input to start
mov ah,9
lea dx,a19
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Schedule

call Invalid
call NewLine                 
jmp MainPage

ret
Welcome endp

Sched proc
Schedule:
call NewLine
call NewLine

mov ah,9
lea dx,a7
int 21h
lea dx,a9
int 21h
lea dx,a10
int 21h
lea dx,a11
int 21h   
lea dx,a100
int 21h

;list choose
lea dx,a8
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Breakfast

cmp bh,2
je Lunch

cmp bh,3
je Dinner

cmp bh,0
je Alis

call Invalid   
jmp Schedule
ret
Sched endp
           
Rerun proc   
TryAgain:
call NewLine

mov ah,9
lea dx,a38
int 21h

mov ah,9
lea dx,a39
int 21h

mov ah,9
lea dx,a8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

call Invalid 
jmp TryAgain
ret
Rerun endp           
           
Alis proc 
call NewLine
call NewLine 
mov ah,9
lea dx,a101
int 21h
mov ah,4ch
int 21h
Alis endp   
   
Invalid proc
call NewLine
call NewLine


mov ah,9
lea dx,a36
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