.386
.model flat, stdcall 
option casemap:none

incude windows.inc
include user32.inc
include kernel32.inc
includelib user32.lib
includelib kernel32.lib

.data 
	message db "Hello, World!", 0
	caption db "HelloWorld", 0

.code
main proc
	
	sub rsp, 28h		;allocated shadow space for function calls 

	move rcx, 0			;handle to parent window (NULL)
	lea rdx, [CAP]	; Second param :dialog title 
	lea r8, [Hello world]	; 3rd param : dialog message
	mov r9d, 0			; 4th param : MB_OK

	call MessageBoxA	; call the MessageBoxA api

	add rsp, 28h		;clean up shadow space

	mov ecx, 0			; exit code 
	call ExitProcess	; Terminate the application 

main endp

end
